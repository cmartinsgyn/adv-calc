PASSO 0 — Preparar o Windows (uma única vez)
Na sua VM Windows 10:
0.1 Baixar Python
Site oficial do Python


Versão: 3.11.x (Windows installer)


Durante a instalação:
✅ Marcar Add Python to PATH


✅ Manter pip habilitado


Avançar → Instalar


0.2 Verificar
Abra o Prompt de Comando:
python --version
pip --version

✔ Se ambos responderem, está tudo certo.

obs: do passo 1 ao 5 necessário para rodar os .robot em dev
PASSO 1 — Criar pasta do projeto
Escolha um local simples, por exemplo Documentos.
Crie a pasta:
calculadora-rpa


PASSO 2 — Criar os arquivos do projeto
Dentro da pasta calculadora-rpa, crie exatamente esta estrutura:
calculadora-rpa/
├── calculadora.robot
├── run_rpa.py
└── requirements.txt

Nada além disso por enquanto.

PASSO 2.1 — Arquivo calculadora.robot
Conteúdo completo e definitivo (Windows):
*** Settings ***
Library    RPA.Windows
Library    RPA.Desktop
Library    Process

*** Tasks ***
Calculo Sequencial Windows
    Start Process    calc.exe
    Sleep    2s
    Control Window    name:Calculadora

    # Limpar
    RPA.Windows.Click    automationid:clearButton
    Sleep    0.5s

    # 1 + 1
    RPA.Windows.Click    name:Um
    RPA.Windows.Click    automationid:plusButton
    RPA.Windows.Click    name:Um
    RPA.Windows.Click    automationid:equalButton
    Sleep    1s

    # Limpar
    RPA.Windows.Click    automationid:clearButton
    Sleep    0.5s

    # 2 × 2
    RPA.Windows.Click    name:Dois
    RPA.Windows.Click    automationid:multiplyButton
    RPA.Windows.Click    name:Dois
    RPA.Windows.Click    automationid:equalButton
    Sleep    1s

    # Fechar calculadora (atalho global)
    Fechar Calculadora

*** Keywords ***
Fechar Calculadora
    Sleep    0.5s
    Run Keyword And Ignore Error    Press Keys    ALT    F4



PASSO 2.2 — Arquivo run_rpa.py
Esse é o launcher, que depois vira .exe.
Crie o arquivo run_rpa.py com este conteúdo:
from robot import run
import os
import sys

def main():
    if getattr(sys, 'frozen', False):
        base_dir = sys._MEIPASS
    else:
        base_dir = os.path.dirname(os.path.abspath(__file__))

    robot_file = os.path.join(base_dir, "calculadora.robot")

    run(robot_file)

if __name__ == "__main__":
    main()


📌 Importante:
Ele foi escrito pensando no .exe


Funciona tanto em Python quanto empacotado



PASSO 2.3 — Arquivo requirements.txt
Crie o arquivo com exatamente:
robotframework
rpaframework


PASSO 3 — Criar ambiente virtual (isolado)
No Prompt de Comando, dentro da pasta calculadora-rpa:
python -m venv venv

Ativar o ambiente:
venv\Scripts\activate

Você verá algo como:
(venv) C:\...\calculadora-rpa>


PASSO 4 — Instalar dependências do projeto
Ainda com o venv ativo:
pip install -r requirements.txt

Isso instala:
Robot Framework


RPA Framework


Todas as dependências necessárias



PASSO 5 — Testar o robô (obrigatório)
Antes de gerar .exe, teste:
robot calculadora.robot

✔ Se a calculadora abrir e fizer as contas → continue
 ❌ Se falhar → pare aqui e corrija

PASSO 6 — Instalar PyInstaller
Ainda com o ambiente virtual ativo:
pip install pyinstaller




PASSO 7 — Gerar o .exe (passo crítico)
Execute exatamente este comando:
pyinstaller ^
  --onedir ^
  --clean ^
  --noupx ^
  --noconsole ^
  --collect-all robot ^
  --collect-all RPA ^
  --collect-all rpaframework ^
  --add-data "calculadora.robot;." ^
  run_rpa.py

pyinstaller ^
  --onedir ^
  --clean ^
  --noupx ^
  --noconsole ^
  --icon=calculadora.ico ^
  --collect-all robot ^
  --collect-all RPA ^
  --collect-all rpaframework ^
  --add-data "calculadora.robot;." ^
  calculadora.py
📌 O que isso faz:
--onefile → um único .exe
--noconsole → não abre terminal
--add-data → embute o .robot dentro do .exe
PASSO 8 — Localizar o executável final
Após o comando terminar, surgirá:
calculadora-rpa/
└── dist/
    └── run_rpa.exe
🎉 Esse arquivo já é o produto final

O QUE O CLIENTE PRECISA SABER
recebe run_rpa.exe
dá duplo clique
a calculadora abre e executa


✔ Sem Python
 ✔ Sem Robot
 ✔ Sem pip
 ✔ Sem terminal
FECHAMENTO (conceito importante)
Você desenvolve com Python + Robot
Você empacota com PyInstaller
O cliente executa um binário nativo
Isso é exatamente como RPA profissional funciona no mercado.
🚨 REFAZER / REGENERAR O .EXE: 
Ver falhas no robot empacotado:
pyinstaller ^
  --onedir ^
  --clean ^
  --noupx ^
  --collect-all robot ^
  --collect-all rpaframework ^
  --add-data "calculadora.robot;." ^
  run_rpa.py
Delete:
pasta build
pasta dist
arquivo run_rpa.spec


Depois gere novamente:  ** Passo 7
