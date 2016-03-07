## Bizlunch infrastructure - As code -

Welcome to Bizlunch infrastructure as code. We have 3 stages:
- local => Developer machine (via Vagrant)
- dev => AWS machine
- prod => AWS machine

Bizlunch project is split into stacks:
- public => webapp, API, messenger etc.. everything "public"

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

- 1: Create a "bizlunch" folder
- 2: Clone all git projects
- 3: "cd" to the desired stack
- 4: Run "vagrant up"

<!> Copy or symlink your ssh private key to BIZLUNCH_ROOT (on your machine) <!>

Inside vagrant machine, "cd" to the desired stack, and play with docker-compose.

To connect to dev machine => "ssh dev.bizlunch.private" (inside Vagrant machine)