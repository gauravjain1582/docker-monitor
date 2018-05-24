docker service create \
--replicas 1 \
--name grafana \
--mount type=bind,source=/gfs_mount/dswarm_service_gfs_volume/grafana,target=/var/lib/grafana \
-l traefik.enable=true \
-l traefik.frontend.passHostHeader=true \
-l traefik.frontend.rule="Host:grafana.vlekh.net, http://grafana.vlekh.net" \
-l traefik.backend=grafana \
-l traefik.docker.network=traefik \
-l traefik.entryPoint=https \
-l traefik.port=3000 \
--network traefik \
--publish published=3000,target=3000,protocol=tcp \
grafana/grafana
