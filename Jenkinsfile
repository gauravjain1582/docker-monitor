node("docker-test") {
  checkout scm

  stage("Deploy Monitor Stack") {
    sh "mkdir -p /gfs_mount/dswarm_service_gfs_volume/prometheus"
    sh "mkdir -p /gfs_mount/dswarm_service_gfs_volume/grafana"
    sh "cp -n prometheus.yml /gfs_mount/dswarm_service_gfs_volume/prometheus/prometheus.yml"
    sh "docker stack ps --filter "name=monitor" monitor > /dev/null ; if [ $? -ne 0 ] then ; docker stack deploy --compose-file docker_compose.yml monitor ; fi"
  }
}
