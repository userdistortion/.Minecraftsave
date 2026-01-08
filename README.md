# .Minecraftsave! (Copia de seguridad de la carpeta .minecraft)

## Descarga

[.Minecraft save! (full).zip](https://github.com/user-attachments/files/21359320/default.Minecraft.save.full.zip)

[.Minecraft save! (slim).zip](https://github.com/user-attachments/files/21359321/default.Minecraft.save.slim.zip)

## Historia

La creación de este programa partió de un problema que tuvo 11664131244122125 cuando formateó su computadora y se perdió su progreso de Minecraft, porque al poco tiempo también formateé la mía y creí que había perdido ese mundo que compartíamos. Entonces, se me ocurrió crear una herramienta sencilla para que la persona con quien jugaba ya no tuviera que enfrentarse al trabajo tedioso que conlleva el crear una copia de seguridad de la carpeta de .minecraft, porque hacer un "copy-paste" resulta sencillo, sí, pero al largo plazo ese método resulta en ocupar espacio del disco duro que no necesita ocupar, por ello este programa se enfoca en lo esencial, el guardado de "mundos y capturas" lo que es realmente importante para conservar sobre el avance del juego. Este programa cuenta con tres opciones iniciales, las cuales son guardar: 1) .minecraft (carpeta completa), 2) Mundos (los mundos de minecraft dentro de .minecraft), 3) Screenshots (las capturas que se toman dentro del juego).

Conseguir que el programa hiciera todo esto fue complicado, pues hace tiempo que no tomaba el CMD para programar algo así, por ello este programa representa también una responsabilidad conmigo mismo, pues por muchos años, aproximadamente desde 2014, tuve que diseñar esta herramienta pero no lo hacía, primero por procastinar y disfrutar mi momento con mis amigos y, segundo, por no querer profundizar en el estudio de CMD a pesar de que ya conocía herramientas que se hacían con esto.

En fin, este programa es mi forma de devolverle a Minecraft (java) un aporte que debí hacer hace tiempo cuando el juego era más popular. Sé que no tendrá demasiada repercusión hoy en día y será una herramienta que pocos usarán, pero me siento un poco mejor al saber que lo hice, que di a Minecraft lo que debía y que, en esencia, le entrego esto que es parte de mi ser.

## Código

<pre>
@echo off

mode 52,25
title .Minecraft save!
color 0f

setlocal enabledelayedexpansion

:: Rutas base
set "MINECRAFT=%userprofile%\AppData\Roaming.minecraft"
set "SAVES=%MINECRAFT%\saves"
set "SHOTS=%MINECRAFT%\screenshots"

:: Ruta donde se ejecuta el .bat
set "DEST_BASE=%~dp0"

:: Obtener fecha actual en formato AAAAMMDD
for /f "tokens=2 delims==." %%a in ('"wmic os get LocalDateTime /value"') do set datetime=%%a
set "FECHA=%datetime:~0,4%%datetime:~4,2%%datetime:~6,2%"

:: Menu
echo =================================
echo COPIA DE SEGURIDAD .MINECRAFT
echo =================================
echo.
echo 1. Carpeta completa (.minecraft %FECHA%)
echo 2. Mundos (.minecraft mundos)
echo 3. Capturas (.minecraft capturas)
echo.
set /p OPCION=Escriba 1, 2 o 3 y presione ENTER:

:: Opcion 1 - Copia completa
if "%OPCION%"=="1" (
set "DEST=%DEST_BASE%.minecraft_%FECHA%"
mkdir "!DEST!"
echo.
echo Iniciando copia de seguridad.
echo.
xcopy "%MINECRAFT%" "!DEST!" /E /H /C /I /Y
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
xcopy "%SAVES%" "!DEST!" /E /H /C /I /Y
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
xcopy "%SHOTS%" "!DEST!" /E /H /C /I /Y /D
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
exit

:: Programa creado por Axel N. Inca el 14 de julio de 2025.
:: http://youtube.com/post/UgkxhYbnJJQE_86exvLZAw5GQcISuRRjaCyY?si=geJpYamUTVv7dj5m
</pre>
