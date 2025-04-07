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

::=== AJUSTES INICIAIS DE TELA ================================
title FLUTTER DEV STARTER
mode con: cols=78 lines=25
color 0E
cls

::=== TÍTULO ==================================================
echo.
echo ***********************************************************
echo *                                                         *
echo *            FLUTTER DEV STARTER - .BAT SCRIPT            *
echo *                                                         *
echo ***********************************************************

::=== MENU ====================================================
echo.
echo Escolha onde deseja rodar seu app Flutter:
echo.
echo   [1] Emulador Android (Pixel_3a)
echo   [2] Navegador Chrome
echo   [3] Navegador Edge
echo   [4] Navegador padrão do sistema
echo.

set /p target="Digite o número da opção desejada: "
echo.

::=== OPÇÃO 1 - EMULADOR ANDROID =============================
if "%target%"=="1" (
    echo Iniciando o emulador Pixel_3a via Flutter...
    flutter emulators --launch Pixel_3a

    echo.
    echo Aguardando o emulador aparecer no Flutter...
    :wait_for_device
    timeout /t 3 >nul
    flutter devices | findstr "%EMULATOR_ID%" >nul
    if errorlevel 1 goto wait_for_device

    echo.
    echo Emulador detectado: %EMULATOR_ID%
    echo Iniciando app Flutter no emulador...
    echo.
    flutter run -d %EMULATOR_ID%
    exit /b
)

::=== OPÇÃO 2 - NAVEGADOR CHROME =============================
if "%target%"=="2" (
    echo Iniciando app Flutter no Chrome...
    echo.
    flutter run -d chrome
    exit /b
)

::=== OPÇÃO 3 - NAVEGADOR EDGE ===============================
if "%target%"=="3" (
    echo Iniciando app Flutter no Edge...
    echo.
    flutter run -d edge
    exit /b
)

::=== OPÇÃO 4 - NAVEGADOR PADRÃO =============================
if "%target%"=="4" (
    echo Iniciando app Flutter no navegador padrão do sistema...
    echo.
    flutter run -d web-server
    exit /b
)

::=== OPÇÃO INVÁLIDA =========================================
echo Opção inválida. Execute novamente e escolha uma opção entre 1 e 4.
echo.
pause
