from selenium import webdriver

from selenium.webdriver.chrome.service import Service
from selenium.webdriver.common.by import By
import time

# https://sites.google.com/chromium.org/driver/getting-started
# https://googlechromelabs.github.io/chrome-for-testing/#stable
# https://storage.googleapis.com/chrome-for-testing-public/125.0.6422.141/mac-arm64/chromedriver-mac-arm64.zip

service = Service(executable_path="./chromedriver")
driver = webdriver.Chrome(service=service)

driver.get("https://google.com")

input_element = driver.get_element(By.CLASS_NAME, "fp-nh")
time.sleep(20)

driver.quit()


