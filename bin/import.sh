#!/bin/bash

set -o errexit
set -o pipefail
set -o nounset

function cleanup () {
  kill $ssh_pid
}

# Open SSH tunnel
ssh -N -L 3306:localhost:3306 "$HOSTNAME" &
ssh_pid=$!
sleep 2

trap cleanup EXIT

# Import content from MySQL, assuming local tunnel over SSH
ruby -r rubygems <<EOF
require "jekyll-import";
JekyllImport::Importers::Drupal7.run({
  "dbname"   => "$DB_NAME",
  "user"     => "$DB_USER",
  "password" => "$DB_PASS",
  "host"     => "127.0.0.1",
})
EOF

# Some inline fixes...
# Add baseurl to static assets
sed -i -e 's!"/sites/default/files/!"{{ site.baseurl }}/sites/default/files/!g' **/*.md

# Copy static assets
mkdir -p sites/default/files
rsync -av --exclude .htaccess "$HOSTNAME":/var/www/olpcsf/sites/default/files/ sites/default/files/
