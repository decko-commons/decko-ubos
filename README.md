# decko-ubos
Packaging Decko tool for UBOS.

# Build local docker image

``` 
# might need docker pull command?

docker build -t ubos-green .
```

# Setup Docker dev environment

1. To get a dev instance running, make sure you have docker installed and then run the following from the root of this repo.

```
rake run_green
```
    

2. Sign in as root (Note: password is in the output)
3. Run setup shell script inside container.

```   
/home/decko-ubos/setup.sh
```

At the end you should be in /home/decko-ubos/decko, logged in as the shepherd user.

# Start / Stop container

Best practice is not to stop and start the container (not remove it) unless you have to rebuild or alter the docker run command.

``` 
docker exec -it [dockerid] bash
```

# Update to latest Decko version

1. Start by updating gems (including decko)

```
bundle update
```

2. Meanwhile, edit PKGBUILD.

- update decko version in PKGBUILD
- reset pkgrel to 1 if it has been changed
    
3. Run the following:

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


