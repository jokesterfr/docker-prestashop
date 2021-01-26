#!/bin/bash
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
echo "============ TWEAK DONE "============

# Run the former startup script
/tmp/docker_run.sh
