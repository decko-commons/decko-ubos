# decko-ubos
Packaging Decko tool for UBOS.

# Update local docker image

    # might need docker pull command?
    
    docker build -t ubos-green .

# Docker dev environment

1. To get a dev instance running, make sure you have docker installed and then run the 
following from the root of this repo.


    rake run_green

2. Sign in as root (Note: password is in the output)
3. Run setup shell script inside container.

   
    /home/decko-ubos/setup.sh

You will be prompted to add a password for the shepherd account (needed for sudo). At
the end you should be in /home/decko-ubos/decko


# Update to latest Decko version

1. Start by updating gems (including decko)


    bundle update

2. Meanwhile, edit PKGBUILD.

    - update decko version in PKGBUILD
    - reset pkgrel to 1 if it has been changed
    
3. Run the following


    updpkgsums   # update checksum in PKGBUILD
    makepkg -f   # generate a new package
    
    