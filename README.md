
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


## Running:
#### Build Selenium Docker image
    docker build -t selenium_docker .
#### Run image in a Container
	docker run -t -d selenium_docker
#### Run command inside Docker (ex : run.sh)
	docker exec -it <container name> ./run
#### Stop Container
    docker stop selenium_docker
    
--hostname *{nome_da_maquina} : Nome da máquina refere-se a localidade da máquina, configurada no banco de dados e atribuída a uma persona.	

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

License
----

MIT
