#!/bin/sh
docker build -t rpi4learningbox/learninglocker2-app:latest app
docker build -t rpi4learningbox/learninglocker2-nginx:latest nginx

