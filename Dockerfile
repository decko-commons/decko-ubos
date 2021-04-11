FROM ubos/ubos-green:latest

ENV container=docker

ENTRYPOINT ["/usr/lib/systemd/systemd"]

EXPOSE 80
