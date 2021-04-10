
def run_ubos_container color, tag=:latest
  puts "UBOS login: root / ubos!4vr"

  system %(
    docker run -itp 8080:80 \
      --cap-add NET_ADMIN --cap-add NET_BROADCAST --cap-add SYS_ADMIN \
      -v /sys/fs/cgroup:/sys/fs/cgroup:ro \
      -v $(pwd):/root/dev \
      -e container=docker \
      ubos/ubos-#{color}:#{tag} \
      /usr/lib/systemd/systemd
  )
end

task :run_green do
  run_ubos_container :green
end