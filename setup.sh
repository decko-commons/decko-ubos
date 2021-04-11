echo "updating ubos-admin"
ubos-admin update

echo "installing dev packages needed for makepkg to work"
pacman -S --noconfirm base-devel pacman-contrib decko

echo "updating pacman config"
cp /home/decko-ubos/decko/pacman.conf /etc/pacman.conf

echo "setting up shepherd account"
ubos-admin setup-shepherd
su shepherd

echo "cd'ing to decko dir"
cd /home/decko-ubos/decko
