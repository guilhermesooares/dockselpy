# Dockselpy

[![Science](https://forthebadge.com/images/badges/built-with-science.svg)](https://dcc.ufmg.br)
[![Python3](https://forthebadge.com/images/badges/made-with-python.svg)](https://www.python.org/)

Dockerfile that *"assemble"* together Selenium (with support for Firefox), Python, Pandas and Xfvb.

## Information

This version was created to run a BOT that is part of a scientific research that studies the children exposure to advertisements on Youtube.

The image is build with the following dependencies:
- Latest Firefox and Geckodriver
- Selenium
- Python 3
- Xvfb and the python wrapper - pyvirtualdisplay
- Pandas
- Mysql-Connector
- TZUPDATE (for TimeZone update)
- Support to VPN Area connection


## Running:
#### Build Selenium Docker image
    docker build -t selenium_docker .
#### Run image in a Container
	docker run -t -d -it --name sp01 --mount source=eleicoes_db,target=/home/src/database --cap-add=NET_ADMIN --device /dev/net/tun selenium_docker
#### Run command inside Docker
	docker exec -it <container name> bash

## Arguments:

- device : Create tunneling device for use VPN connection protocol .
- name : Set container name
- cap-add: Add Linux capabilities
- mount: Mount volume in container

## Using Volumes:
To mount a volume in a docker container, follow that steps:
#### Create a volume
    docker volume <volume_name>
#### See created volume details
    docker inspect <volume_name>


## Use Example

```python
from pyvirtualdisplay import Display
from selenium import webdriver

display = Display(visible=0, size=(800, 600))
display.start()

browser = webdriver.Firefox()
browser.get('https://www.google.com/')
print(browser.title)

browser.quit()
display.stop()

```

## Todos
 - Automate Area VPN script inside Docker

License
----

MIT
