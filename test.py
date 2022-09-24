from pyvirtualdisplay import Display
from selenium import webdriver
from selenium.webdriver.firefox.options import Options

display = Display(visible=False, size=(800, 600))
display.start()

options = Options()
options.headless = True

driver = webdriver.Firefox()
driver.get('https://api.myip.com')
print(driver.page_source)

driver.quit()
display.stop()
