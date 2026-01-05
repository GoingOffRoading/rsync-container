#!/bin/bash
set -euo pipefail

# Use environment variable or default command
RSYNC_CMD="${RSYNC_COMMAND:-rsync -avh --progress --delete}"

# Directory in /usb/ to check and sync to
USB_TARGET_DIR="${USB_TARGET_DIR:-/usb/backup}"

SRC=/host/

echo "Checking if target directory exists: ${USB_TARGET_DIR}"
if [ ! -d "${USB_TARGET_DIR}" ]; then
  echo "ERROR: Target directory ${USB_TARGET_DIR} does not exist!"
  echo "This likely means the USB drive is not mounted correctly."
  exit 1
fi

echo "Target directory found. Starting rsync from ${SRC} to ${USB_TARGET_DIR}"
echo "Timestamp: $(date)"
echo "Using command: ${RSYNC_CMD} ${SRC} ${USB_TARGET_DIR}"

${RSYNC_CMD} "${SRC}" "${USB_TARGET_DIR}"

echo "Rsync completed at $(date)"