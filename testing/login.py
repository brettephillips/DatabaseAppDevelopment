from selenium import webdriver
from selenium.common.exceptions import TimeoutException
from selenium.webdriver.support.ui import WebDriverWait
from selenium.webdriver.support import expected_conditions as EC

# Create a new instance of the Chrome driver
driver = webdriver.Chrome()

# go to the site
driver.get("http://localhost:5000")

# if argument is true, then test an incorrect password; else test a correct password
isTestingIncorrect = sys.argv[0]

# find the elements
usernameElement = driver.find_element_by_name("q")
passwordElement = driver.find_element_by_name("q")
loginElement = driver.find_element_by_name("q")

if isTestingIncorrect:
	# type in the input boxes
	usernameElement.send_keys("brett")
	passwordElement.send_keys("1234")
else:
	# type in the input boxes
	usernameElement.send_keys("dan")
	passwordElement.send_keys("1234")

# submit the form (although google automatically searches now without submitting)
loginElement.click()

try:
	if isTestingIncorrect:
		# wait for the page to refresh
		WebDriverWait(driver, 10).until(EC.title_contains("cheese!"))
		
		# assert to see if the user is logged in
		assert element.text == 'Example Domains'
	else:
		# wait for the page to refresh
		WebDriverWait(driver, 10).until(EC.title_contains("cheese!"))
		
		# assert to see if the user is logged in
		assert element.text == 'Example Domains'
	
finally:
    driver.quit()
