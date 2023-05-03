#!/bin/sh

rm -rf production
rm -rf dist

echo "Host Build"
nx run host:build:production

mkdir production
cp -r dist/apps/host/* production
cp -r dist/apps/{cart,products} production

# echo "Deploy workspace"
nx g @nx/workspace:run-commands deploy --project=host \
  --command="rm -rf production && mkdir production && cp -r dist/apps/host/* production && cp -r dist/apps/{cart,products} production"

# echo "Depoy host"
nx deploy host
