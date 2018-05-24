docker service create \
        --name cadvisor \
        --publish=8088:8080 \
        --mode global \
        --mount type=bind,source=/,target=/rootfs,readonly \
        --mount type=bind,source=/var/run,target=/var/run \
        --mount type=bind,source=/sys,target=/sys,readonly \
        --mount type=bind,source=/var/lib/docker/,target=//var/lib/docker/,readonly \
        --mount type=bind,source=/dev/disk/,target=/dev/disk/,readonly \
        --network traefik \
        google/cadvisor:latest \
        --prometheus_endpoint="/metrics"


#        -l traefik.enable=true \
#        -l traefik.frontend.passHostHeader=true \
#        -l traefik.frontend.rule="Host:cadvisor.lekh.net, http://cadvisor.lekh.net" \
#        -l traefik.backend=cadvisor \
#        -l traefik.docker.network=traefik \
#        -l traefik.entryPoint=https \
#        -l traefik.port=8080 \
