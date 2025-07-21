cat numount.sh
#!/bin/bash
#
# Script for unmounting NFS Share by Users
#
# run: numount /mount/point
#
mountpoint="$1"

# check arguments mentioned or not

if [[ -z "$mountpoint" ]];
then
        echo "Usage: $0 /mount/point"
        exit 1
fi

# Block if mountpoint is not under /opt

if [[ "$mountpoint" != /opt/* ]];
then
        echo "Error: mount point only in /opt can be unmounted"
        exit 2
fi

# check mount which must not be in /etc/fstab optional now

if grep -qsE "^[^#]*[[:space:]]+$mountpoint[[:space:]]+" /etc/fstab; then
  echo "Error: Mount point $mountpoint is defined in /etc/fstab"
  exit 3
fi

# unmount command

/usr/bin/umount "$mountpoint"
