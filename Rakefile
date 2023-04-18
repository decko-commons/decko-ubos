
def run_ubos_container color, tag=:latest
  puts "UBOS login: root / ubos!4vr"
  # --cap-add NET_ADMIN --cap-add NET_BROADCAST
  system %(
    docker run -it \\
      --cap-add SYS_ADMIN \\
      -p 8080:80 \\
      -v /sys/fs/cgroup:/sys/fs/cgroup:ro \\
      -v $(pwd):/home/decko-ubos \\
      "fb1a8534cf9e"
      # ubos-decko-#{color}:#{tag}
  )
end

task :run_red do
  run_ubos_container :red
end

task :run_yellow do
  run_ubos_container :yellow
end

task :run_green do
  run_ubos_container :green
end
