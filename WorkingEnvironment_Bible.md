- [Virtual Machine Lost Internet Connection Suddenly](#virtual-machine-lost-internet-connection-suddenly)
- [Remove Backup Files Ending with "~"](#remove-backup-files-ending-with--)


## Virtual Machine Lost Internet Connection Suddenly
on Ubuntu 17.10 or later

**1. Locate the Netplan Configuration File**:
Look for YAML files in `/etc/netplan/`. 
```
ls /etc/netplan/
```
**2. Add the configuration to include:**

```
sudo emacs /etc/netplan/01-netcfg.yaml
```
```
network:
  version: 2
  renderer: networkd
  ethernets:
    ens33:
      dhcp4: true

```

**3. apply the configuration:**

```
sudo netplan apply
```


- If encounter warnings about permissions, such as:
    

    `WARNING: Permissions for /etc/netplan/01-netcfg.yaml are too open. Netplan configuration should NOT be accessible by others.`
    
 Ensure that the permissions for the Netplan configuration file are correct. Set them using:

```
sudo chmod 600 /etc/netplan/01-netcfg.yaml
```

## Remove Backup Files Ending with ~
Backup files that end with ~ can clutter your directories.

**1. Delete Existing ~ Files:**
```
find <directory> -type f -name '*~' -delete
```

**2. Prevent Future Backup Files (~) from Being Added:**
Add a .gitignore file to ignore all files ending with ~:

Open or create a .gitignore file in the root of your repository.

Add this line to the file:
```
*~
```

**3. Save and Commit the .gitignore File:**

```
git add .gitignore
git commit -m "Ignore backup files ending with ~"
git push
```



