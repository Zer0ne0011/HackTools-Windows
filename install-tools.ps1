# install-tools.ps1
# Executar como Administrador

$ErrorActionPreference = "Stop"

Write-Host "`n=== Atualizando winget ===`n"
winget source update

# Função para checar se comando existe
function Check-Command($cmd) {
    try {
        Get-Command $cmd -ErrorAction Stop | Out-Null
        return $true
    } catch {
        return $false
    }
}

# ===== Instalações =====

Write-Host "`n=== Instalando Nmap ===`n"
winget install --id Insecure.Nmap -e --accept-package-agreements --accept-source-agreements

Write-Host "`n=== Instalando Go (Golang) ===`n"
winget install --id GoLang.Go -e --accept-package-agreements --accept-source-agreements
$env:PATH += ";C:\Program Files\Go\bin;$env:USERPROFILE\go\bin"

Write-Host "`n=== Instalando Git ===`n"
winget install --id Git.Git -e --accept-package-agreements --accept-source-agreements
$env:PATH += ";C:\Program Files\Git\cmd"

Write-Host "`n=== Instalando Python ===`n"
winget install --id Python.Python.3.11 -e --accept-package-agreements --accept-source-agreements
$env:PATH += ";C:\Users\$env:USERNAME\AppData\Local\Programs\Python\Python311\Scripts;C:\Users\$env:USERNAME\AppData\Local\Programs\Python\Python311"

# ===== Instalando sqlmap =====
Write-Host "`n=== Instalando sqlmap ===`n"

$toolsPath = "$env:USERPROFILE\tools"
$sqlmapPath = "$toolsPath\sqlmap"

if (!(Test-Path $toolsPath)) {
    Write-Host "Criando pasta $toolsPath..."
    New-Item -ItemType Directory -Path $toolsPath | Out-Null
}

Set-Location $toolsPath

if (!(Test-Path $sqlmapPath)) {
    if (!(Check-Command git)) {
        Write-Host "Git não encontrado no PATH. Instale o Git antes de continuar." -ForegroundColor Red
        exit 1
    }
    Write-Host "Clonando sqlmap do GitHub..."
    git clone --depth 1 https://github.com/sqlmapproject/sqlmap.git
} else {
    Write-Host "sqlmap já está presente."
}

# ===== Instalando ferramentas Go =====
Write-Host "`n=== Instalando Gobuster ===`n"
go install github.com/OJ/gobuster/v3@latest

Write-Host "`n=== Instalando Cariddi ===`n"
go install -v github.com/edoardottt/cariddi/cmd/cariddi@latest

Write-Host "`n=== Instalando Subfinder ===`n"
go install github.com/projectdiscovery/subfinder/v2/cmd/subfinder@latest

Write-Host "`n=== Instalando Httpx ===`n"
go install -v github.com/projectdiscovery/httpx/cmd/httpx@latest
 
Write-Host "`n=== Instalando Subzy ===`n"
go install -v github.com/PentestPad/subzy@latest

# ===== Verificando instalações =====
Write-Host "`n=== Ferramentas instaladas ===`n"

Write-Host "Nmap:"
nmap --version

Write-Host "`nGo:"
go version

Write-Host "`nGobuster:"
$gobusterPath = "$env:USERPROFILE\go\bin\gobuster.exe"
if (Test-Path $gobusterPath) { & $gobusterPath -h } else { Write-Host "Gobuster não encontrado." }

Write-Host "`nSubfinder:"
$subfinderPath = "$env:USERPROFILE\go\bin\subfinder.exe"
if (Test-Path $subfinderPath) { & $subfinderPath -h } else { Write-Host "Subfinder não encontrado." }

Write-Host "`nSubzy:"
$subzyPath = "$env:USERPROFILE\go\bin\subzy.exe"
if (Test-Path $subzyPath) { & $subzyPath -h } else { Write-Host "Subzy não encontrado." }

Write-Host "`nsqlmap:"
python "$sqlmapPath\sqlmap.py" --version

Write-Host "`nPython:"
python --version

Write-Host "`n=== Finalizado ==="