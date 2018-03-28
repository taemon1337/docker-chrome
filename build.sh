#!/bin/bash

version="$(cat VERSION)"
docker build --build-arg CHROME_VERSION=$version -t chrome:$version .

