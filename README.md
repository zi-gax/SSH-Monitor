<h3 align="center"> Monitor SSH Log Send Via Discord WebHook  </h4>
<p align="center">
  <a href="#installation">Installation</a> •
  <a href="#preview">Preview</a> 

</p>

---

This Code Send Notification on Discord TextChannel When SSH Login and logout its happen .

## Installation
Clone Repository in `/sbin` Directory :
```
cd /sbin
git clone github.com/zi-gax/SSH-Monitor
```
Add Webhook URL : (line 3)
```
WEBHOOK_URL=" "
```

Edit Permission File :
```
sudo chmod +x /sbin/SSH-Monitor/SSH-MONITOR.sh
sudo chown root:root /sbin/SSH-Monitor/SSH-MONITOR.sh
```

Add This Line To `/etc/pam.d/sshd` :
```
session   optional   pam_exec.so /sbin/SSH-Monitor/SSH-MONITOR.sh
```
Restart The `sshd` :
```
sudo systemctl restart sshd
```

## Preview

![SSH-MONITOR](https://github.com/zi-gax/SSH-Monitor/assets/67065043/eb2a6905-472a-42f2-8820-614bf81a58af)
