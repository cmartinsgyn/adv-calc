from dataclasses import dataclass
from datetime import date
import glob
import os
import string

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