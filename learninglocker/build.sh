#!/bin/sh
docker build -t rpi4learningbox/learninglocker2-app:7.0.0 app
docker build -t rpi4learningbox/learninglocker2-nginx:1.20.0 nginx

