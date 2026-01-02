#!/bin/bash
set -euo pipefail

SRC=/host/
DST=/usb/

# Mount the USB device
echo "Mounting USB device /dev/sdb to ${DST}"
mkdir -p "${DST}"
mount /dev/sdb "${DST}"

echo "Starting rsync from ${SRC} to ${DST}"
echo "Timestamp: $(date)"

rsync -avh --progress --delete \
  "${SRC}" "${DST}"

echo "Rsync completed at $(date)"

# Optionally unmount
umount "${DST}"