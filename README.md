## Bizlunch infrastructure - As code -

Welcome to Bizlunch infrastructure as code.

### Technos

- Vagrant
- Docker > 1.8 & Docker compose > 1.6
- Bash

### Requirements

- Vagrant
- VirtualBox
- Shell console

### Dev - init

Vagrant to setup dev environment, with Docker and Docker compose inside.

Use bootstrap.sh script or manually:

1- Create a "bizlunch" folder
2- Clone all git projects
1- "cd" to the desired stack
2- Run "vagrant up"

Inside vagrant machine, 

1- Create the Docker machine ```make docker/dev-machine/create```
2- Start the Docker machine ```make docker/dev-machine/start```
3- Set your dev machine hosts ```make init/hosts```
4- Set Docker machine symlinks ```make init/symlinks```
5- Build Docker base images ```make docker/build/base-images```
6- Build Docker stack images
7- Run Docker compose