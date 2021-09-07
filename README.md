# grpc-healthcheck-server

[![](https://img.shields.io/docker/pulls/winebarrel/grpc-healthcheck-server.png)](https://hub.docker.com/repository/docker/winebarrel/grpc-healthcheck-server)

## Usage

```
docker-compose build
docker-compose up
```

```
grpcurl -plaintext localhost:50051 grpc.health.v1.Health/Check
```

```
grpc_health_probe -addr=:50051
```

## Related Links

* https://github.com/grpc-ecosystem/grpc-health-probe
* https://github.com/fullstorydev/grpcurl
