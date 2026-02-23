*** Settings ***
Documentation     Tarefa principal para automação do PJe-Calc.
...               Orquestra a execução chamando keywords dos arquivos de recurso.

Resource          ../resources/main_window.resource.robot
Resource          ../resources/dados_calculo.resource.robot

Library           ../libraries/pje_data_provider.py

*** Tasks ***
Criar E Preencher Novo Calculo Trabalhista
    # Busca dados do CSV calc_0000123.csv
    ${dados_processo}=    Obter Dados Para Calculo    0000123

    Abrir PJe-Calc
    Navegar Para Novo Calculo
    Preencher Aba Dados Do Processo      ${dados_processo}
    # Preencher Aba Parametros Do Calculo  ${dados_processo}
    # Salvar Dados Do Calculo
    # Fechar PJe-Calc
