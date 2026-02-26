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

# --- ABA PARÂMETROS DO CÁLCULO ---
# Localização
${CAMPO_ESTADO}                 id:formulario:estado
${CAMPO_MUNICIPIO}              id:formulario:municipio

# Datas do Cálculo
${CAMPO_DATA_ADMISSAO}          id:formulario:dataAdmissaoInputDate
${CAMPO_DATA_DEMISSAO}          id:formulario:dataDemissaoInputDate
${CAMPO_DATA_AJUIZAMENTO}       id:formulario:dataAjuizamentoInputDate

# Limitar Cálculo / Prescrição
${CAMPO_DATA_INICIAL}           id:formulario:dataInicioCalculoInputDate
${CAMPO_DATA_FINAL}             id:formulario:dataTerminoCalculoInputDate
${CHECK_APLICAR_PRESCRICAO}     id:formulario:prescricaoQuinquenal

# Outros Parâmetros
${CAMPO_REGIME_TRABALHO}        id:formulario:tipoDaBaseTabelada
${CAMPO_MAIOR_REMUNERACAO}      id:formulario:valorMaiorRemuneracao
${CAMPO_ULTIMA_REMUNERACAO}     id:formulario:valorUltimaRemuneracao
${CAMPO_PRAZO_AVISO_PREVIO}     id:formulario:apuracaoPrazoDoAvisoPrevio

# Checkboxes de Configuração
${CHECK_PROJETAR_AVISO}         id:formulario:projetaAvisoIndenizado
${CHECK_LIMITAR_AVOS}           id:formulario:limitarAvos
${CHECK_ZERAR_VALOR_NEG}        id:formulario:zeraValorNegativo
${CHECK_FERIADOS_ESTADUAIS}     id:formulario:consideraFeriadoEstadual
${CHECK_FERIADOS_MUNICIPAIS}    id:formulario:consideraFeriadoMunicipal

# Carga Horária
${CAMPO_CH_PADRAO}              id:formulario:valorCargaHorariaPadrao
${CAMPO_CH_EXC_INICIO}          id:formulario:dataInicioExcecaoInputDate
${CAMPO_CH_EXC_FIM}             id:formulario:dataTerminoExcecaoInputDate
${CAMPO_CH_EXC_VALOR}           id:formulario:valorCargaHoraria
${BOTAO_CH_EXC_ADICIONAR}       id:formulario:incluirExcecaoCH
${TABELA_CH_EXC}                id:formulario:painelListaExcecoesCargaHoraria

# Sábado
${CHECK_SABADO_UTIL}            id:formulario:sabadoDiaUtil
${CAMPO_SAB_EXC_INICIO}         id:formulario:dataInicioExcecaoSabadoInputDate
${CAMPO_SAB_EXC_FIM}            id:formulario:dataTerminoExcecaoSabadoInputDate
${BOTAO_SAB_EXC_ADICIONAR}      id:formulario:incluirExcecaoSab
${TABELA_SAB_EXC}               id:formulario:painelListaExcecoesDoSabado

# Menu Lateral
${MENU_HISTORICO_SALARIAL}      id:li_calculo_historico_salarial

# Abas
${ABA_DADOS_PROCESSO}           xpath://td[contains(text(), 'Dados do Processo')]
${ABA_PARAMETROS_CALCULO}       xpath://td[contains(text(), 'Parâmetros do Cálculo')]

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
    
    # Clicar na aba Parâmetros do Cálculo
    Wait Until Element Is Visible    ${ABA_PARAMETROS_CALCULO}    timeout=10s
    Click Element    ${ABA_PARAMETROS_CALCULO}
    Esperar Processamento PjeCalc
    Sleep    1s

    # 1 - Localização (Estado e Município)
    Select From List By Label    ${CAMPO_ESTADO}    ${dados.estado}
    Log To Console    Estado selecionado: ${dados.estado}. Aguardando busca de municípios...
    Sleep    2.5s    # Busca dura cerca de 2 segundos
    Esperar Processamento PjeCalc
    Select From List By Label    ${CAMPO_MUNICIPIO}    ${dados.municipio}
    Esperar Processamento PjeCalc

    # 2 - Datas do Cálculo
    Preencher Campo Data    ${CAMPO_DATA_ADMISSAO}    ${dados.data_admissao}
    Preencher Campo Data    ${CAMPO_DATA_DEMISSAO}    ${dados.data_demissao}
    Preencher Campo Data    ${CAMPO_DATA_AJUIZAMENTO}    ${dados.data_ajuizamento}

    # 3 - Limitar Cálculo / Prescrição
    Preencher Campo Data    ${CAMPO_DATA_INICIAL}    ${dados.data_inicial_calculo}
    Preencher Campo Data    ${CAMPO_DATA_FINAL}      ${dados.data_final_calculo}
    Set Checkbox State    ${CHECK_APLICAR_PRESCRICAO}    ${dados.aplicar_prescricao}

    # 4 - Outros Parâmetros
    Select From List By Value    ${CAMPO_REGIME_TRABALHO}    ${dados.regime_trabalho}
    
    Preencher Campo Moeda    ${CAMPO_MAIOR_REMUNERACAO}    ${dados.maior_remuneracao}
    Preencher Campo Moeda    ${CAMPO_ULTIMA_REMUNERACAO}   ${dados.ultima_remuneracao}
    
    Select From List By Value    ${CAMPO_PRAZO_AVISO_PREVIO}    ${dados.prazo_aviso_previo}
    Esperar Processamento PjeCalc

    # 5 - Checkboxes de Configuração
    Set Checkbox State    ${CHECK_PROJETAR_AVISO}         ${dados.projetar_aviso_indenizado}
    Set Checkbox State    ${CHECK_LIMITAR_AVOS}           ${dados.limitar_avos_periodo}
    Set Checkbox State    ${CHECK_ZERAR_VALOR_NEG}        ${dados.zerar_valor_negativo}
    Set Checkbox State    ${CHECK_FERIADOS_ESTADUAIS}     ${dados.considerar_feriados_estaduais}
    Set Checkbox State    ${CHECK_FERIADOS_MUNICIPAIS}    ${dados.considerar_feriados_municipais}

    # 6 - Carga Horária
    # O campo Padrão já vem preenchido (ex: 220,00). Vamos apenas garantir o valor.
    Wait Until Element Is Visible    ${CAMPO_CH_PADRAO}    timeout=5s
    Click Element    ${CAMPO_CH_PADRAO}
    Clear Element Text    ${CAMPO_CH_PADRAO}
    Press Keys       ${CAMPO_CH_PADRAO}    ${dados.carga_horaria_mensal}
    Press Keys       ${CAMPO_CH_PADRAO}    TAB
    Esperar Processamento PjeCalc
    
    # Exceções Carga Horária
    FOR    ${exc}    IN    @{dados.excecoes_carga_horaria}
        Log To Console    Preenchendo Exceção CH: ${exc['inicio']} a ${exc['fim']} com valor ${exc['valor']}
        
        # Início
        Wait Until Element Is Visible    ${CAMPO_CH_EXC_INICIO}    timeout=5s
        Click Element    ${CAMPO_CH_EXC_INICIO}
        Clear Element Text    ${CAMPO_CH_EXC_INICIO}
        Press Keys       ${CAMPO_CH_EXC_INICIO}    ${exc['inicio']}
        Press Keys       ${CAMPO_CH_EXC_INICIO}    TAB
        Esperar Processamento PjeCalc
        
        # Fim
        Wait Until Element Is Visible    ${CAMPO_CH_EXC_FIM}    timeout=5s
        Click Element    ${CAMPO_CH_EXC_FIM}
        Clear Element Text    ${CAMPO_CH_EXC_FIM}
        Press Keys       ${CAMPO_CH_EXC_FIM}    ${exc['fim']}
        Press Keys       ${CAMPO_CH_EXC_FIM}    TAB
        Esperar Processamento PjeCalc

        # Valor
        Wait Until Element Is Visible    ${CAMPO_CH_EXC_VALOR}    timeout=5s
        Click Element    ${CAMPO_CH_EXC_VALOR}
        Clear Element Text    ${CAMPO_CH_EXC_VALOR}
        Press Keys       ${CAMPO_CH_EXC_VALOR}    ${exc['valor']}
        Press Keys       ${CAMPO_CH_EXC_VALOR}    TAB
        Esperar Processamento PjeCalc

        Log To Console    Clicando em Adicionar Base (CH)...
        Click Element    ${BOTAO_CH_EXC_ADICIONAR}
        Esperar Processamento PjeCalc
        Sleep    1s
    END

    # 7 - Sábado
    Set Checkbox State    ${CHECK_SABADO_UTIL}    ${dados.sabado_dia_util}
    
    # Exceções Sábado
    FOR    ${exc}    IN    @{dados.excecoes_sabado}
        Preencher Campo Data    ${CAMPO_SAB_EXC_INICIO}    ${exc['inicio']}
        Preencher Campo Data    ${CAMPO_SAB_EXC_FIM}       ${exc['fim']}
        Click Element    ${BOTAO_SAB_EXC_ADICIONAR}
        Esperar Processamento PjeCalc
        Sleep    0.5s
    END

Preencher Campo Data
    [Arguments]    ${locator}    ${valor}
    Run Keyword If    '${valor}' == '${EMPTY}'    Return From Keyword
    Wait Until Element Is Visible    ${locator}    timeout=5s
    Click Element    ${locator}
    Clear Element Text    ${locator}
    Press Keys       ${locator}    ${valor}
    Press Keys       ${locator}    TAB
    Esperar Processamento PjeCalc

Preencher Campo Moeda
    [Arguments]    ${locator}    ${valor}
    Run Keyword If    '${valor}' == '${EMPTY}'    Return From Keyword
    Wait Until Element Is Visible    ${locator}    timeout=5s
    Click Element    ${locator}
    Clear Element Text    ${locator}
    Press Keys       ${locator}    ${valor}
    Press Keys       ${locator}    TAB
    Esperar Processamento PjeCalc

Set Checkbox State
    [Arguments]    ${locator}    ${expected_state}
    Wait Until Element Is Visible    ${locator}    timeout=5s
    
    # Obtém o estado atual do checkbox de forma robusta
    ${is_selected}=    Run Keyword And Return Status    Checkbox Should Be Selected    ${locator}
    
    IF    ${expected_state} != ${is_selected}
        Click Element    ${locator}
        Esperar Processamento PjeCalc
    END

Salvar Dados Do Calculo
    Log To Console    Aguardando verificação manual...
    # Exibir mensagem de revisão solicitada via Windows MessageBox (ctypes)
    Exibir Mensagem Windows    Formulário preenchido, fazer verificação e clicar em salvar para liberar os semais lançamentos
    
    # Loop infinito de re-tentativa controlado pelo usuário
    WHILE    ${TRUE}
        ${status}=    Executar Demais Lancamentos
        
        # Se a keyword retornou sucesso ou erro detectado, sai do loop principal
        IF    '${status}' == 'CONCLUIDO'    BREAK
        
        # Se chegou aqui, é porque deu TIMEOUT. Pergunta ao usuário se deseja continuar.
        ${continuar}=    Perguntar Continuar Windows    O robô continua aguardando. Clique em SIM para eu continuar esperando você salvar e lançar os outros dados. Clique em NÃO para encerrar operação?
        
        IF    not ${continuar}
            Log To Console    Operação encerrada pelo usuário após timeout.
            BREAK
        END
        Log To Console    Reiniciando ciclo de espera por mais 60 segundos...
    END

Executar Demais Lancamentos
    Log To Console    Aguardando salvamento manual e detectando resultado...
    
    # Loop de espera (até 60 segundos) para detectar o resultado do clique manual em Salvar
    FOR    ${i}    IN RANGE    60
        # 1. Verifica primeiro se houve SUCESSO (o menu Histórico Salarial apareceu)
        # O menu lateral é o sinal definitivo de que o cálculo foi salvo com sucesso.
        ${sucesso}=    Run Keyword And Return Status    Element Should Be Visible    ${MENU_HISTORICO_SALARIAL}
        
        IF    ${sucesso}
            Log To Console    Salvamento bem-sucedido! Menu Histórico Salarial detectado.
            Click Element    xpath://li[@id='li_calculo_historico_salarial']/a
            Esperar Processamento PjeCalc
            RETURN    CONCLUIDO
        END

        # 2. Verifica se o sistema ainda está processando (Aguarde... visível)
        # Se estiver processando, não verificamos erro ainda para evitar falsos positivos durante a transição.
        ${esta_processando}=    Execute Javascript    
        ...    var root = document.getElementById("formulario:msgAguarde");
        ...    var panel = document.getElementById("formulario:msgAguardeContainer");
        ...    function visivel(el){ if(!el){ return false; } var st = window.getComputedStyle(el); return st.display !== "none" && st.visibility !== "hidden" && st.opacity !== "0"; }
        ...    return visivel(root) || visivel(panel);
        
        IF    ${esta_processando}
            Sleep    1s
            CONTINUE
        END

        # 3. Verifica se houve ERRO (apenas se não estiver processando e o menu não apareceu)
        ${tem_erro}=    Execute Javascript    
        ...    var painelMensagens = document.getElementById('formulario:painelMensagens');
        ...    var divMsg = document.getElementById('divMensagem');
        ...    function temTextoVisivel(el) { 
        ...        if(!el) return false; 
        ...        var st = window.getComputedStyle(el); 
        ...        return st.display !== 'none' && st.visibility !== 'hidden' && el.offsetHeight > 0 && el.innerText.trim().length > 0; 
        ...    }
        ...    return temTextoVisivel(painelMensagens) || temTextoVisivel(divMsg);
        
        IF    ${tem_erro}
            Log To Console    Erro ao salvar detectado no formulário.
            Exibir Mensagem Windows    Erro ao salvar. Verifique as mensagens na tela do PJe-Calc.
            RETURN    CONCLUIDO
        END

        Sleep    1s
    END
    RETURN    TIMEOUT
    
    # Se sair do loop FOR, significa que deu timeout
    RETURN    TIMEOUT

Format Date For Input
    [Arguments]    ${date_obj}
    ${formatted}=    Convert Date    ${date_obj}    result_format=%d%m%Y
    RETURN    ${formatted}

Exibir Mensagem Windows
    [Arguments]    ${mensagem}
    # Chama a função Python que exibe o MessageBox do Windows (MB_OK | MB_ICONINFORMATION)
    Evaluate    __import__('ctypes').windll.user32.MessageBoxW(0, "${mensagem}", "PJe-Calc Automação", 0x40)

Perguntar Continuar Windows
    [Arguments]    ${mensagem}
    # Exibe MessageBox com botões SIM e NÃO (MB_YESNO | MB_ICONQUESTION)
    # Retorna 6 para SIM e 7 para NÃO
    ${resultado}=    Evaluate    __import__('ctypes').windll.user32.MessageBoxW(0, "${mensagem}", "Tempo Esgotado", 0x24)
    ${status}=    Evaluate    True if ${resultado} == 6 else False
    RETURN    ${status}
