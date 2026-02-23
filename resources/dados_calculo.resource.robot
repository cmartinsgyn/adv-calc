*** Settings ***
Documentation     Keywords para preencher a tela de 'Dados do Cálculo'.
...               Seletores extraídos do HTML real do formulário (html_pagina_calculo.md).

Library           String
Library           RPA.Browser.Selenium

*** Variables ***
# Identificação do Processo
${CAMPO_NUMERO}                 id:formulario:numero
${CAMPO_DIGITO}                 id:formulario:digito
${CAMPO_ANO}                    id:formulario:ano
${CAMPO_TRIBUNAL}               id:formulario:regiao
${CAMPO_VARA}                   id:formulario:vara
${CAMPO_AUTUADO_EM}             id:formulario:autuadoEm
${CAMPO_VALOR_CAUSA}            id:formulario:valorDaCausa

# Reclamante
${CAMPO_RECLAMANTE_NOME}        id:formulario:reclamanteNome
${RADIO_RECLAMANTE_DOC_TIPO}    name:formulario:documentoFiscalReclamante
${CAMPO_RECLAMANTE_DOC_NUM}     id:formulario:reclamanteNumeroDocumentoFiscal
${RADIO_RECLAMANTE_PREV_TIPO}   name:formulario:reclamanteTipoDocumentoPrevidenciario
${CAMPO_RECLAMANTE_PREV_NUM}    id:formulario:reclamanteNumeroDocumentoPrevidenciario

# Advogado Reclamante
${CAMPO_RECL_ADV_NOME}          id:formulario:nomeAdvogadoReclamante
${CAMPO_RECL_ADV_OAB}           id:formulario:numeroOABAdvogadoReclamante
${RADIO_RECL_ADV_DOC_TIPO}      name:formulario:tipoDocumentoAdvogadoReclamante
${CAMPO_RECL_ADV_DOC_NUM}       id:formulario:numeroDocumentoAdvogadoReclamante
${BOTAO_RECL_ADV_ADICIONAR}     id:formulario:incluirAdvogadoReclamante
${TABELA_RECL_ADV}              id:formulario:listagemAdvogadoReclamante

# Reclamado
${CAMPO_RECLAMADO_NOME}         id:formulario:reclamadoNome
${RADIO_RECLAMADO_DOC_TIPO}     name:formulario:tipoDocumentoFiscalReclamado
${CAMPO_RECLAMADO_DOC_NUM}      id:formulario:reclamadoNumeroDocumentoFiscal

# Advogado Reclamado
${CAMPO_RECD_ADV_NOME}          id:formulario:nomeAdvogadoReclamado
${CAMPO_RECD_ADV_OAB}           id:formulario:numeroOABAdvogadoReclamado
${RADIO_RECD_ADV_DOC_TIPO}      name:formulario:tipoDocumentoAdvogadoReclamado
${CAMPO_RECD_ADV_DOC_NUM}       id:formulario:numeroDocumentoAdvogadoReclamado
${BOTAO_RECD_ADV_ADICIONAR}     id:formulario:incluirAdvogadoReclamado
${TABELA_RECD_ADV}              id:formulario:listagemAdvogadoReclamado

*** Keywords ***
Preencher Aba Dados Do Processo
    [Arguments]    ${dados}
    Log To Console    Preenchendo aba 'Dados do Processo'.
    
    # 1 - Identificação do Processo
    Preencher Identificacao Do Processo    ${dados}
    
    Sleep    0.5s
    
    # 2 - Reclamante
    Preencher Dados Reclamante    ${dados}
    
    # 3 - Reclamado
    Preencher Dados Reclamado    ${dados}

Preencher Identificacao Do Processo
    [Arguments]    ${dados}
    Input Text    ${CAMPO_NUMERO}       ${dados.numero_processo}
    Input Text    ${CAMPO_DIGITO}       ${dados.digito}
    Input Text    ${CAMPO_ANO}          ${dados.ano}
    Input Text    ${CAMPO_TRIBUNAL}     ${dados.tribunal}
    Input Text    ${CAMPO_VARA}         ${dados.vara}
    
    # Estratégia para Autuado em (Data): Digitação real com Press Keys para assumir a máscara
    Wait Until Element Is Visible    ${CAMPO_AUTUADO_EM}    timeout=5s
    Click Element    ${CAMPO_AUTUADO_EM}
    Clear Element Text    ${CAMPO_AUTUADO_EM}
    Press Keys       ${CAMPO_AUTUADO_EM}    ${dados.data_autuacao}
    Press Keys       ${CAMPO_AUTUADO_EM}    TAB
    
    # Estratégia para Valor da Causa: Digitação real com Press Keys
    Wait Until Element Is Visible    ${CAMPO_VALOR_CAUSA}    timeout=5s
    Click Element    ${CAMPO_VALOR_CAUSA}
    Clear Element Text    ${CAMPO_VALOR_CAUSA}
    Press Keys       ${CAMPO_VALOR_CAUSA}    ${dados.valor_da_causa}
    Press Keys       ${CAMPO_VALOR_CAUSA}    TAB

Preencher Dados Reclamante
    [Arguments]    ${dados}
    Input Text    ${CAMPO_RECLAMANTE_NOME}    ${dados.reclamante_nome}
    
    # Documento Fiscal Reclamante - Digitação real para assumir a máscara (CPF/CNPJ)
    Selecionar Tipo Documento    ${RADIO_RECLAMANTE_DOC_TIPO}    ${dados.reclamante_doc_fiscal}
    Wait Until Element Is Visible    ${CAMPO_RECLAMANTE_DOC_NUM}    timeout=5s
    Click Element    ${CAMPO_RECLAMANTE_DOC_NUM}
    Clear Element Text    ${CAMPO_RECLAMANTE_DOC_NUM}
    Press Keys       ${CAMPO_RECLAMANTE_DOC_NUM}    ${dados.reclamante_doc_fiscal}
    Press Keys       ${CAMPO_RECLAMANTE_DOC_NUM}    TAB
    
    # Documento Previdenciário - Digitação real
    ${clean_prev}=    Evaluate    "${RADIO_RECLAMANTE_PREV_TIPO}".replace("name:", "")
    Execute Javascript    var rb = document.querySelector("input[name='${clean_prev}'][value='PIS']"); if(rb){ rb.click(); }
    Sleep    0.3s
    Wait Until Element Is Visible    ${CAMPO_RECLAMANTE_PREV_NUM}    timeout=5s
    Click Element    ${CAMPO_RECLAMANTE_PREV_NUM}
    Clear Element Text    ${CAMPO_RECLAMANTE_PREV_NUM}
    Press Keys       ${CAMPO_RECLAMANTE_PREV_NUM}    ${dados.reclamante_doc_prev}
    Press Keys       ${CAMPO_RECLAMANTE_PREV_NUM}    TAB
    
    # Advogado Reclamante
    Input Text    ${CAMPO_RECL_ADV_NOME}    ${dados.reclamante_adv_nome}
    
    # OAB - Digitação real
    Wait Until Element Is Visible    ${CAMPO_RECL_ADV_OAB}    timeout=5s
    Click Element    ${CAMPO_RECL_ADV_OAB}
    Clear Element Text    ${CAMPO_RECL_ADV_OAB}
    Press Keys       ${CAMPO_RECL_ADV_OAB}    ${dados.reclamante_adv_oab}
    Press Keys       ${CAMPO_RECL_ADV_OAB}    TAB
    
    # Número do Advogado (Reclamante)
    Preencher Numero Documento Advogado    ${RADIO_RECL_ADV_DOC_TIPO}    ${CAMPO_RECL_ADV_DOC_NUM}    ${dados.reclamante_adv_doc_fiscal}
    
    # Clicar em Adicionar Advogado e verificar tabela
    Log To Console    Clicando em Adicionar Advogado (Reclamante)...
    Clicar Botao Adicionar Advogado    ${BOTAO_RECL_ADV_ADICIONAR}    ${TABELA_RECL_ADV}

Preencher Dados Reclamado
    [Arguments]    ${dados}
    Input Text    ${CAMPO_RECLAMADO_NOME}    ${dados.reclamado_nome}
    
    # Documento Fiscal Reclamado - Digitação real
    Selecionar Tipo Documento    ${RADIO_RECLAMADO_DOC_TIPO}    ${dados.reclamado_doc_fiscal}
    Wait Until Element Is Visible    ${CAMPO_RECLAMADO_DOC_NUM}    timeout=5s
    Click Element    ${CAMPO_RECLAMADO_DOC_NUM}
    Clear Element Text    ${CAMPO_RECLAMADO_DOC_NUM}
    Press Keys       ${CAMPO_RECLAMADO_DOC_NUM}    ${dados.reclamado_doc_fiscal}
    Press Keys       ${CAMPO_RECLAMADO_DOC_NUM}    TAB
    
    # Advogado Reclamado
    Input Text    ${CAMPO_RECD_ADV_NOME}    ${dados.reclamado_adv_nome}
    
    # OAB Reclamado - Digitação real
    Wait Until Element Is Visible    ${CAMPO_RECD_ADV_OAB}    timeout=5s
    Click Element    ${CAMPO_RECD_ADV_OAB}
    Clear Element Text    ${CAMPO_RECD_ADV_OAB}
    Press Keys       ${CAMPO_RECD_ADV_OAB}    ${dados.reclamado_adv_oab}
    Press Keys       ${CAMPO_RECD_ADV_OAB}    TAB
    
    # Número do Advogado (Reclamado)
    Preencher Numero Documento Advogado    ${RADIO_RECD_ADV_DOC_TIPO}    ${CAMPO_RECD_ADV_DOC_NUM}    ${dados.reclamado_adv_doc_fiscal}
    
    # Clicar em Adicionar Advogado e verificar tabela
    Log To Console    Clicando em Adicionar Advogado (Reclamado)...
    Clicar Botao Adicionar Advogado    ${BOTAO_RECD_ADV_ADICIONAR}    ${TABELA_RECD_ADV}

Selecionar Tipo Documento
    [Arguments]    ${locator_radio}    ${valor_documento}
    ${tamanho}=    Get Length    ${valor_documento}
    ${tipo}=    Set Variable If    
    ...    ${tamanho} == 11    CPF
    ...    ${tamanho} == 14    CNPJ
    ...    ${tamanho} == 12    CEI
    ...    CPF
    ${clean_locator}=    Evaluate    "${locator_radio}".replace("name:", "")
    Execute Javascript    document.querySelector("input[name='${clean_locator}'][value='${tipo}']").click()
    Sleep    0.3s

Preencher Numero Documento Advogado
    [Arguments]    ${locator_radio}    ${locator_input}    ${valor_documento}
    # 1. Seleciona o tipo (CPF/CNPJ/CEI)
    Selecionar Tipo Documento    ${locator_radio}    ${valor_documento}
    
    # 2. Estratégia: Digitação real com Press Keys para disparar a máscara nativa
    Wait Until Element Is Visible    ${locator_input}    timeout=5s
    Click Element    ${locator_input}
    Clear Element Text    ${locator_input}
    
    # Digita o valor real
    Press Keys    ${locator_input}    ${valor_documento}
    Press Keys    ${locator_input}    TAB
    
    # Aguarda o processamento AJAX da validação do CPF
    Esperar Processamento PjeCalc
    Sleep    0.8s

Clicar Botao Adicionar Advogado
    [Arguments]    ${locator_botao}    ${locator_tabela}
    ${id_botao}=    Replace String    ${locator_botao}    id:    ${EMPTY}
    ${id_tabela}=    Replace String    ${locator_tabela}    id:    ${EMPTY}

    # Garante que qualquer processamento anterior terminou
    Esperar Processamento PjeCalc
    
    Wait Until Element Is Visible    ${locator_botao}    timeout=10s
    
    # Rola até o botão
    Execute Javascript    document.getElementById("${id_botao}").scrollIntoView({block:'center'});

    # Estratégia: Tentar o clique do Selenium primeiro
    Log To Console    Tentando clique no botão adicionar...
    Click Element    ${locator_botao}
    
    # Aguarda o processamento AJAX (reduzido para ser mais rápido)
    Esperar Processamento PjeCalc
    Sleep    1s

    # VERIFICAÇÃO: Se a tabela não contiver dados, tenta o clique via JS como fallback
    ${tem_dados}=    Execute Javascript    
    ...    var tab = document.getElementById("${id_tabela}");
    ...    if (!tab) return false;
    ...    var rows = tab.getElementsByTagName("tr");
    ...    return rows.length > 1;
    
    Run Keyword If    not ${tem_dados}    Log To Console    Tabela vazia após clique. Tentando clique via JS...
    Run Keyword If    not ${tem_dados}    Execute Javascript    document.getElementById("${id_botao}").click();
    
    Run Keyword If    not ${tem_dados}    Esperar Processamento PjeCalc
    Run Keyword If    not ${tem_dados}    Sleep    1s

    # NOVO: Se ainda não renderizou, tenta forçar o re-render da região do formulário via A4J
    Run Keyword If    not ${tem_dados}    Log To Console    Forçando re-render da região do formulário via A4J...
    Run Keyword If    not ${tem_dados}    Execute Javascript    
    ...    if (typeof A4J !== 'undefined' && A4J.AJAX) {
    ...        A4J.AJAX.Submit('formulario', null, {
    ...            'similarityGroupingId': 'force_render',
    ...            'containerId': 'formulario:regionFormulario',
    ...            'parameters': { 'force_render': 'force_render' }
    ...        });
    ...    }
    
    Run Keyword If    not ${tem_dados}    Esperar Processamento PjeCalc
    Run Keyword If    not ${tem_dados}    Sleep    2s

Esperar Processamento PjeCalc
    Wait Until Keyword Succeeds    30x    300ms    Processamento PjeCalc Deve Estar Concluido

Processamento PjeCalc Deve Estar Concluido
    ${finalizado}=    Execute Javascript
    ...    var root = document.getElementById("formulario:msgAguarde");
    ...    var panel = document.getElementById("formulario:msgAguardeContainer");
    ...    function visivel(el){ if(!el){ return false; } var st = window.getComputedStyle(el); return st.display !== "none" && st.visibility !== "hidden" && st.opacity !== "0"; }
    ...    return !visivel(root) && !visivel(panel);
    Should Be True    ${finalizado}    Aguardando processamento AJAX do PJe-Calc finalizar.

Preencher Aba Parametros Do Calculo
    [Arguments]    ${dados}
    Log To Console    Preenchendo aba 'Parâmetros do Cálculo'.

Salvar Dados Do Calculo
    Log To Console    Salvando dados do cálculo...

Format Date For Input
    [Arguments]    ${date_obj}
    ${formatted}=    Convert Date    ${date_obj}    result_format=%d%m%Y
    RETURN    ${formatted}
