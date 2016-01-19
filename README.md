## Bizlunch infrastructure - As code -

### Requirements

- Docker > 1.8
- Docker compose
- Docker machine
- Ansible

### Dev - init

1- Create the Docker machine ```make docker/dev-machine/create```
2- Start the Docker machine ```make docker/dev-machine/start```
3- Set your dev machine hosts ```make init/hosts```
4- Set Docker machine symlinks ```make init/symlinks```
5- Build Docker base images ```make docker/build/base-images```
6- Build Docker stack images
7- Run Docker compose