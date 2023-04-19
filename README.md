# decko-ubos

Packaging Decko tool for UBOS.

# Setup Docker dev environment

1. Make sure you have docker (and docker compose) installed and then run the following from the root of this repo.

```
docker compose up -d
```

May have to wait for services to start...

2. Open shell.

```   
docker exec -i -t -u ubosdev ubos-develop bash
```

3. Get the latest ubos-admin and install dependencies from INSIDE the container
```
sudo ubos-admin update
sudo pacman -S --noconfirm base-devel pacman-contrib webapptest
```



# Update to latest Decko version

1. Start by updating gems (including decko) from OUTSIDE the container

```
# from decko-ubos root
cd decko
bundle update
```

2. Meanwhile, edit PKGBUILD.

- update decko version in PKGBUILD
- reset pkgrel to 1 if it has been changed

3. Run the following INSIDE the container:

```
updpkgsums   # update checksum in PKGBUILD
makepkg -f   # generate a new package
```

# Deploy a Deck

Run the following INSIDE the container:

```
sudo pacman -U decko-*-any.pkg.tar.zst          # install a package you've generated
sudo ubos-admin deploy --file sample-site.json  # deploy the site
```

Once deployed, the site should be reachable at http://localhost:8080/deck

# Run Test

```
webapptest run tests/DeckoTest.pm

```