# CRIAÇÃO DA AUTOMAÇÃO DO NOVO CÁLCULO (PJe-Calc)

Este documento serve como prompt/especificação completa para a criação da automação da tela de **Novo Cálculo** do sistema PJe-Calc, contemplando o preenchimento integrado das abas **"Dados do Processo"** e **"Parâmetros do Cálculo"**, bem como a orquestração e gestão de dados.

Para recriar este sistema do zero, siga rigorosamente as arquiteturas, mapeamentos e estratégias técnicas detalhadas abaixo.

---

## 1. ARQUITETURA E ESTRUTURA DO PROJETO

O sistema deve ser estruturado nos seguintes arquivos:
1. **`tasks/pje_calc.robot`**: Arquivo principal (Task) que orquestra a execução. Chama o provedor de dados e as keywords de preenchimento.
2. **`resources/dados_calculo.resource.robot`**: Arquivo de Robot Framework contendo as variáveis (seletores HTML) e as Keywords de interação com o navegador.
3. **`libraries/pje_data_provider.py`**: Biblioteca em Python responsável por ler os dados de entrada do sistema e fornecer para o robô via `@dataclass`.
4. **`dados/calc_{numero_busca}.csv`**: Arquivo CSV (separado por `;`) que serve de base de dados para preenchimento.

---

## 2. ESPECIFICAÇÃO DO DATA PROVIDER (`pje_data_provider.py` e CSV)

Crie um `@dataclass` chamado `DadosProcesso` que conterá todos os atributos necessários para as duas abas.
A função `obter_dados_para_calculo(numero_busca)` deve:
1. Ler o arquivo em `dados/calc_{numero_busca}.csv`.
2. Tratar converções de texto ("SIM", "NAO") para `boolean`.
3. Processar campos de exceção (Carga Horária e Sábado). Estes vêm no CSV agrupados na mesma linha e devem ser processados como listas de dicionários.
   - Exemplo CSV para Carga Horária: `Excecao_CargaHoraria;01012021,31122021,180,00` (inicio, fim, valor decimal).
   - Exemplo CSV para Sábado: `Excecao_Sabado;01012022,31122022` (inicio, fim).
4. Fornecer valores padrões tolerantes a falhas caso o dado não exista.

---

## 3. MAPEAMENTO E PREENCHIMENTO: DADOS DO PROCESSO

Mapeie e preencha os seguintes blocos na aba "Dados do Processo":

* **Identificação do Processo**:
  * Campos: Número, Dígito, Ano, Tribunal, Vara, Valor da Causa, Autuado em.
* **Reclamante**:
  * Campos: Nome.
  * Documento Fiscal: Possui um radio button (Tipos: CPF, CNPJ, CEI) que libera o campo Número. Selecionar o radio correto dinamicamente pelo tamanho da string (11=CPF, 14=CNPJ, 12=CEI).
  * Documento Previdenciário: Radio button (PIS, PASEP, NIT). Clicar em "PIS" por padrão.
* **Advogado (Reclamante e Reclamado)**:
  * Campos: Nome, OAB.
  * Documento Fiscal: Mesma lógica de radio button por quantidade de caracteres.
  * Botão de Inclusão: Após preencher os dados do advogado, clicar no botão "Adicionar Advogado" (id: `formulario:incluirAdvogadoReclamante` e `Reclamado`). 

---

## 4. MAPEAMENTO E PREENCHIMENTO: PARÂMETROS DO CÁLCULO

Após salvar/concluir a primeira aba, navegar/preencher a aba "Parâmetros do Cálculo".

* **Localização**: Estado e Município. (Atenção: Ao selecionar o Estado, o sistema dispara um AJAX de ~2 segundos para carregar as cidades. É obrigatório aguardar antes de selecionar o Município).
* **Datas do Cálculo**: Admissão, Demissão, Ajuizamento.
* **Limitar Cálculo**: Data Inicial, Data Final. Checkbox "Aplicar Prescrição" (Verbas Quinquenal).
* **Outros Parâmetros**: Regime de Trabalho (Select), Maior Remuneração, Última Remuneração, Prazo de Aviso Prévio (Select).
* **Checkboxes de Configuração**: Projetar Aviso Prévio Indenizado, Limitar Avos ao Período, Zerar Valor Negativo, Considerar Feriados Estaduais e Municipais.
* **Carga Horária**:
  * Preencher o campo Padrão (ex: 220,00).
  * **Exceções**: Iterar sobre a lista lida do CSV, preenchendo Início, Fim e Valor, e clicando no botão "Adicionar Base".
* **Sábado**:
  * Marcar ou desmarcar o checkbox de Sábado como Dia Útil.
  * **Exceções**: Iterar sobre a lista de exceções, preenchendo Início e Fim, e clicando em "Adicionar Base".

---

## 5. ESTRATÉGIAS TÉCNICAS E BOAS PRÁTICAS OBRIGATÓRIAS (CRÍTICO)

O PJe-Calc utiliza *RichFaces* (JSF) antigo, altamente baseado em AJAX e máscaras JS. Siga estritamente:

1. **Campos com Máscara (Datas, Moeda, CPF/CNPJ, OAB)**:
   - NÃO use apenas `Input Text`.
   - Use a estratégia de simular digitação humana:
     1. `Click Element` no campo.
     2. `Clear Element Text` (para garantir que esteja limpo).
     3. `Press Keys` com o valor desejado para disparar o evento keyup/keydown.
     4. `Press Keys TAB` no final para que o JS aplique a formatação final/validação do campo.

2. **Espera de Processamento AJAX (A4J)**:
   - Crie uma keyword `Esperar Processamento PjeCalc` que execute código JavaScript puro verificando se a div de loader (`msgAguarde`) desapareceu e a opacidade está zero.
   - Chame esta keyword após qualquer clique em Radio Buttons, Checkboxes, ou saídas (`TAB`) de campos importantes, pois eles comumente engatilham eventos assíncronos.

3. **Inclusão em Tabelas (Ex: Advogados, Exceções CH)**:
   - Ao clicar nos botões de "Adicionar", crie uma estratégia de fallback poderosa:
     - Tente clicar com o `Click Element` normal do Selenium.
     - Aguarde o AJAX.
     - Verifique via JS se a tabela HTML (`tr`s) foi populada. Se não foi:
     - Tente clicar diretamente via `Execute Javascript` (fallback 1).
     - Se ainda não popular, utilize injeção A4J pura (`A4J.AJAX.Submit`) forçando um re-render da região principal do formulário (fallback 2).

4. **Human-In-The-Loop (Revisão e Salvamento)**:
   - Como passo final da automação de Novo Cálculo, após preencher as duas abas, **NÃO** salve automaticamente.
   - Utilize a API do Windows (`ctypes.windll.user32.MessageBoxW`) via Python/Evaluate para abrir uma caixa de diálogo informando ao usuário: *"Formulário preenchido, faça a verificação e clique em Salvar para liberar os demais lançamentos."*
   - Entre em um loop de monitoramento onde o robô observa o DOM do PJe-Calc:
     - **Sucesso**: O robô detecta que o elemento do menu lateral `li_calculo_historico_salarial` apareceu.
     - **Erro**: O robô detecta o painel de mensagens de erro do JSF (`formulario:painelMensagens`).
     - **Timeout**: Se passar um tempo estipulado (ex: 60s), perguntar ao usuário (via `MessageBox` Sim/Não) se ele quer continuar aguardando o robô.

Se seguir este documento, o sistema final lidará corretamente com toda a complexidade da tela "Novo Cálculo" do PJe-Calc.
