#!/bin/bash

# To unpack `identity_backup.tgz`.
# $ tar -xvzf identity_backup.tgz

# To shred storage device used to transport `identity_backup.tgz`.
# $ sudo fdisk -l  # Find device, e.g., /dev/sdb.
# $ sudo shred -vz -n2 /dev/sdb  # Shred.

# Copy files to sync'd folder.
cp -R ~/.ssh ~/Sync/
cp -R ~/.gitconfig ~/Sync/
cp -R ~/.gnupg ~/Sync/ 2>/dev/null  # Suppress "Operation not supported on socket" errors.
cp -R ~/.bashrc_private ~/Sync/
cp -R ~/README_IF_FOUND.txt ~/Sync/

# Create gzip'd tar ball for transport to another system.
rm -rf identity_backup
mkdir identity_backup
cp -R ~/.ssh identity_backup/
cp -R ~/.gitconfig identity_backup/
cp -R ~/.gnupg identity_backup/
cp -R ~/.bashrc_private identity_backup/
cp -R ~/README_IF_FOUND.txt identity_backup/
tar -cvzf identity_backup.tgz identity_backup
rm -rf identity_backup