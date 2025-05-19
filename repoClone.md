#

## clone to local folder

```
sudo debmirror --arch=arm64   --nosource   --host=ports.ubuntu.com   --method=http   --root=ubuntu-ports   --dist=bionic,bionic-updates,bionic-security,bionic-backports   --section=main,universe,multiverse,restricted --ignore-release-gpg  --progress /mnt/nanoRepoBionic 
```


