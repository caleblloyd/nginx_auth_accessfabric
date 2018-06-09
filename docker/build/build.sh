#!/bin/bash

cd $(dirname $0)
dockerfile="$(pwd)/Dockerfile"
cd ../../

docker build -f "$dockerfile" .