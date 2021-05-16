#!/usr/bin/env bash

set -euo pipefail

if [ ! -e Ahkuilon.rvm ]
then
  echo "Error: This script needs to be run from the Modules directory of the Revenant installation."
  exit 1
fi

echo "Backing up if needed..."
cp -n Ahkuilon.rvm Ahkuilon.rvm.bak

echo "Extracting data..."
mkdir fix
cd fix
unzip -q ../Ahkuilon.rvm

echo "Performing replacements..."
sed -i 's/Sardok\.say/SardokT.say/' keep.s

echo "Repacking Ahkuilon.rvm..."
zip -rq --compression-method store ../Ahkuilon.rvm.new *
mv ../Ahkuilon.rvm.new ../Ahkuilon.rvm
echo "Repair finished."
