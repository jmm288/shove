#!/bin/bash

docker rm -f shove
docker run -d --name shove -p 5000:5000 435901930649.dkr.ecr.us-east-1.amazonaws.com/shove:0.0.0
