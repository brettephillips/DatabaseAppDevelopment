from selenium import webdriver
from selenium.common.exceptions import TimeoutException
from selenium.webdriver.support.ui import WebDriverWait
from selenium.webdriver.support import expected_conditions as EC

import sys
import time


# Create a new instance of the FireFox driver
driver = webdriver.Chrome("C:\\_cuts\\Selenium\\chromedriver.exe")

# go to the site
base_url = "http://192.168.1.33:8333"
driver.get(base_url)

# if argument is true, then test an incorrect password; else test a correct password
isTestingIncorrect = sys.argv[1]

# find the elements
loginElement = driver.find_element_by_id("login")
usernameElement = loginElement.find_element_by_name("username")
passwordElement = loginElement.find_element_by_name("password")
buttonElement = loginElement.find_elements_by_class_name("btn")[0]

if isTestingIncorrect == "true":
	print("Testing bad password...")
	# type in the input boxes
	usernameElement.send_keys("baduser")
	time.sleep(1)
	passwordElement.send_keys("badpass")
	time.sleep(1)
else:
	print("Testing good password...")
	# type in the input boxes
	usernameElement.send_keys("dan")
	time.sleep(1)
	passwordElement.send_keys("1234")
	time.sleep(1)

# click the submit form button
buttonElement.click()
time.sleep(1)

try:
	if isTestingIncorrect == "true":
		# wait for the page to refresh
		WebDriverWait(driver,10).until(EC.title_contains("MTG Deck Planner"))
		# assert to see if the user is logged in
		assert driver.find_element_by_id("bad_login").text == 'Bad Username or Password'
		print("Bad login tested!")
	else:	
		# wait for the page to refresh
		WebDriverWait(driver,10).until(EC.title_contains("MTG Deck Planner | My Saved Decks"))
		# assert to see if the user is logged in
		assert driver.title == "MTG Deck Planner | My Saved Decks"
		print("Successful login tested!")
	
finally:
    driver.quit()


pause = input("Enter Any Key to Complete Test...")