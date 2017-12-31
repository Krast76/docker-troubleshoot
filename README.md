Useful docker container to troubleshoot K8S deployment.

Available packages :
* vim
* dig
* nc
* curl

Kubernetes run example :

``` bash
# kubectl run -it --rm --image krast/docker-troubleshoot myshell -- /bin/sh
```

It will create a deployment object named "myshell"
