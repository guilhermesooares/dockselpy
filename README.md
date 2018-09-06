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
	sudo docker run -t -d -it --cap-add=NET_ADMIN --device /dev/net/tun selenium_docker
#### Run command inside Docker
	docker exec -it <container id> bash
#### Stop Container
    docker stop selenium_docker

## Arguments:
- hostname *{nome_da_maquina} : Nome da máquina refere-se a localidade da máquina, configurada no banco de dados e atribuída a uma persona.
- device : Create tunneling device for use VPN connection protocol .


## Example

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

 - Add CRON scheduler
 - Automate Area VPN script inside Docker
 - Check ptracking parse

License
----

MIT
