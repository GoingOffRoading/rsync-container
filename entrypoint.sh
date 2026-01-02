#!/bin/bash
set -euo pipefail

SRC=/host/
DST=/usb/

echo "Starting rsync from ${SRC} to ${DST}"
echo "Timestamp: $(date)"

rsync -avh --progress --delete \
  "${SRC}" "${DST}"

echo "Rsync completed at $(date)"