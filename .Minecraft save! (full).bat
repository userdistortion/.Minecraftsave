@echo off

title .Minecraft save!
color 0f

setlocal enabledelayedexpansion

:: Rutas base
set "MINECRAFT=%userprofile%\AppData\Roaming\.minecraft"
set "SAVES=%MINECRAFT%\saves"
set "SHOTS=%MINECRAFT%\screenshots"

:: Ruta donde se ejecuta el .bat
set "DEST_BASE=%~dp0"

:: Obtener fecha actual en formato AAAAMMDD
for /f "tokens=2 delims==." %%a in ('"wmic os get LocalDateTime /value"') do set datetime=%%a
set "FECHA=%datetime:~0,4%%datetime:~4,2%%datetime:~6,2%"

:: Menu
echo =================================
echo   COPIA DE SEGURIDAD .MINECRAFT
echo =================================
echo.
echo  1. Carpeta completa (.minecraft %FECHA%)
echo  2. Mundos (.minecraft mundos)
echo  3. Capturas (.minecraft capturas)
echo.
set /p OPCION=Escriba 1, 2 o 3 y presione ENTER: 

:: Opcion 1 - Copia completa
if "%OPCION%"=="1" (
    set "DEST=%DEST_BASE%.minecraft_%FECHA%"
    mkdir "!DEST!"
    echo.
    echo Iniciando copia de seguridad.
    echo.
    xcopy "%MINECRAFT%" "!DEST!\" /E /H /C /I /Y
    echo.
    echo Copia completa realizada en:
    echo "!DEST!"
    goto END
)

:: Opcion 2 - Solo mundos (sobrescribe)
if "%OPCION%"=="2" (
    set "DEST=%DEST_BASE%.minecraft_mundos"
    mkdir "!DEST!" >nul 2>&1
    echo.
    echo Iniciando guardado de mundos.
    echo.
    xcopy "%SAVES%" "!DEST!\" /E /H /C /I /Y
    echo.
    echo Mundos guardados en:
    echo "!DEST!"
    goto END
)

:: Opcion 3 - Solo capturas (sin sobrescribir)
if "%OPCION%"=="3" (
    set "DEST=%DEST_BASE%.minecraft_capturas"
    mkdir "!DEST!" >nul 2>&1
    echo.
    echo Iniciando copia de capturas.
    echo.
    xcopy "%SHOTS%" "!DEST!\" /E /H /C /I /Y /D
    echo.
    echo Capturas nuevas copiadas en:
    echo "!DEST!"
    goto END
)

:: Opcion invalida
echo.
echo Opcion no valida. Intente de nuevo.
goto END

:END
echo.
echo Operacion finalizada exitosamente.
echo.
pause

:: Programa creado por Axel N. Inca el 14 de julio de 2025.
:: http://youtube.com/post/UgkxhYbnJJQE_86exvLZAw5GQcISuRRjaCyY?si=geJpYamUTVv7dj5m