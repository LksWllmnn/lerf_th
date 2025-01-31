@echo off

@REM Helper Script for faster rendering

:: Variablen definieren
set "building_name=Buidling-name"
set "case_name=no-finetuning"


set "camera_file_name=Matrices for rendering.json"
set "output_path_root=..."

:: Bedingte Logik für load-config-path
if "%case_name%"=="scene" (
    set "load_config_path=config.yml"
) else if "%case_name%"=="surround" (
    set "load_config_path=config.yml"
) else if "%case_name%"=="big-surround" (
    set "load_config_path=config.yml"
) else if "%case_name%"=="no-finetuning" (
    set "load_config_path=config.yml"
) else (
    echo Ungueltiger case_name: %case_name%
    exit /b 1
)

:: Erster Render-Befehl
set "command1=ns-render camera-path --load-config %load_config_path% --camera-path-filename %camera_file_name% --rendered-output-names composited_0 --output-format images --output-path %output_path_root%\%case_name%\qualitativ\%building_name%\"
echo %command1%
%command1%

:: Zweiter Render-Befehl
set "command2=ns-render camera-path --load-config %load_config_path% --camera-path-filename %camera_file_name% --rendered-output-names my_output --output-format images --output-path %output_path_root%\%case_name%\just-mask\%building_name%\"
echo %command2%
%command2%

echo Batch-Skript abgeschlossen.
