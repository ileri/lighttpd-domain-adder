#!/bin/bash

clear

set -e

# Check current user status
if [ "$(id -u)" != 0 ]; then
  echo "This script must be run as root. 'sudo bash $0'"
  exit 1
fi

# Check FQDN
echo "Enter FQDN(e.g. example.com or subdomain.example.com). www will be automatically aliased: "
read DOMAIN

FQDN_REGEX='^(([a-zA-Z](-?[a-zA-Z0-9])*)\.)*[a-zA-Z](-?[a-zA-Z0-9])+\.[a-zA-Z]{2,}$'
if ! printf %s "$DOMAIN" | grep -Eq "$FQDN_REGEX"; then
  echo err "Invalid parameter. You must enter a FQDN domain name... (e.g. example.com or subdomain.example.com)"
  exit 1
fi

echo "Creating directory...";
mkdir /var/www/$DOMAIN;
echo "Configuring...";

if [ -e "/etc/lighttpd" ]
then
  CONF_FILE="/etc/lighttpd/conf.d/$DOMAIN.conf"
else
  echo "Couldn't find Lighttpd configurate directory. Exiting..."
  exit
fi


if [ -e $CONF_FILE ] # Controlling is conf file exits?
then
  echo "There is already a $CONF_FILE exists."
  echo -n "Do you want to overwrite it? (y/N): "
  read ANSWER
  if [[ ( "$ANSWER" != "y" ) && ( "$ANSWER" != "Y" ) && ( "$ANSWER" != "yes" )
   && ( "$ANSWER" != "Yes" ) && ( "$ANSWER" != "YES" )]]
  then
    echo "Aborting..."
    exit
  fi
fi

cat > $CONF_FILE <<EOL
$HTTP["host"] == "$DOMAIN" {
server.document-root = "/var/www/$DOMAIN"
}
EOL

cat > "/etc/lighttpd/lighttpd.conf" <<EOL
include "$CONF_FILE"
EOL

#echo "Lighttpd Service is reloading..."
# FIXME : ADD SERVER RELOAD

echo "$DOMAIN added to your server."
