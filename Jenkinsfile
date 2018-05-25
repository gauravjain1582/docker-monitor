node("docker-test") {
  checkout scm

  stage("Deploy Monitor Stack") {
    sh "hostname"
    sh "mkdir -p /gfs_mount/dswarm_service_gfs_volume/prometheus"
    sh "mkdir -p /gfs_mount/dswarm_service_gfs_volume/grafana"
    sh 'cp -u prometheus.yml /gfs_mount/dswarm_service_gfs_volume/prometheus/prometheus.yml'
    sh 'docker stack deploy --compose-file docker_compose.yml monitor'
  }
}
