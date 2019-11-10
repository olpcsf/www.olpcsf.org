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


# Some files are copied to the wrong location
# https://github.com/jekyll/jekyll-import/issues/421
cp --force --recursive --target-directory src blog node pathagar.md
rm -rf blog node pathagar.md

# Copy static assets
mkdir -p src/sites/default/files
rsync -av --exclude .htaccess "$HOSTNAME":/var/www/olpcsf/sites/default/files/ src/sites/default/files/
