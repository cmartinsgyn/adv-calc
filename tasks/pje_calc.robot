*** Settings ***
Documentation     Tarefa principal para automação do PJe-Calc.
...               Orquestra a execução chamando keywords dos arquivos de recurso.

Resource          ../resources/main_window.resource.robot
Resource          ../resources/dados_calculo.resource.robot

Library           ../libraries/pje_data_provider.py

*** Tasks ***
Criar E Preencher Novo Calculo Trabalhista
    ${dados_processo}=    Obter Dados Para Calculo

    Abrir PJe-Calc
    # Navegar Para Novo Calculo
    # Preencher Aba Dados Do Processo      ${dados_processo}
    # Preencher Aba Parametros Do Calculo  ${dados_processo}
    # Salvar Dados Do Calculo
    Sleep    3s
    Fechar PJe-Calc