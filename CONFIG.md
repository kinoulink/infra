# Developer machine configuration

## VPN

## SSH

```
Host *.affichage.cloud
        User ec2-user
        Port 22
        StrictHostKeyChecking no
        UserKnownHostsFile=/dev/null
        IdentityFile ~/.ssh/aws_ktv_key.pem

Host *.ktv.internal
        User ec2-user
        Port 22
        StrictHostKeyChecking no
        UserKnownHostsFile=/dev/null
        IdentityFile ~/.ssh/aws_ktv_key.pem
```