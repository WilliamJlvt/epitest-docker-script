@echo off
docker rm -f valgrind-env 2>nul
docker run -it --rm --platform linux/amd64 --name valgrind-env -v %cd%:/home/epitech -w /home/epitech epitechcontent/epitest-docker:latest %*
