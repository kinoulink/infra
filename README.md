## Kinoulink infrastructure - As code -

Welcome to kinoulink infrastructure as code. We have 3 stages:
- local => Developer machine (via Docker for Mac or Windows)
- dev => AWS ECS Single machine
- prod => AWS ECS Cluster

Stacks:
- infra manager
- public
- backoffice

### Technos

- Docker > 1.8 & Docker compose > 1.6
- Bash

### Dev - init

- 1: docker-compose up to create containers
- 2: Initialize data base if needed (docker run ktv_app sf )

### External services

- https://rollbar.com
- https://loggly.com
- https://datadog.com
- https://console.aws.amazon.com

### Configuration

- K_CONFIG_AZURE_STORAGE_KEY "Primary or Secondary Key for the Storage Account."
- K_CONFIG_LOGGLY_TOKEN
- K_CONFIG_DATADOG_TOKEN
- Install Azure volume driver by running ./bin/provisionning/install_azure_volume_driver.sh script

### References

- https://aws.amazon.com/blogs/compute/building-a-dynamic-dns-for-route-53-using-cloudwatch-events-and-lambda/
