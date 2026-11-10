$ErrorActionPreference = 'Stop'
Push-Location (Join-Path $PSScriptRoot '..')
try {
    if (-not (Get-Command cargo -ErrorAction SilentlyContinue)) {
        throw 'Instala Rust 1.95 ou superior (rustup.rs) e Visual Studio Build Tools com C++ e Windows SDK.'
    }
    $env:PDFCRAFT_BUILD_LABEL = 'XandexPDF Studio - Mocambique - desenvolvimento'
    cargo build --locked --release -p pdfcraft
    if ($LASTEXITCODE -ne 0) { throw 'A compilacao falhou. Nao foi criado um pacote novo.' }
    $package = Join-Path $PWD 'dist/XandexPDF_Studio_Windows'
    New-Item -ItemType Directory -Force $package | Out-Null
    Copy-Item 'target/release/pdfcraft.exe' (Join-Path $package 'XandexPDF.exe')
    Copy-Item 'LICENSE-MIT', 'LICENSE-APACHE', 'NOTICE', 'ATTRIBUTION.md' $package
    Copy-Item 'README.md' (Join-Path $package 'LEIA-ME.md')
    Set-Content -LiteralPath (Join-Path $package 'portable.txt') -Value 'XandexPDF Studio portable mode'
    Write-Host "Compilacao de desenvolvimento: $package"
    Write-Host 'Exige testes no Windows e validacao offline antes de distribuir.'
} finally {
    Pop-Location
}
