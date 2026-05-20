# HackTools-Windows
Uma série de ferramentas que ajudam a fazer pentest/bugbounty em aplicações web.  
Ferramenta apenas para Windows   
(Versão Linux será postada em breve)

# Lista de Ferramentas
NMAP - Encontrar Portas abertas e Vulnerabilidades  
Cariddi - Encontrar vulnerabilidades em Sites PHP  
sqlmap - Entrar em Banco de dados de sites  
subfinder - Encontrar subdomínios  
subzy - Encontrar subdomínios vulneráveis a subdomain take over  
gobuster - Encontrar Diretorios Escondidos  

# Como Baixar
Baixe o zip do projeto pelo github, Logo Extraia ele na pasta de sua preferência.  
Clique com o botão esquerdo do mouse em qualquer lugar da pasta, Logo Clique em "Abrir com CMD" ou algo semelhante.  
Quando Abrir o CMD Cole o Comando:
``` Cmd
powershell -ExecutionPolicy Bypass -File .\install-tools.ps1
```
Espera a instalação ser Concluída, Logo após Execute o arquivo principal (.exe)

# Importante

Quando trabalhar com o "Encontrar Vulnerabilidades em sites PHP"  
Logo após colocar o alvo (com ou sem https:// ou http://)  
Coloque um "/" no final do alvo (sem espaço)  

Quando trabalhar com "Encontrar Subdomínios Vulneráveis"  
Se o arquivo do subdomínio tiver na mesma pasta do projeto  
coloque apenas a nome do arquivo  
exemplo: live.txt  
