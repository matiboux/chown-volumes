# Chown Volumes

Docker image middleware to chown Docker volumes.


## Usage

Run the `chown-volumes` image in an init container to chown your Docker volumes before mounting them in non-root containers.

Docker Compose example:

```yaml
services:
  chown-volumes:
    image: matiboux/chown-volumes
    environment:
      UID: '1000'
      GID: '1000'
      VOLUMES: |
        /volume1
        /volume2
    volumes:
      - /path/to/volume1:/volume1
      - /path/to/volume2:/volume2
  my-service:
    image: my-service
    depends_on:
      chown-volumes:
        condition: service_completed_successfully
    volumes_from:
      - chown-volumes
```

Tweak this example to fit your needs.

In `my-service`, the `volumes_from` directive mounts volumes from the `chown-volumes` service. This way, the same volumes are mounted in both containers, and the `my-service` container can access the volumes with the correct permissions. However, you can also mount the volumes directly in the `my-service` container if you prefer:

```yaml
services:
  my-service:
    volumes:
      - /path/to/volume1:/other/path/to/volume1
      - /path/to/volume2:/other/path/to/volume2
```

The `chown-volumes` image is available on:
- The [Docker Hub](https://hub.docker.com/r/matiboux/chown-volumes): `docker pull matiboux/chown-volumes`, or
- The [GitHub Container Registry](https://github.com/matiboux/chown-volumes/pkgs/container/chown-volumes): `docker pull ghcr.io/matiboux/chown-volumes`


## License

Copyright (c) 2024 [Matiboux](https://github.com/matiboux) ([matiboux.me](https://matiboux.me))

Licensed under the [MIT License](https://opensource.org/license/MIT). You can see a copy in the [LICENSE](LICENSE) file.
