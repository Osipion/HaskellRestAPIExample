#!/usr/bin/env bash
docker stop httptest
docker rm httptest
docker build -t httptest .
docker run -it --name httptest -p 3021:3021 httptest