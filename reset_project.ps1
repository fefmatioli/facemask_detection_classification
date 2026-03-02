param(
    [switch]$Full = $false,        
    [switch]$KeepModels = $false   
)

Write-Host ">> Reset do projeto iniciado..."

$scriptDir = Split-Path -Parent $PSCommandPath
Set-Location $scriptDir

function Remove-IfExists($path) {
    if (Test-Path $path) {
        Remove-Item -Recurse -Force $path -ErrorAction SilentlyContinue
    }
}
function Remove-FileIfExists($path) {
    if (Test-Path $path) {
        Remove-Item -Force $path -ErrorAction SilentlyContinue
    }
}

Remove-IfExists "data\interim"
Remove-IfExists "data\processed"

if (-not $KeepModels) {
    Remove-IfExists "models"
}

Remove-IfExists "reports\figures"
Remove-FileIfExists "reports\pred_counts.csv"

Get-ChildItem -Directory -Recurse -Force | Where-Object {
  $_.Name -in @(".ipynb_checkpoints","__pycache__")
} | Remove-Item -Recurse -Force -ErrorAction SilentlyContinue

if ($Full) {
    Remove-IfExists ".venv"
}

New-Item -ItemType Directory "reports\figures" -Force | Out-Null
if (-not $KeepModels) { New-Item -ItemType Directory "models" -Force | Out-Null }

Write-Host ">> Reset concluído."
Write-Host "   Dica: mantenha 'data/raw' com o dataset e rode o notebook novamente."