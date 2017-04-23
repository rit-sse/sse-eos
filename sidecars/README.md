What is this sidecar thing
==========================

Basically we need a way to hot-load in new data without going through the effort of connecting to the database directly and modifying that information. This works on eggs because we only have a single master node (and currently ssedev is drained cause networking issues). So building this image when proxied onto ritsse/eggs then running it with access to the docker socket (`/var/run/docker.sock`) will copy in some scripts and run them in psql. The idea is that this can become some service that we can run one off and it will bootstrap some of the command issues we have at startup without modifying how the apps start.
