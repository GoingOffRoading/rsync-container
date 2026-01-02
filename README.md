# Rsync-Container
This was a quick and dirty solution to a small homelab project:

In the event I am incapacitated, have a lamens friendly way for my survivors to have access to our family photos, important documents, etc without having to navigate the labrynth of auth and etc that are setup in my home cluster today.

## Solution

- Plugin your USB storage device into your machine.

- Assuming it's Ubuntu, get it's device path: `lsblk -f`

- Create a mounting target: `sudo mkdir /mnt/usb`

- Assuming the device is already formatted, mount that device path (but not via fstab): `sudo mount /dev/sdc1 /mnt/usb`

- Tweak the `rsync.yml` for your crone, name, directories, etc

- Deploy the cronjob `kubectl apply -f ./rsync.yml`

## Now What

On the cron schedule, this cronjob will attempt to mount `/mnt/usb` and the file source into a pod.

If the USB device is still connected, this should work just fine.

Once mounted, rsync will sync the source into the directory.

## What else?

That's about it.  In the event that I am incapacitated, my survivors can yank the USB, plug it into ANY laptop, and they have everything.

If the USB is disconnected for any reason, the pod fails.

## Questions?

Open an issue

## To-Do

- [ ] The container runs and writes data if the USB drive is unmounted.  Change the logic to check for the directory before writing.