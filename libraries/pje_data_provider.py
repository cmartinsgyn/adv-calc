from dataclasses import dataclass
from datetime import date
import glob
import os
import string
import urllib.request

@dataclass
class DadosProcesso:
    """Estrutura para conter os dados de um processo trabalhista."""
    numero_processo: str
    nome_reclamante: str
    nome_reclamado: str
    uf: str
    municipio: str
    data_admissao: date
    data_demissao: date
    data_ajuizamento: date
    maior_remuneracao: float
    # Adicionar outros campos conforme necessário (faltas, férias, verbas, etc.)

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


def obter_dados_para_calculo() -> DadosProcesso:
    """
    Fornece um objeto com todos os dados necessários para um cálculo.
    No futuro, esta função pode ler dados de um arquivo Excel, banco de dados, etc.
    """
    return DadosProcesso(
        numero_processo="0000123-45.2025.5.18.0012",
        nome_reclamante="José da Silva",
        nome_reclamado="Construtora Exemplo S.A.",
        uf="GO",
        municipio="Goiânia",
        data_admissao=date(2022, 1, 15),
        data_demissao=date(2024, 12, 20),
        data_ajuizamento=date(2025, 2, 5),
        maior_remuneracao=3500.00,
    )