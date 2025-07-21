#!/bin/bash
#
# Script for mounting Samba Share by Users
#
# smount //server/share /mount/point
#
share="$1"
mountpoint="$2"

# check arguments mentioned or not

if [[ -z "$share" || -z "$mountpoint" ]];
then
        echo "Usage: $0 //server/share /mount/point"
        exit 1
fi

# Block if mountpoint is not under /opt

if [[ "$mountpoint" != /opt/* ]];
then
        echo "Error: mount point is in /opt"
        exit 2
fi

# check mount which must not be in /etc/fstab optional now

if grep -qsE "^[^#]*[[:space:]]+$mountpoint[[:space:]]+" /etc/fstab; then
  echo "Error: Mount point $mountpoint is defined in /etc/fstab"
  exit 3
fi

# Mount command to mount samba shares

/usr/sbin/mount.cifs "$share" "$mountpoint" -o user=username,uid=510,gid=510
