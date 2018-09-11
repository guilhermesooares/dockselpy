FROM ubuntu:xenial

# Install application requirements

RUN apt-get update && apt-get install -y \
    python3 python3-pip \
    libgconf2-4 libxss1 \
    git \
    software-properties-common \
    curl unzip wget \
    xvfb

# install geckodriver and firefox

RUN GECKODRIVER_VERSION=`curl https://github.com/mozilla/geckodriver/releases/latest | grep -Po 'v[0-9]+.[0-9]+.[0-9]+'` && \
    wget https://github.com/mozilla/geckodriver/releases/download/$GECKODRIVER_VERSION/geckodriver-$GECKODRIVER_VERSION-linux64.tar.gz && \
    tar -zxf geckodriver-$GECKODRIVER_VERSION-linux64.tar.gz -C /usr/local/bin && \
    chmod +x /usr/local/bin/geckodriver

RUN add-apt-repository -y ppa:ubuntu-mozilla-daily/ppa
RUN apt-get update && apt-get install -y firefox

# Firefox Customization to HTTP log config [NOT IN USE]
# RUN mv /usr/bin/firefox /usr/bin/oficial-firefox

# Install python dependencies
RUN pip3 install selenium pandas pyvirtualdisplay mysql-connector tzupdate peewee

# Set default aplication folder
ENV APP_HOME /usr/src/app
WORKDIR /$APP_HOME

# It fix resolvconf error when run VPN
RUN echo "resolvconf resolvconf/linkify-resolvconf boolean false" | debconf-set-selections


#Run VPN Area Script
#RUN wget https://vpnarea.com/downloads/vpnarea.pl && \
#    chmod 777 vpnarea.pl && \
#    ./vpnarea.pl

# Clone our private GitHub Repository
RUN git clone https://d3eb613992b658f5631c7fe99be78d0d3d740123:x-oauth-basic@github.com/FelipeGiori/video-ads-eleicoes.git $APP_HOME/