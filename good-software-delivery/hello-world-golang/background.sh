#!/bin/bash

echo "done" >> /root/katacoda-finished
git clone https://github.com/contino/gsd-hello-world.git
cd gsd-hello-world && make build
echo "done" >> /root/katacoda-background-finished
