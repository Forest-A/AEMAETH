
### 虚拟机突然连不上网怎么办!
别担心：

on Ubuntu 17.10 or later

Look for YAML files in `/etc/netplan/`. For example:
```
ls /etc/netplan/
```

Open the `.yaml` file in `/etc/netplan/`

```
sudo emacs /etc/netplan/01-netcfg.yaml
```

Add or modify the configuration to include:
```
network:
  version: 2
  renderer: networkd
  ethernets:
    ens33:
      dhcp4: true

```

Run the following command to apply the configuration:

```
sudo netplan apply
```


- If encounter warnings about permissions, such as:
    

    `WARNING: Permissions for /etc/netplan/01-netcfg.yaml are too open. Netplan configuration should NOT be accessible by others.`
    
 Ensure that the permissions for the Netplan configuration file are correct. Set them using:

```
sudo chmod 600 /etc/netplan/01-netcfg.yaml
```
