## RULES
1 - Neste aquivo ## ... é um conjunto especício de funções a serem implementadas
2 - As instruções escritas e RULES devem ser as primeiras a serem aplicadas. Caso demais instruções desses documentos sobreponham essas roules, deve imediatamente ser avisado antes de prosseguir com o restante das alterações.
3 - Não alterar as mensagens e configurações de detecção de navegador e sessão existentes a não ser que seja explicitamente instruído.
4 - Na estrutura atual diminuir o tempo, especialmente para acionar novo calculo, exceto tempo de esperar servidor.
5 - Caso criadas novas funcionalidades ou funções, como o menu, dê preferencia a criar novos arquivos na estrutura e interligar. Exemplo pje_calc.robot faz tudo hoje mas pode criar uma nova para "criar novo calculo" e deixar pje_calc.robot para as funções principais como abrir, ver sessão etc. Avalie.
6 - Adaptar o projeto para não iniciar automaticamente o "adicionar novo calculo", mas iniciar com o ## MENU, che chamará o próprio adicionar novo calculo e outras que vamos criar.
7 - Criar uma variável global chamada "statuscli" que será usada para guardar se o usuário está ativo ou inativo. Deverá iniciar com a o valor "teste" e poderá ser alterada pela nossa aplicação.
8 - Deverá ser criado um período de teste de 30 dias para nosso usuário. Quando nossa aplicação for aberta a primeira vez deve ser armazenado na aplicação, pode ser através de uma variável global (se a criar chame de periodoteste), iniciando com 30 sendo descrecido em 1 de acordo com a verificação da "data atual", ou seja, hoje 30, amanhã 29 e assim por diante até chegar a zero, assim termina a função.
9 - Criar função para procedir toda vez que iniciarmos nossa aplicação: 
    - Função statusCliente:
          - Caso teste > 0, exibir uma mensgem na tela: "Período de teste ativo (29) dias restantes". Obs: 
          - Caso teste = 0, chamar a api: https://6997c0ded66520f95f15a496.mockapi.io/:endpoint. O :endpoint será o codigo de licença do usuário e deverá ter uma variável como valor "12345"
            - Deverá capturar o retorno e proceder: 
             - Caso sucesso no retorno, capturar valor "statuscli" no header e proceder:
              - Se valor ativo, inativo, ALTERAR a variável global conforme item 7 de ## RULES
               - Exibir uma mensagem na tela, variando de acordo com o retorno: 
                - Se ativo: "Cliente Ativo, tudo certo!
                - Se inativo: "Cliente Inativo, favor contate o administrador ou adquira um de nossos planos!"                 
             - Caso falha no retorno ou valor diferente de ativo, inativo ou teste, avisar por mensagem na tela ao usuário: "Não foi possível verificar a licença." e Fechar Adv-Calc após usuário clicar em OK


## MENU
 Vamos agora fazer um formulário de menu para abrir assim que o executável for acionado e pje-calc for aberto. Ações como clicar no botão "Criar Novo Cálculo" e as demais devem obedecer a escolha por este formulário de menu que será o item principal.
 - IMPORTANTE: Ao abrir o formulário de menu verificar o período de teste
 - Estrutura do Formulário:
  - No topo
    - Título: AdvCalc - Assistência de Cáculos Trabalhistas para Advogado (destacado).
    - Instruções: Selecione as opções e o PJE-CALC do TRT abrirá e será preenchido automaticamente.
  
  - No corpo
    - Botões grandes alinhados na horizontal: 
      - Botão "Criar Novo Cálculo" (mesma função que já faz hoje) 
      - Botão "Verificar Licença"
        - Verificar período de teste (item 8 de ## RULES) e proceder conforme função definida no item 9 de ## RULES.
  - No rodapé
    - Botão Fechar (aqui poderá ser aplicada a função de fechar que tínha sido comentada)

