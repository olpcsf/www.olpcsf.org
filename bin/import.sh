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
  "types"    => ["blog", "story", "article", "post", "project"],
})
EOF

# Some inline fixes...
# Add baseurl to static assets
sed -i -E \
  -e 's!"/sites/default/files/!"{{ site.baseurl }}/sites/default/files/!g' \
  -e 's!https?://(www\.)?olpcsf.org/?!{{ site.baseurl }}/!g' \
  **/*.md

# Apply some manual fixes via patches
cat _patches/*.patch | patch -p1

# Copy static assets
mkdir -p sites/default/files sites/all/themes/responsive_bartik
rsync -av --exclude .htaccess "$HOSTNAME":/var/www/olpcsf/sites/default/files/ sites/default/files/
rsync -av "$HOSTNAME":/var/www/olpcsf/sites/all/themes/responsive_bartik/ sites/all/themes/responsive_bartik/
