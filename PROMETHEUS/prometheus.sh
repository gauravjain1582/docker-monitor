docker service create \
--replicas 1 \
--name prometheus \
--mount type=bind,source=/gfs_mount/dswarm_service_gfs_volume/prometheus/prometheus.yml,destination=/etc/prometheus/prometheus.yml \
--mount type=bind,source=/gfs_mount/dswarm_service_gfs_volume/prometheus,destination=/prometheus \
--publish published=9090,target=9090,protocol=tcp \
-l traefik.enable=true \
-l traefik.frontend.passHostHeader=true \
-l traefik.frontend.rule="Host:prometheus.vlekh.net,http://prometheus.vlekh.net" \
-l traefik.backend=prometheus \
-l traefik.docker.network=traefik \
-l traefik.entryPoint=https \
-l traefik.port=9090 \
--network traefik \
prom/prometheus \
--storage.tsdb.retention=1h 
