#!/bin/bash

ruby -r rubygems <<EOF
require "jekyll-import";
JekyllImport::Importers::Drupal7.run({
  "dbname"   => "$DB_NAME",
  "user"     => "$DB_USER",
  "password" => "$DB_PASS",
  "host"     => "127.0.0.1",
  "types"    => ["blog", "story", "article"]
})
EOF
