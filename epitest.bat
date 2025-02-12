@echo off
docker info >nul 2>&1
if %errorlevel% neq 0 (
    echo Docker n'est pas lance. Veuillez demarrer Docker Desktop.
    exit /b 1
)

docker rm -f epitest-environment 2>nul
docker run -it --rm --platform linux/amd64 --name epitest-environment -v %cd%:/home/epitech -w /home/epitech epitechcontent/epitest-docker:latest %*
