@echo off
chcp 65001 > nul
setlocal enabledelayedexpansion

::============================================================
::=            FLUTTER DEV STARTER SCRIPT (.BAT)            =
::= Este script permite escolher onde rodar seu app Flutter =
::= com suporte a emulador Android e navegadores (Chrome,   =
::= Edge e o navegador padrão do sistema).                  =
::============================================================

::=== VARIÁVEL DE CONFIGURAÇÃO FIXA PARA EMULADOR ===========
:: Altere este valor conforme o ID do seu emulador Flutter.
:: Para descobrir: execute `flutter devices` após abrir o emulador.
:: Exemplo comum: emulator-5554
set EMULATOR_ID=emulator-5554

echo.
echo ============================================
echo =         FLUTTER DEV STARTER SCRIPT       =
echo ============================================
echo.

echo Onde deseja rodar o app?
echo [1] Emulador Android (Pixel_3a)
echo [2] Navegador Chrome
echo [3] Navegador Edge
echo [4] Navegador padrão do sistema
set /p target="Digite o número da opção: "

::=== EMULADOR ANDROID ========================
if "%target%"=="1" (
    echo Iniciando o emulador Pixel_3a via Flutter...
    flutter emulators --launch Pixel_3a

    echo Aguardando emulador aparecer no Flutter...
    :wait_for_device
    timeout /t 3 >nul
    flutter devices | findstr "%EMULATOR_ID%" >nul
    if errorlevel 1 goto wait_for_device

    echo Emulador detectado: %EMULATOR_ID%
    echo Iniciando app Flutter no emulador...
    flutter run -d %EMULATOR_ID%
    exit /b
)

::=== NAVEGADOR CHROME ========================
if "%target%"=="2" (
    echo Iniciando app Flutter no Chrome...
    flutter run -d chrome
    exit /b
)

::=== NAVEGADOR EDGE ==========================
if "%target%"=="3" (
    echo Iniciando app Flutter no Edge...
    flutter run -d edge
    exit /b
)

::=== NAVEGADOR PADRÃO DO SISTEMA =============
if "%target%"=="4" (
    echo Iniciando app Flutter no navegador padrão do sistema...
    flutter run -d web-server
    exit /b
)

::=== OPÇÃO INVÁLIDA ==========================
echo Opção inválida.
pause
