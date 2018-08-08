## Dockselpy
[![Science](https://forthebadge.com/images/badges/built-with-science.svg)](https://dcc.ufmg.br)
[![Python3](https://forthebadge.com/images/badges/made-with-python.svg)](https://www.python.org/)

Dockerfile that *"assemble"* together Selenium (with support for Firefox), Python, Pandas and Xfvb.

### Information

This version was created to run a BOT that is part of a scientific research that studies the children exposure to advertisements on Youtube.

The image is build with the following dependencies:
- latest Firefox and geckodriver
- Selenium
- Python 3
- Xvfb and the python wrapper - pyvirtualdisplay
- Pandas
- mysql-connector
- tzupdate (for TimeZone update)

### Running:

- docker
    ```
    docker build -t selenium_docker .
    docker run --privileged -p 4000:4000 -d -it selenium_docker 
    ```

- docker-compose

    ```
    docker-compose stop && docker-compose build && docker-compose up -d
    ```
    
    
### Example

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

### Todos

 - Add CRON scheduler

License
----

MIT
