#!/bin/sh

path_to_script () {
  TARGET="$1"
  BASENAME="$(basename "$TARGET")"

  (
    cd -P "$(dirname "$TARGET")"
    if [ -h "$BASENAME" ]
    then
        path_to_script "$(readlink "$BASENAME")"
    else
        echo "$PWD"
    fi
  )

}

goto_script_path() {
  PATH_TO_SCRIPT="$(path_to_script "$0")"
  # XX-Net fails to start if the install path contains spaces, so it must be quoted.
  cd "$PATH_TO_SCRIPT"
}

goto_script_path


if python -V 2>&1| grep -q "Python 3" ;then
    PYTHON="python2"
else
    PYTHON="python"
fi


if [ -f code/version.txt ]; then
    VERSION=`cat code/version.txt`
else
    VERSION="default"
fi


if [ ! -f "code/$VERSION/launcher/start.py" ]; then
    VERSION="default"
fi
REAL_VERSION=`cat code/$VERSION/version.txt`
echo "XX-Net version:$REAL_VERSION"


# launch xx-net service by ignore hungup signal
launchWithNoHungup() {
    nohup ${PYTHON} code/${VERSION}/launcher/start.py $@>/dev/null 2>&1 &
}

# launch xx-net service by hungup signal
launchWithHungup() {
    ${PYTHON} code/${VERSION}/launcher/start.py $@
}


# check command avalibility
has_command() {
    "$1" -v $1 > /dev/null 2>&1
}

openwrt_setup_env()
{
 echo "It is OpenWrt."
 #TODO: Setup
 # check mount usb disk
 # install python, python-openssl, ipset to usb device
 # setup dns
 # set auto start
 echo "It is openwrt."
}

# Install Packages
# get operating system name
os_name=`uname -s`
if [ $os_name = 'Linux' ]; then
    if has_command opkg; then
        openwrt_setup_env
    elif ! ${PYTHON} -c 'import OpenSSL' 2> /dev/null; then
        echo 'Installing pyOpenSSL for your system... Please type in your password if requested'
        if has_command zypper; then
            # openSUSE
            sudo zypper in -y python-pyOpenSSL
        elif has_command apt-get; then
            # Debian or Debian-like
            sudo apt-get install -y python-openssl python-pycparser
        elif has_command dnf; then
            # Fedora
            sudo dnf install -y pyOpenSSL
        elif has_command yum; then
            # RedHat
            sudo yum install -y pyOpenSSL
        elif has_command pacman; then
            # ArchLinux
            sudo pacman -S --noconfirm openssl python2-pyopenssl
        elif has_command opkg; then
            # OpenWrt
            echo "install python"
            opkg --dest usb install python
        fi
    fi
fi


help()
{
echo "
USAGE:

start -h
  show help.

start
 -allow_remote
   enable remote connect.
 -hungup
   start with nohup to run in background.

start set_iptables [interface]
  set iptables for transparent proxy.
  interface   The network interface which will be redirected
              Default is br-lan

start unset_iptables [interface]


"
exit 0
}


set_iptables(){
    if [ "$1" = '' ]; then
      INF="br-lan"
    else
      INF=$1
    fi
    echo "set interface $INF"

    # TODO: check if rule exist

    iptables -t nat -N REDSOCKS
    iptables -t nat -A REDSOCKS -d 0.0.0.0/8 -j RETURN
    iptables -t nat -A REDSOCKS -d 10.0.0.0/8 -j RETURN
    iptables -t nat -A REDSOCKS -d 127.0.0.0/8 -j RETURN
    iptables -t nat -A REDSOCKS -d 169.254.0.0/16 -j RETURN
    iptables -t nat -A REDSOCKS -d 172.16.0.0/12 -j RETURN
    iptables -t nat -A REDSOCKS -d 192.168.0.0/16 -j RETURN
    iptables -t nat -A REDSOCKS -d 224.0.0.0/4 -j RETURN
    iptables -t nat -A REDSOCKS -d 240.0.0.0/4 -j RETURN
    iptables -t nat -A REDSOCKS -p tcp -j REDIRECT --to-ports 8086
    iptables -t nat -A PREROUTING --in-interface $INF -p tcp -j REDSOCKS
    exit 0
}

unset_iptables(){
    if [ "$1" = '' ]; then
      INF="br-lan"
    else
      INF=$1
    fi

    iptables -t nat -D PREROUTING --in-interface $INF -p tcp -j REDSOCKS
    iptables -t nat -X REDSOCKS
}


ARGS=$@
HANGUP='0'
while [ -n "$1" ]; do
case $1 in

-h) help;shift 1;;

-allow_remote)shift 1;;

-hungup)HANGUP='1';shift 1;;

set_iptables) set_iptables $2;;

unset_iptables) unset_iptables $2;;

*) echo "unknown option $1."; shift 1;;
esac
done


# Start Application
if [ $os_name = 'Darwin' ] && ! [ $HANGUP = '1' ]; then
    echo "Run XX-Net in background."
    PYTHON="/usr/bin/python2.7"
    launchWithNoHungup $ARGS
else
    launchWithHungup $ARGS
fi