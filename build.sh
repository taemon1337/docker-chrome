#!/bin/bash


find_latest_chrome_version() {
  curl -ks https://www.whatismybrowser.com/guides/the-latest-version/chrome | grep -A1 'Chrome on <strong>Linux</strong>' | grep "<td>[0-9\.]*</td>" | sed -e 's/<td>//' | sed -e 's/<\/td>//' | tr -d '[:space:]'
}

version="$(find_latest_chrome_version)"
lastversion="$(cat VERSION | tail -n 1)"

if [ "$version" != "$lastversion" ]; then
  echo "$version" >> VERSION  # append latest version to VERSION logfile
fi

read -p "Build Chrome Version: $version [y/n] " ans
if [ "$ans" == "y" ]; then
  docker build --build-arg CHROME_VERSION=$version -t chrome:$version .
fi

