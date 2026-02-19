*** Settings ***
Documentation     Keywords para preencher a tela de 'Dados do Cálculo'.
...               Seletores extraídos do HTML real do formulário (html_pagina_calculo.md).

Library           String

*** Variables ***
# Aba Dados do Processo — IDs extraídos do HTML real
${CAMPO_NUMERO}       id:formulario:numero

*** Keywords ***
Preencher Aba Dados Do Processo
    [Arguments]    ${dados}
    Log To Console    Preenchendo aba 'Dados do Processo'.
    Preencher Campo Numero Do Processo    ${dados.numero_processo}
    # Próximos campos serão adicionados progressivamente conforme validação

Preencher Campo Numero Do Processo
    [Arguments]    ${numero_processo_completo}
    # O campo aceita apenas os 7 dígitos iniciais do número CNJ (ex: "0000123" de "0000123-45.2025.5.18.0012")
    ${numero}=    Fetch From Left    ${numero_processo_completo}    -
    Log To Console    Preenchendo campo 'Número' com: ${numero}
    Wait Until Element Is Visible    ${CAMPO_NUMERO}    timeout=10s
    Click Element                    ${CAMPO_NUMERO}
    Input Text                       ${CAMPO_NUMERO}    ${numero}

Preencher Aba Parametros Do Calculo
    [Arguments]    ${dados}
    Log To Console    Preenchendo aba 'Parâmetros do Cálculo'.
    # A implementar conforme validação dos campos anteriores

Salvar Dados Do Calculo
    Log To Console    Salvando dados do cálculo...
    # A implementar

Format Date For Input
    [Arguments]    ${date_obj}
    ${formatted}=    Convert Date    ${date_obj}    result_format=%d%m%Y
    RETURN    ${formatted}
