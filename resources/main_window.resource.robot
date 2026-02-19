*** Settings ***
Documentation     Keywords para interagir com a janela principal do PJe-Calc.
...               O PJe-Calc é uma aplicação web JSF — toda automação de página
...               usa RPA.Browser.Selenium. O .bat inicia o servidor local Java.
...               O browser padrão do Windows é detectado automaticamente.
...               Se já houver sessão ativa (debug port 9222), exibe aviso e encerra.

Library           RPA.Browser.Selenium    auto_close=${FALSE}
Library           Process
Library           OperatingSystem
Library           ../libraries/pje_data_provider.py

*** Variables ***
${PJE_CALC_URL}           http://localhost:9257/pjecalc/pages/principal.jsf
${PJE_CALC_SERVER_WAIT}   15s
${DEBUG_PORT}             9222
# Seletores extraídos do HTML real da página principal
${BTN_CRIAR_NOVO_CALCULO}    xpath://a[@title='Criar Novo Cálculo']

*** Keywords ***
Abrir PJe-Calc
    Log To Console    Verificando se o servidor PJe-Calc já está rodando...
    ${servidor_ativo}=    Verificar Servidor Rodando
    Run Keyword If    not ${servidor_ativo}    Iniciar Servidor PJeCalc
    ${debug_ativo}=    Verificar Debug Ativo
    Run Keyword If    ${debug_ativo}       Tratar Sessao Ativa
    Run Keyword If    not ${debug_ativo}   Iniciar Nova Sessao
    Wait Until Page Contains Element    ${BTN_CRIAR_NOVO_CALCULO}    timeout=30s
    Log To Console    Página principal carregada com sucesso.

Tratar Sessao Ativa
    Log To Console    Sessão ativa detectada na porta ${DEBUG_PORT}. Perguntando ao usuário...
    ${abrir_nova}=    Confirmar Nova Sessao
    # Se SIM: abre sem debug port (porta 9222 já está em uso pela sessão anterior)
    Run Keyword If    ${abrir_nova}       Iniciar Nova Sessao    com_debug_port=${FALSE}
    Run Keyword If    not ${abrir_nova}   Fatal Error    Execução cancelada: usuário optou por manter a sessão atual.

Iniciar Nova Sessao
    [Arguments]    ${com_debug_port}=${TRUE}
    ${browser}=    Detectar Navegador Padrao
    Log To Console    Navegador padrão detectado: ${browser}. Abrindo nova sessão...
    ${options}=    Criar Opcoes Novo    ${browser}    com_debug_port=${com_debug_port}
    Open Available Browser    ${PJE_CALC_URL}    browser_selection=${browser}    options=${options}

Iniciar Servidor PJeCalc
    Log To Console    Servidor não encontrado. Localizando instalação do PJe-Calc...
    ${bat_path}=    Localizar Bat Pjecalc
    Log To Console    Iniciando servidor via: ${bat_path}
    Start Process    cmd    /c    ${bat_path}    alias=pjecalc_server    shell=True
    Log To Console    Aguardando ${PJE_CALC_SERVER_WAIT} para o servidor subir...
    Sleep    ${PJE_CALC_SERVER_WAIT}

Fechar PJe-Calc
    Log To Console    Fechando PJe-Calc...
    Run Keyword And Ignore Error    Close Browser
    Run Keyword And Ignore Error    Terminate Process    pjecalc_server

Navegar Para Novo Calculo
    Log To Console    Clicando em 'Criar Novo Cálculo'...
    Wait Until Element Is Visible    ${BTN_CRIAR_NOVO_CALCULO}    timeout=15s
    Click Element                    ${BTN_CRIAR_NOVO_CALCULO}
    Log To Console    Botão 'Criar Novo Cálculo' clicado com sucesso.
