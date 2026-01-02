#!/bin/bash
set -euo pipefail

SRC=/host/
DST=/usb/

# Mount the USB device
echo "Mounting USB device /dev/sdc1 to ${DST}"
mkdir -p "${DST}"

# Debug: Check if device exists and is a block device
if [ ! -b /dev/sdc1 ]; then
  echo "Error: /dev/sdc1 is not a block device or does not exist"
  ls -l /dev/sdc1 || echo "/dev/sdc1 not found"
  exit 1
fi

echo "Device /dev/sdc1 found, attempting mount..."
mount -t auto /dev/sdc1 "${DST}"

echo "Starting rsync from ${SRC} to ${DST}"
echo "Timestamp: $(date)"

rsync -avh --progress --delete \
  "${SRC}" "${DST}"

echo "Rsync completed at $(date)"

# Optionally unmount
umount "${DST}"