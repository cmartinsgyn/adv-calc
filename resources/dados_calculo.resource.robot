*** Settings ***
Documentation     Keywords para preencher a tela de 'Dados do Cálculo'.

Library           RPA.Windows
Library           String

*** Keywords ***
Preencher Aba Dados Do Processo
    [Arguments]    ${dados}
    Log To Console    Preenchendo aba 'Dados do Processo'.
    # Seletores placeholder. Precisam ser confirmados com Inspect.exe
    Input Text    name:"Nome do reclamante"    ${dados.nome_reclamante}
    Input Text    name:"Nome do reclamado"     ${dados.nome_reclamado}
    Input Text    name:"Nº do processo"        ${dados.numero_processo}

Preencher Aba Parametros Do Calculo
    [Arguments]    ${dados}
    Log To Console    Preenchendo aba 'Parâmetros do Cálculo'.
    Click    name:Parâmetros do Cálculo  # Clica na aba

    # Formata as datas para o formato DDMMYYYY sem separadores
    ${admissao_str}=    Format Date For Input    ${dados.data_admissao}
    ${demissao_str}=    Format Date For Input    ${dados.data_demissao}
    ${ajuizamento_str}=    Format Date For Input    ${dados.data_ajuizamento}

    # Seletores placeholder. Precisam ser confirmados com Inspect.exe
    Input Text    name:"Admissão"              ${admissao_str}
    Input Text    name:"Demissão"              ${demissao_str}
    Input Text    name:"Ajuizamento"           ${ajuizamento_str}
    Input Text    name:"Maior Remuneração"     ${dados.maior_remuneracao}
    # Exemplo para ComboBox (Dropdown)
    Click         name:"Estado (UF)"
    Click         name:"${dados.uf}"
    Click         name:"Município"
    Click         name:"${dados.municipio}"

Salvar Dados Do Calculo
    Log To Console    Salvando dados do cálculo...
    Click    name:Salvar

Format Date For Input
    [Arguments]    ${date_obj}
    ${formatted}=    Convert Date    ${date_obj}    result_format=%d%m%Y
    [Return]    ${formatted}