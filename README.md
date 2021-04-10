# decko-ubos


# Docker dev environment

To get a dev instance running, run the following from the root of this repo.

    rake run_green

Update UBOS to the latest and greatest:

    % sudo ubos-admin update

Relax the rules usually requiring valid package signatures for all packages on UBOS. This
allows you to install your own packages without having to sign them. In the UBOS
container, in file /etc/pacman.conf, change this line:

    LocalFileSigLevel = Required TrustedOnly

to this:

    LocalFileSigLevel = Optional


# Update to latest Decko version

    pacman -Sy # sync maybe?
    pacman -S base-devel

    pacman -S decko # install existing decko (that gives us ruby, bundler etc)
    
    
    bundle update