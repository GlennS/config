sudo mkdir -p /usb
sudo mount /dev/sdb /usb

for thing in .zshrc .zsh .i3 .profile .Xresources; do
    cp -R /usb/$thing /home/glenn
    chown -R glenn:ysers /home/glenn/$thing
done

sudo cp -R /usb/.zshrc /home/glenn/.zshrc
sudo chown glenn:users .zshrc

git clone git@github.com:GlennS/octopus.git
git clone git@github.com:GlennS/pass.git .password-store
git clone --bare git@github.com:GlennS/config config.git

git clone git@bitbucket.org:glenns/notes.git
git clone git@bitbucket.org:glenns/recklessclicking.git
git clone git@bitbucket.org:glenns/cammy.git

nix-env -iA nixos.git-lfs

mkdir cammy/repos
git clone git@github.com:CammyLabs/madrox.git
git clone git@github.com:HomeScript/winhub-manager.git

git clone git@github.com:spwhitt/nix-zsh-completions.git

git clone git@bitbucket.org:glenns/.ssh.git .ssh2
mv .ssh2 .ssh
chmod -R 600 .ssh

sudo umount /usb
sudo rmdir /usb
