FROM ubuntu:latest

MAINTAINER taemon1337

ARG CHROME_VERSION
ENV CHROME_PACKAGE=google-chrome-stable_current_amd64.deb
ENV CHROME_DOWNLOAD_URL=https://dl.google.com/linux/direct/$CHROME_PACKAGE
#ENV CHROME_VERSION=64.0.3282.186
ENV DEBIAN_FRONTEND=noninteractive

COPY packages /usr/local/src/

RUN useradd -m google-chrome && \
    apt-get update && \
    apt-get install -y \
      --no-install-recommends \
      ca-certificates \
      gconf-service \
      hicolor-icon-theme \
      libappindicator3-1 \
      libasound2 \
      libcurl3 \
      libexif-dev \
      libgconf-2-4 \
      libgl1-mesa-dri \
      libgl1-mesa-glx \
      libnspr4 \
      libnss3 \
      libpango1.0-0 \
      libv4l-0 \
      libxss1 \
      libxtst6 \
      libgtk-3-0 \
      lsb-release \
      xdg-utils \
      fonts-liberation \
      wget && \
    wget $CHROME_DOWNLOAD_URL -O /usr/local/src/$CHROME_PACKAGE && \
    dpkg -i /usr/local/src/$CHROME_PACKAGE && \
    rm -rf /var/lib/apt/lists/* && \
    rm -rf /usr/local/src/packages

COPY start-google-chrome.sh /usr/local/bin/
COPY ./chrome /usr/local/bin/

ENTRYPOINT ["/usr/local/bin/start-google-chrome.sh"]

