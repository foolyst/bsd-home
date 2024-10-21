# Tautulli

[Source](https://github.com/Tautulli/Tautulli/).

A Python based monitoring and tracking tool for Plex Media Server. 

## Template usage

Run this command:
```
bastille template tautulli https://github.com/bsd-home/multimedia/tautulli
```

## Manual Installation
[Source](https://github.com/Tautulli/Tautulli/wiki/Installation#freebsd--truenas).

### Steps:
  - Install the needed packages:
  ```
  pkg install python py311-setuptools py311-sqlite3 py311-openssl py311-pycryptodomex security/ca_root_nss git-lite
  ```

  - Change the directory:
  ```
  cd /usr/local/share
  ```

  - Clone the directory:
  ```
  git clone https://github.com/Tautulli/Tautulli.git
  ```

  - Add the tautulli user:
  ```
  pw useradd -n tautulli -c "Tautulli" -s /sbin/nologin -w no
  ```

  - Change ownership:
  ```
  chown -R tautulli:tautulli Tautulli
  ```

  - Copy the service script:
  ```
  mkdir -p /usr/local/etc/rc.d && cp /usr/local/share/Tautulli/init-scripts/init.freenas /usr/local/etc/rc.d/tautulli
  ```

  - Enable the servic:
  ```
  sysrc -f /etc/rc.conf tautulli_user="tautulli" && sysrc -f /etc/rc.conf tautulli_enable="YES"
  ```

  - Start the service:
  ```
  service tautulli start
  ```

  - Access Tautulli:
  ```
  http://localhost:8181
  ```