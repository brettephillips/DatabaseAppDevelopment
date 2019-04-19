from selenium import webdriver
from selenium.common.exceptions import TimeoutException
from selenium.webdriver.support.ui import WebDriverWait
from selenium.webdriver.support import expected_conditions as EC

# Create a new instance of the FireFox driver
driver = webdriver.Firefox("geckodriver.exe")

# go to the site
driver.get("http://localhost:5000")

# if argument is true, then test an incorrect password; else test a correct password
isTestingIncorrect = sys.argv[0]

# find the elements
loginElement = driver.find_element_by_id("login")
usernameElement = loginElement.find_element_by_name("username")
passwordElement = loginElement.find_element_by_name("password")
buttonElement = loginElement.find_elements_by_class_name("btn")[0]

if isTestingIncorrect:
	# type in the input boxes
	usernameElement.send_keys("brett")
	passwordElement.send_keys("1234")
else:
	# type in the input boxes
	usernameElement.send_keys("dan")
	passwordElement.send_keys("1234")

# submit the form (although google automatically searches now without submitting)
buttonElement.click()

try:
	if isTestingIncorrect:
		# wait for the page to refresh
		WebDriverWait(driver,10).until(EC.title_contains("MTG Deck Planner"))

		# assert to see if the user is logged in
		assert loginElement.find_elements_by_tag_name("p")[0] == 'Bad Username or Password'
	else:	
		# wait for the page to refresh
		WebDriverWait(driver,10).until(EC.title_contains("MTG Deck Planner | My Saved Decks"))

		# assert to see if the user is logged in
		assert driver.title("MTG Deck Planner | My Saved Decks")
	
finally:
    driver.quit()