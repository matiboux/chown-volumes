#syntax=docker/dockerfile:1

# This Dockerfile uses the service folder as context.


# --
# Upstream images

FROM alpine:3.21 AS alpine_upstream


# --
# Prod image

FROM alpine_upstream AS app_prod

# Run chown command
COPY --link --chmod=755 ./chown-command.sh /usr/local/bin/chown-command
CMD [ "chown-command" ]
