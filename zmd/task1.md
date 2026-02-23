
##  NOVO CÁLCULO
  Atualmente estamos prenchendo o campo Número, vamos agora preencher todo o formuláro de Novo Cálculo. Para RELEMBRAR usamos o prompt anterior: "Precisamos preencher dados no formulário de calculo, então vamos começar preenchendo o primeiro campo, que fica aba  "Dados do Processo" e o campo é "Número".

  Em pje_calc.robot chamamos a função. Também usamos o item 3 de .curorrules.md como referencia. O que precisamos evoluir:

  1. Inserir ## VALORES no formulário na seguinte ordem hierárquica:
    1-Em "Idenfificação do processo", campos: Número, Dígito, Ano, Tribunal, Vara, Valor da Causa;
    2 - Em "Reclamante":
      2.1.1 - Em "Documento Fiscal", campos: Nome, Número
        - Observações  e imediatamente anteriores:  
         - Tipo contém CPF, CNPJ, CEI e são um radio button que devem ser clicados primeiro para liberar preenchimento do campo Número. De acordo com a quantidade de caracteres providenciar esse clque no respectivo radio button correto, exemplo: se for 14 caracteres clica em CNPJ, se for 11 clica em CPF, se for 12 clic em CEI. Sempre deve vir caracteres completos, mesmo com 0, ou seja sempre 11, 12 ou 14
      2.1.2 - Em "Documento Previdenciário", campos: Número
        - Observações importantes e imediatamente anteriores: 
         - Tipo contém PIS, PASEP, NIT e são um radio button. CLIQUE EM PIS COMO PADRÃO.
      2.1.3 - Em "Advogado", campos: Nome, OAB, Número
        - Observações importantes e imediatamente anteriores:  
         - Tipo contém CPF, CNPJ, CEI e são um radio button que devem ser clicados primeiro para liberar preenchimento do campo Número. De acordo com a quantidade de caracteres providenciar esse clque no respectivo radio button correto, exemplo: se for 14 caracteres clica em CNPJ, se for 11 clica em CPF, se for 12 clic em CEI. Sempre deve vir caracteres completos, mesmo com 0, ou seja sempre 11, 12 ou 14.
        - Após preencher Número clicar no Botão + (Adicionar Advogado) 
    
    3 - Em "Reclamado": 
      3.1 - campos: Nome, Número
        - Observações importantes e imediatamente anteriores:  
         - Tipo contém CPF, CNPJ, CEI e são um radio button que devem ser clicados primeiro para liberar preenchimento do campo Número. De acordo com a quantidade de caracteres providenciar esse clque no respectivo radio button correto, exemplo: se for 14 caracteres clica em CNPJ, se for 11 clica em CPF, se for 12 clic em CEI. Sempre deve vir caracteres completos, mesmo com 0, ou seja sempre 11, 12 ou 14
      3.2 - Em "Advogado", campos: Nome, OAB, Número
        - Observações importantes e imediatamente anteriores:  
         - Tipo contém CPF, CNPJ, CEI e são um radio button que devem ser clicados primeiro para liberar preenchimento do campo Número. De acordo com a quantidade de caracteres providenciar esse clque no respectivo radio button correto, exemplo: se for 14 caracteres clica em CNPJ, se for 11 clica em CPF, se for 12 clic em CEI. Sempre deve vir caracteres completos, mesmo com 0, ou seja sempre 11, 12 ou 14.
        - Após preencher Número clicar no Botão + (Adicionar Advogado)    


## VALORES
  1 - Os valores, hoje fixos, devem ser importados de um aquivo salvo na pasta do projeto. Crie um arquivo inicial, compatível com excel, de acordo os campos de ## NOVO CALCULO. dê um nome do arquivo, utilizando o "Número" que será inserido no campo Número (na Identificação do Processo) que tem até 7 digitos, exemplo: calc_0123456.csv. Orquivo deve conter a coluna e valor, exemplo: 
    Identificacao do Processo_Numero | 1234567
    Identificacao do Digito | 12
    Reclamante_Nome | Fulano da Silva.
    Obs: me informe em seu chat a pasta que vai criar o arquivo (a pasta do projeto)
  2 - Valores e datas devem vir sem máscara pois o formulário possui essas máscaras
  3 - Identifique os a quantidade de caracteres dos campos, se houver, e que os valores obedeçam essa quantidade.
  
   
