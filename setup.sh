echo "updating ubos-admin"
ubos-admin update

echo "installing dev packages needed for makepkg to work"
pacman -S --noconfirm base-devel pacman-contrib decko

echo "cd'ing to decko dir"
cd /home/decko-ubos/decko

echo "updating pacman config"
cp pacman.conf /etc/pacman.conf

echo "setting up shepherd account (password is 'shepherd')"
ubos-admin setup-shepherd
# echo "shepherd:shepherd" | chpasswd
su shepherd
