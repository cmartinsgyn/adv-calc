from dataclasses import dataclass
from datetime import date
import glob
import os
import string
import urllib.request
import csv

@dataclass
class DadosProcesso:
    """Estrutura para conter os dados de um processo trabalhista."""
    numero_processo: str
    digito: str
    ano: str
    tribunal: str
    vara: str
    valor_da_causa: str
    
    reclamante_nome: str
    reclamante_doc_fiscal: str
    reclamante_doc_prev: str
    
    reclamante_adv_nome: str
    reclamante_adv_oab: str
    reclamante_adv_doc_fiscal: str
    
    reclamado_nome: str
    reclamado_doc_fiscal: str
    
    reclamado_adv_nome: str
    reclamado_adv_oab: str
    reclamado_adv_doc_fiscal: str
    data_autuacao: str

def localizar_bat_pjecalc() -> str:
    """
    Busca o arquivo iniciarPjeCalc.bat em todas as partições disponíveis.
    Procura pelo padrão pjecalc-windows64-* em até 2 níveis a partir da raiz
    de cada unidade, evitando varredura completa do disco.
    Retorna o caminho completo encontrado ou lança FileNotFoundError.
    """
    bat_filename = "iniciarPjeCalc.bat"
    folder_pattern = "pjecalc-windows64-*"

    drives = [
        f"{letra}:\\"
        for letra in string.ascii_uppercase
        if os.path.exists(f"{letra}:\\")
    ]

    # Padrões de profundidade: raiz, 1 nível e 2 níveis intermediários
    depth_patterns = [
        "{drive}{folder}\\{bat}",
        "{drive}*\\{folder}\\{bat}",
        "{drive}*\\*\\{folder}\\{bat}",
    ]

    for drive in drives:
        for pattern_template in depth_patterns:
            pattern = pattern_template.format(
                drive=drive,
                folder=folder_pattern,
                bat=bat_filename,
            )
            matches = glob.glob(pattern)
            if matches:
                return matches[0]

    raise FileNotFoundError(
        f"'{bat_filename}' não encontrado em nenhuma partição. "
        f"Verifique se o PJe-Calc está instalado e se a pasta segue o padrão '{folder_pattern}'."
    )


def verificar_servidor_rodando(url: str = "http://localhost:9257/pjecalc/pages/principal.jsf") -> bool:
    """
    Faz uma requisição HTTP à URL do PJe-Calc.
    Retorna True se o servidor já está respondendo, False caso contrário.
    """
    try:
        urllib.request.urlopen(url, timeout=3)
        return True
    except Exception:
        return False


def detectar_navegador_padrao() -> str:
    """
    Detecta o navegador padrão do Windows via registro.
    Retorna o nome no formato aceito pelo Selenium: 'Chrome', 'Edge', 'Firefox'.
    Retorna 'Chrome' como fallback caso não consiga detectar.
    """
    try:
        import winreg
        with winreg.OpenKey(
            winreg.HKEY_CURRENT_USER,
            r"Software\Microsoft\Windows\Shell\Associations\UrlAssociations\http\UserChoice"
        ) as key:
            prog_id, _ = winreg.QueryValueEx(key, "ProgId")
            prog_id = prog_id.lower()
            if "chrome" in prog_id:
                return "Chrome"
            elif "msedge" in prog_id or "edge" in prog_id:
                return "Edge"
            elif "firefox" in prog_id:
                return "Firefox"
            elif "opera" in prog_id:
                return "Opera"
            elif "brave" in prog_id:
                return "Chrome"  # Brave usa ChromeDriver
            else:
                return "Chrome"
    except Exception:
        return "Chrome"


def eh_browser_chromium(navegador: str) -> bool:
    """Retorna True se o navegador é baseado em Chromium (suporta --remote-debugging-port)."""
    return navegador.lower() in ("chrome", "edge", "opera")


def verificar_debug_ativo(porta: int = 9222) -> bool:
    """
    Verifica se há um browser Chromium rodando com remote debugging na porta.
    Retorna True se a porta responde, False caso contrário.
    """
    try:
        urllib.request.urlopen(f"http://localhost:{porta}/json", timeout=2)
        return True
    except Exception:
        return False


def confirmar_nova_sessao() -> bool:
    """
    Exibe caixa de confirmação Windows (Sim/Não) perguntando se deve abrir
    outra sessão do PJe-Calc além da que já está aberta.
    Retorna True se o usuário escolheu SIM, False se escolheu NÃO.

    Flags Windows API:
      MB_YESNO (0x4) + MB_ICONQUESTION (0x20) = 0x24
      IDYES = 6 | IDNO = 7
    """
    try:
        import ctypes
        resultado = ctypes.windll.user32.MessageBoxW(
            0,
            "Já existe uma sessão do PJe-Calc aberta no navegador.\n\n"
            "Deseja abrir outra sessão e fazer um novo cálculo?",
            "PJe-Calc — Sessão já ativa",
            0x24,  # MB_YESNO | MB_ICONQUESTION
        )
        return resultado == 6  # IDYES = 6
    except Exception:
        return False  # Ambiente não-Windows: não abre nova sessão por segurança


def criar_opcoes_novo(navegador: str, porta: int = 9222, com_debug_port: bool = True):
    """
    Retorna Options para abrir novo browser.
    Para Chromium com com_debug_port=True: habilita remote debugging para detecção futura.
    com_debug_port=False: abre sem debug port (usado quando a porta já está em uso).
    Para Firefox: retorna options padrão (sem debug port).
    """
    if navegador.lower() == "edge":
        from selenium.webdriver.edge.options import Options
        options = Options()
        if com_debug_port:
            options.add_argument(f"--remote-debugging-port={porta}")
    elif navegador.lower() == "firefox":
        from selenium.webdriver.firefox.options import Options
        options = Options()
    else:  # chrome, opera, brave
        from selenium.webdriver.chrome.options import Options
        options = Options()
        if com_debug_port:
            options.add_argument(f"--remote-debugging-port={porta}")
    return options


def obter_dados_para_calculo(numero_busca: str = "0000123") -> DadosProcesso:
    """
    Busca dados em um arquivo CSV na pasta do projeto baseado no número do processo.
    O arquivo deve seguir o padrão calc_XXXXXXX.csv.
    """
    filename = f"calc_{numero_busca}.csv"
    filepath = os.path.join(os.getcwd(), filename)
    
    if not os.path.exists(filepath):
        # Fallback para dados fixos se o arquivo não existir (para testes iniciais)
        return DadosProcesso(
            numero_processo="0000123",
            digito="45",
            ano="2025",
            tribunal="18",
            vara="0012",
            valor_da_causa="50000,00",
            reclamante_nome="José da Silva",
            reclamante_doc_fiscal="12345678901",
            reclamante_doc_prev="12345678901",
            reclamante_adv_nome="Dr. Advogado Reclamante",
            reclamante_adv_oab="123456",
            reclamante_adv_doc_fiscal="26375286050",
            reclamado_nome="Construtora Exemplo S.A.",
            reclamado_doc_fiscal="12345678000199",
            reclamado_adv_nome="Dra. Advogada Reclamada",
            reclamado_adv_oab="654321",
            reclamado_adv_doc_fiscal="91036537064",
            data_autuacao="20022026"
        )

    dados_dict = {}
    with open(filepath, mode='r', encoding='utf-8') as csvfile:
        reader = csv.reader(csvfile, delimiter=';')
        for row in reader:
            if len(row) == 2:
                dados_dict[row[0].strip()] = row[1].strip()

    return DadosProcesso(
        numero_processo=dados_dict.get("Identificacao do Processo_Numero", ""),
        digito=dados_dict.get("Identificacao do Digito", ""),
        ano=dados_dict.get("Identificacao do Ano", ""),
        tribunal=dados_dict.get("Identificacao do Tribunal", ""),
        vara=dados_dict.get("Identificacao do Vara", ""),
        valor_da_causa=dados_dict.get("Identificacao do Valor da Causa", ""),
        reclamante_nome=dados_dict.get("Reclamante_Nome", ""),
        reclamante_doc_fiscal=dados_dict.get("Reclamante_Documento_Fiscal_Numero", ""),
        reclamante_doc_prev=dados_dict.get("Reclamante_Documento_Previdenciario_Numero", ""),
        reclamante_adv_nome=dados_dict.get("Reclamante_Advogado_Nome", ""),
        reclamante_adv_oab=dados_dict.get("Reclamante_Advogado_OAB", ""),
        reclamante_adv_doc_fiscal=dados_dict.get("Reclamante_Advogado_Documento_Fiscal_Numero", ""),
        reclamado_nome=dados_dict.get("Reclamado_Nome", ""),
        reclamado_doc_fiscal=dados_dict.get("Reclamado_Documento_Fiscal_Numero", ""),
        reclamado_adv_nome=dados_dict.get("Reclamado_Advogado_Nome", ""),
        reclamado_adv_oab=dados_dict.get("Reclamado_Advogado_OAB", ""),
        reclamado_adv_doc_fiscal=dados_dict.get("Reclamado_Advogado_Documento_Fiscal_Numero", ""),
        data_autuacao=dados_dict.get("Identificacao do Processo_Autuado_em", "")
    )
