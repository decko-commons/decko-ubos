# decko-ubos

Packaging Decko tool for UBOS.

# Setup Docker dev environment

1. Make sure you have an up-to-date local docker image

``` 
docker pull ubos/ubos-green
docker build -t ubos-decko-green .
```

2. To get a dev instance running, make sure you have docker installed and then run the
   following from the root of this repo.

```
rake run_green
```

3. Sign in as root (Note: password is in the output)
4. Run setup shell script inside container.

```   
/home/decko-ubos/setup.sh
```

At the end you should be in /home/decko-ubos/decko, logged in as the shepherd user.

# Start / Stop container

Best practice is to stop and start the container (not remove it) unless you have to
rebuild or alter the docker run command.

``` 
docker start [dockerid]
docker exec -it [dockerid] bash
docker stop [dockerid]
```

# Update to latest Decko version

1. Start by updating gems (including decko)

```
cd /home/decko-ubos/decko
bundle update
```

2. Meanwhile, edit PKGBUILD.

- update decko version in PKGBUILD
- reset pkgrel to 1 if it has been changed

3. Run the following as shepherd:

```
updpkgsums   # update checksum in PKGBUILD
makepkg -f   # generate a new package
```

# Deploy a Deck

Run the following as root:

```
pacman -U decko-*-any.pkg.tar.zst          # install a package you've generated
ubos-admin deploy --file sample-site.json  # deploy the site
```

Once deployed, the site should be reachable at http://localhost:8080/deck
