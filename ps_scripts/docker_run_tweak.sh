#!/bin/bash
set -e

# Avoid any previous PrestaShop installation lock
cd /var/www/html
rm -rf *
# the above remove install.lock and all previously installed files in the volume

# Get the PrestaShop sources and unzip
PS_VERSION=8.0.0-beta.1
echo "Download PrestaShop ${PS_VERSION}"
wget -c -q -O prestashop_${PS_VERSION}.zip "https://github.com/PrestaShop/PrestaShop/releases/download/${PS_VERSION}/prestashop_${PS_VERSION}.zip"
unzip -q -o prestashop_${PS_VERSION}.zip -d prestashop_${PS_VERSION}
unzip -q -o prestashop_${PS_VERSION}/prestashop.zip -d .
rm -rf *.zip prestashop_${PS_VERSION}/
mkdir -p var/cache/prod
chown -R www-data /var/www/html
echo "files are ready"

# Ngrok configuration
apt-get update
apt-get install -yq jq
PS_DOMAIN=$( \
  curl -s 'http://ngrok:4040/api/tunnels' \
  | jq -r .tunnels[0].public_url \
  | sed 's/https\?:\/\///' \
)
echo "🎊🎊🎊🎊 $PS_DOMAIN 🎊🎊🎊🎊 ngrok detected !"

# Hard coding the variable within docker_run.sh
sed -i "2 i PS_DOMAIN=$PS_DOMAIN" /tmp/docker_run.sh
echo "============ TWEAK PERFOMED ============"

# Run the former startup script
/tmp/docker_run.sh
