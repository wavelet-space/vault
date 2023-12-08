# Server: Debian administration

- Server information
- User management: create/delete user, create/remove groups, permissions, SSH access
- Package management
- System security

## Server infromation

### Server reboot

    reboot

 By default, the system will be rebooted after 1 minute, but you can specify the exact time when you want the system to be rebooted.14


### Server distribution ipgrade (e.g Stretch to Buster)

https://phoenixnap.com/kb/how-to-upgrade-debian-9-stretch-to-debian-10-buster

1. &hellip
2. &hellip
3. &hellip


### Check the server logins

    last

### Get the operating system version

    cat /etc/debian_version
    > 9.13

    lsb_release -d
    Description:    Debian GNU/Linux 9.13 (stretch)

### Check the server IP address

    hostname -I | awk '{print $1}'
    > 192.168.10.56

## User management

### Switch the user

    su <option> <user>
    su username
    sudo -u <user> -s

### Create group

### Add user to group

    sudo groupadd docker
    sudo usermod -a -G docker phanak

### Create user

    (sudo) adduser <user_name>

### Delete user

    (sudo) deluser --remove-home username

## Package management

Pokud píše že sudo is not found

    su -
    apt update
    apt install sudo -y
    exit

### Instaluj docker

    https://docs.docker.com/engine/install/debian/

## Jak vypsat všechn proměnné prostředí

Linux list all environment variables command
I recommend that you use the printenv command. The syntax is:

	printenv
	printenv | less
	printenv | more


https://www.cyberciti.biz/faq/linux-list-all-environment-variables-env-command/



### Odkazy

+ https://devconnected.com/
+ https://www.cyberciti.biz/faq/linux-set-change-password-how-to/