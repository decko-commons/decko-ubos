FROM ubos/ubos-green

ENV container=docker

ENTRYPOINT ["/usr/lib/systemd/systemd"]

EXPOSE 80
