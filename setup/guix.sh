#!/bin/bash

# Fail if attempting to use a variable which hasn't been set.
set -u;
# Stop on first error.
set -e;

# See http://www.gnu.org/software/guix/manual/guix.html

GUIX_VERSION="0.8.3";
GUIX_SYSTEM="x86_64-linux"
GUIX_FILE="guix-binary-${GUIX_VERSION}.${GUIX_SYSTEM}.tar.xz";

mkdir -p guix-tmp;
pushd guix-tmp > /dev/null;

wget "ftp://alpha.gnu.org/gnu/guix/${GUIX_FILE}";
tar xf "${GUIX_FILE}";
sudo mv var/guix /var/ && mv gnu /;

popd > /dev/null;
rmdir guix-tmp;

sudo ln -sf /var/guix/profiles/per-user/root/guix-profile ~root/.guix-profile;

# Create 10 build users in the guixbuild group.
groupadd --system guixbuild;
for i in `seq -w 1 10`;
do
    useradd -g guixbuild -G guixbuild           \
            -d /var/empty -s `which nologin`    \
            -c "Guix build user $i" --system    \
            guixbuilder$i;
done;

# Setup the service.
sudo ln -f "~root/.guix-profile/lib/systemd/system/guix-daemon.service" "/etc/systemd/system/guix-daemon.service";
sudo systemctl enable "guix-daemon.service";

# Make the guix command available.
sudo mkdir -p /usr/local/bin;
sudo ln -s -T /var/guix/profiles/per-user/root/guix-profile/bin/guix /usr/local/bin/guix;

# Authorize Hydra substitutes.
sudo guix archive --authorize < ~root/.guix-profile/share/guix/hydra.gnu.org.pub;
