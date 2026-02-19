*** Settings ***
Documentation     Keywords para interagir com a janela principal do PJe-Calc.

Library           RPA.Windows
Library           Process
Library           OperatingSystem
Library           ../libraries/pje_data_provider.py

*** Variables ***
${PJE_CALC_URL}               http://localhost:9257/pjecalc/pages/principal.jsf
${PJE_CALC_WINDOW_LOCATOR}    name:"PJe-Calc Cidadão"
${PJE_CALC_SERVER_WAIT}       15s    # Tempo para o servidor local subir após o .bat

*** Keywords ***
Abrir PJe-Calc
    Log To Console    Localizando instalação do PJe-Calc...
    ${bat_path}=      Localizar Bat Pjecalc
    Log To Console    Arquivo .bat encontrado: ${bat_path}
    Executar Bat PJeCalc    ${bat_path}
    Abrir URL No Navegador
    Aguardar Janela Principal

Executar Bat PJeCalc
    [Arguments]    ${bat_path}
    Log To Console    Iniciando servidor PJe-Calc via: ${bat_path}
    Start Process    cmd    /c    ${bat_path}    alias=pjecalc_server    shell=True
    Log To Console    Aguardando ${PJE_CALC_SERVER_WAIT} para o servidor subir...
    Sleep    ${PJE_CALC_SERVER_WAIT}

Abrir URL No Navegador
    Log To Console    Abrindo PJe-Calc no navegador: ${PJE_CALC_URL}
    Start Process    python    -m    webbrowser    -t    ${PJE_CALC_URL}

Aguardar Janela Principal
    Log To Console    Aguardando janela principal do PJe-Calc...
    Wait Until Keyword Succeeds    20x    2s    Control Window    ${PJE_CALC_WINDOW_LOCATOR}

Fechar PJe-Calc
    Log To Console    Fechando PJe-Calc...
    Run Keyword And Ignore Error    Close Window    ${PJE_CALC_WINDOW_LOCATOR}
    Run Keyword And Ignore Error    Terminate Process    pjecalc_server

Navegar Para Novo Calculo
    Log To Console    Clicando em 'Criar Novo Cálculo'...
    # Seletor placeholder. Precisa ser confirmado com Inspect.exe ou ferramenta similar
    Click    name:"Criar Novo Cálculo"
