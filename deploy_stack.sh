#mkdir /gfs_mount/dswarm_service_gfs_volume/prometheus
#mkdir /gfs_mount/dswarm_service_gfs_volume/grafana
#cp  prometheus.yml /gfs_mount/dswarm_service_gfs_volume/prometheus/prometheus.yml
docker stack deploy --compose-file docker_compose.yml monitor
