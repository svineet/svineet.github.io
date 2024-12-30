#!/usr/bin/bash

cd ~/code/svineet.github.io
git pull

echo "Pulled."

nginx -s reload
echo "Deployed."

