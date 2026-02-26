
##  NOVO CÁLCULO -> ABA Parâmetros do Cálculo
  
 Temos, na mesma página calculo.jsf a aba que fizemos até agora "Dados do Processo", onde populamos "Reclamante, Reclamado, Advogado etc", e a aba "Parâmetros do Cálculo".  O html da página está em html_pagina_calculo_parametro.md. Você fez o seguinte mapeamento inicial:

 1. Dados de Identificação e Período
Estes campos definem o intervalo de tempo do cálculo e a base de dias.
Campo	ID do Elemento	Tipo	Observação
Data de Admissão	formulario:dataAdmissaoInputDate	Data	Data de início do vínculo
Data de Demissão	formulario:dataDemissaoInputDate	Data	Data de término do vínculo
Data de Ajuizamento	formulario:dataAjuizamentoInputDate	Data	Data de entrada da ação
Data Final do Cálculo	formulario:dataFinalCalculoInputDate	Data	Limite para apuração
Base de Dias (Mês)	formulario:baseDiasMes	Select	Ex: 30 dias, Dias Reais, etc.
Base de Dias (Ano)	formulario:baseDiasAno	Select	Ex: 360 dias, 365 dias, etc.
2. Prescrição
Define se haverá corte de verbas por decurso de prazo.
Campo	ID do Elemento	Tipo
Data da Prescrição	formulario:dataPrescricaoInputDate	Data
Prescrição do FGTS	formulario:dataPrescricaoFgtsInputDate	Data
3. Configurações de Horas Extras e Jornada
Parâmetros que afetam o cálculo de verbas variáveis.
Campo	ID do Elemento	Tipo	Observação
Carga Horária Semanal	formulario:cargaHorariaSemanal	Texto/Número	Padrão 44h
Carga Horária Mensal	formulario:cargaHorariaMensal	Texto/Número	Padrão 220h
Divisor de Horas Extras	formulario:divisorHorasExtras	Texto/Número	
Sábado é dia útil?	formulario:sabadoDiaUtil	Select (S/N)	
Projetar Aviso Prévio?	formulario:projetarAvisoPrevio	Checkbox	
4. Opções de Cálculo e Correção
Configurações sobre como o sistema deve se comportar em situações específicas.
Campo	ID do Elemento	Tipo
Regime de Caixa/Competência	formulario:regimeCaculo	Select
Tipo de Atualização Monetária	formulario:tipoAtualizacao	Select
Índice de Correção	formulario:indiceCorrecao	Select
Juros de Mora (Tipo)	formulario:tipoJuros	Select
Data Inicial dos Juros	formulario:dataJurosInputDate	Data
5. FGTS e Contribuições Social
Campo	ID do Elemento	Tipo
Alíquota FGTS	formulario:aliquotaFgts	Texto/Número
Multa FGTS (%)	formulario:multaFgts	Texto/Número
Calcular INSS?	formulario:calcularInss	Checkbox
Calcular IRRF?	formulario:calcularIrrf	Checkbox

#end

Os campos da, copiados de calculo.jsf -> aba Parametros do Cálculo, são:
Estado *

Município *

Datas do Cálculo
Admissão *
	Demissão
	Ajuizamento *

Limitar Cálculo
Data Inicial
	Data Final
	Aplicar Prescrição

 Verbas (Quinquenal) FGTS
Outros Parâmetros
Regime de Trabalho

Tempo Integral
Maior Remuneração
Última Remuneração
Prazo de Aviso Prévio

Calculado
 Projetar Aviso Prévio Indenizado
 Limitar Avos ao Período do Cálculo
 Zerar Valor Negativo (Padrão)
 Considerar Feriados Estaduais
 Considerar Feriados Municipais
Carga Horária
Padrão *:	
220,00
Exceções
Início
	Fim
	Exceção

Sábado
 Sábado como Dia Útil
Exceções
Início
	Fim
	

Pontos Facultativos
Ponto Facultativo

# end

# EVOLUÇÃO:
Quero que faça o mesmo que fez para aba "Dados do Processo", mapeando os campos restante e ADICIONANDO ao nosso pje_data_provider, ao nosso dados_calculo.robot e outros locais da arquitetura o necessário para popular mais dados.
Esses dados fazem parte do processo de novo cálculo, portanto são uma continuação.
Abas "Dados do Processo" e "Parâmetros do Cálculo" podem, a critério técnico, serem preenchidas paralelamente.
Quando as duas abas forem preenchidas corretamente deve exiba uma caixa de mensagem com o texto "Revise os lançamentos das Abas Dados do Processo e Parâmetros do Cálculo e clique em Salvar pra Liberar os demais lançamentos".
- Quando clicar em Salvar, deve acionar uma função "executarDemaisLancamentos". Essa função deve detectar se os dados foram salvos com sucesso, caso sim exibir uma mensagem(que no futuro será substituída por tarefas reais) "Executando demais lançamentos ...", caso tenha algum erro ou nada for detectado exibir "Erro ao salvar".

## EVOLUÇÃO - CONSIDERAÇÕES IMPORTANTES
- Existem campos Estado(id=formulario:estado) e Município(formulario:municipio) que se completam, ou seja, quando o Estado é inserido faz uma busca pelos Município. A busca dura cerca de 2 segundos, aí a cidade pode ser inserida. 
- Se atente às estratétias de máscaras como data e valores que já estão presentes em Dados do Processo
- Campos de "Excessões" (que são duas, uma para Carga Horária e outra para Sábado) têm Data Inicio e Fim e Exceção(valor) que devem ser preenchidos e clicados no botão "Adicionar Base", e itens vão ser acrescentados em uma tabela, caso semelhante a "Adicionar Advogado" em Dados do Processo. Faça semelhante.
1 - Marcar ou NÃO marcar os seguintes checkbox:
    - Aplicar Prescrição: Verbas (Quinquenal) - SIM

    - Projetar Aviso Prévio Indenizado - SIM
    - Limitar Avos ao Período do Cálculo - NÃO
    - Zerar Valor Negativo (Padrão) - NÃO
    - Considerar Feriados Estaduais - SIM
    - Considerar Feriados Municipais - SIM
- TODO: Por enquanto não mexa em Pontos Facultativos

## VALORES
  1 - Os valores devem ser fictícios e adicionados a dados/calc_0000123.csv.
  2 - Valores e datas devem vir sem máscara pois o formulário possui essas máscaras
  3 - Identifique os a quantidade de caracteres dos campos, se houver, e que os valores obedeçam essa quantidade.
  4 - Valor do campo "Estado" = GO. Valor do campo "Município" = GOIANIA
  5 - Valores de múltipla escolha(select) dos campos devem ser preenchidos com o valor padrão
  6 - Os valores de checkbox devem ser considerados como no item 1 de ## EVOLUÇÃO - CONSIDERAÇÕES IMPORTANTES.
  7 - Valor padrão para os seguintes campos:
     - Prazo de Aviso Prévio: Calculado

  
   
