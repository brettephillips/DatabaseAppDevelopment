# Development Book

ISTE 432

## Team Members and Roles
* Back-end Developers
	* Daniel Eden
	* Alex Johnson
* Front-end Developers
	* Brett Phillips
	* Brie McIntosh
* Content Creators
	* Alex Johnson
	* Brie McIntosh
* Database Developers
	* Daniel Eden
	* Brett Phillips

## Timeline
* Milestone 1 - Requirements
	* Due Date - Feb 1, 2019 11:59 PM
	* For this milestone, include:
		* Summary
		* Goals
		* Stakeholders
		* Scope
		* Input
		* Processing
		* Output
		* Data Sources
		* Glossary
* Milestone 2 - Design and Design Patterns
	* Due Date - Feb 22, 2019 11:59 PM
	* For this milestone, include:
		* Team Members and Roles
		* Background
		* Project Description
		* Project Requirements
		* Business Rules
		* Technologies Used
		* Timeline
* Milestone 3 - Layering
	* Due Date - Mar 1, 2019 11:59 PM
	* For this milestone, include:
		* In their own sections, the layers of the application
		* Be descriptive such as explaining classes and their roles
* Milestone 4 - Exception Handling
	* Due Date - Mar 22, 2019 11:59 PM
	* For this milestone, include:
		* Categories of exceptions that we are expecting
		* Examples of actual exception-handling code
		* Where are the exceptions created/where are they being sent to and from
* Milestone 5 - Performance and Refactoring
	* Due Date - Apr 5, 2019 11:59 PM
	* For this milestone, include:
		* How do we plan to improve your performance?
		* Give code examples of good coding practices
		* Improve existing code
* Milestone 6 - Testing
	* Due Date - Apr 19, 2019 11:59 PM
	* For this milestone, include:
		* Identify the testing framework (include necessary diagrams)
		* Provide code examples
* Milestone 7 - Deployment, Packaging
	* Due Date - Apr 26, 2019 11:59 PM
	* For this milestone, include:
		* Detail everything needed for packaging and deployment (A user should be able to read this and run the application)
		* A help specification, detailing what kinds of help would be provided in a full-blown installation
* Milestone 8 - Finalized Code
	* Due Date - Apr 29, 2019 11:59 PM
	* For this milestone, include:
		* A submission of the full code in the Dropbox

## Background
Magic the Gathering(MTG) is a card game that was started in 1993 by Richard Garfield and his team, now known to be Wizard's of the Coast(WOTC).  The cards were originally made with intent for them to be collected and played with for fun.  No single person would need more than one copy of each card in their possession, but eventually that turned to everyone needing four of each card to conform to the new competitive rules that had come about. These competitive rules came out in 1996 when "Organized Play" was being put into place by WOTC.  Not all players jumped on the boat for this form of play right away. Many continued to play with their own rules, or the original rules they had played with before the new rules where established. These players would be referred to as casual players since they did not use the official "Organized Play" rules.  

The objective of the game is to get your opponent to zero life points. In most games a player will start at 20 life points, however there are some formats of the game where a player can start at more life. There is a lesser known way to win which requires your opponent draw their entire deck.  When the player with the exhausted deck attempts to draw a card when none are present in the deck, that player loses.  A normal game usually plays out with both players putting lands into play that are used to cast creatures, instants, sorceries, enchantments, artifacts, or planeswalker, all of which are referred to as spells. Playing these spell cards can be used to defeat the opponent or prevent the opponent from winning all together, which can result in a draw.

## Summary/Project Description
This application will be used to make deck-lists for Magic the Gathering players who want to save and keep track of their own deck-lists as well as the deck-lists of other players. The decks can be sorted by user input and filters such as color and format. The other use of the application will be for users that want to create a deck. This will be done by searching for specific cards, which can be done with attributes like name, color of the card, and rarity of the card. Once the user finds the card they desire, they can add it to the list. The user will be able to view any card and acquire all of the information associated with the cards, including color, CMC(converted mana cost), power, toughness, type, set name, rarity, and the text on the card. This application will be helpful to players of the game because it allows them to look up other decks in order to prepare themselves for an event. In addition, they can save their own decks in order to print them out for an event in which deck-lists are required.

## Goals
* Users will be able to search through cards based on selectable filters. Some filters will be check boxes, while others will accept text input.
* Users will be able to select cards and add them to a saved deck-list.
* A user can create, edit, save, share, and delete their saved deck-lists.
* Users will be able to view saved deck-lists from other users.
* Users can filter saved deck-lists by criteria.
* Users will be able to rate deck-lists saved by other users.

## Stakeholders
* Players of “Magic the Gathering”, both casual and competitive
	* They want to be able to easily print off their deck-list for competitions.
	* They want to be able to scout their competition
	* They want to explore other deck-list setups in order to improve their own
* Hobby shop owners
	* They want to review popular cards and deck-lists for the purpose of making a profit.

## Scope
* Out-of-scope: Players will not be able to play against each other using their saved decks.
* We will only be dealing with English cards.
* Information of individual cards and sets will be displayed.
* The scope of the project includes searching through cards and saving cards in a “Deck List”. The scope also includes viewing and rating saved card lists from other users.

## Project Requirements
* Card Viewing
	* Users must be able to view a list of cards and the card's attributes
	* Users must be able to view deck-lists they have created as well as deck-lists created by other users
* Searching
	* Users must be able to apply search filters when searching cards (like searching for most popular)
	* Users must be able to apply search filters when searching saved deck-lists
* Creating Card Decks
	* Users must be able to select cards to add to a deck
	* Users must be able to save their decks
	* Users must be able to edit and delete saved decks
	* Users must be able to share decks
* Rating
	* Users should be able to rate deck-lists saved by other users
	
## Business Rules
* A saved deck must be at least 60 cards.
* Up to fifteen cards may be included in your sideboard, if you use one.
* Include no more than four copies of any individual card in your main deck and sideboard combined (except basic lands).
* There's no maximum deck size, as long as you can shuffle your deck in your hands unassisted.

## Technologies Used
* Front-end
	* HTML/CSS
	* JavaScript
		* jQuery
	* BootStrap
* Back-end
	* Python
		* Flask
	* Magic API
	* Magic Python SDK
* DBMS
	* PostgreSQL
* OS
	* Ubuntu 18.04
* Hosting
	* Heroku

## Input
* User input will be received as search queries based on filters.
* Card and Set metadata from an online database API.
* Users will enter the number of a single card needed for a deck, excluding basic lands.
* User input will be entered into the database when saving, editing, or deleting a deck.
* User input will be used to filter community made deck-lists.
* Partial user input will be gathered for rating of deck-lists saved by other users.

## Processing
Card searching will be based off of filtered parameters selected by the user. Some filters will be check boxes, while others will accept text input. These parameters will include:
	* Name
	* Color
	* Type
	* Mana Cost (cmc)
	* Card Type
	* Card Super-Type
	* Card Subtype
	* Rarity
	* Set Name
	* Text
	* Power
	* Toughness
	* Game Format
	* Legality
* In order to persist data, creation of completed deck-lists, consisting of 60+ cards, will be stored in a database.
* Saved deck lists will be pulled from the local database and displayed in the application.
* The rating of community deck-lists will be saved in the local database as well and be limited to a scale of 1-5.
* All input will be sanitized and validated to prevent malicious content and user errors.

## Output
* For players: A collection of personalized Magic the Gathering card decks.
* Hobby Shop Owners: A searchable collection of Magic the Gathering cards to determine the most popular cards, so that they shop owners can purchase and profit off of certain cards.
* Clicking on a individual card or set will display the detailed information for that item.

## Data Sources
* https://magicthegathering.io/: A REST API that offers detailed data on Magic the Gathering cards. This data includes the card name, image, as well as attributes related to a single card.

## Design Patterns / Layered Architecture
We will be employing a layered architecture following a MVC (Model–View–Controller) design pattern.  Our data layer will include the API that we will making calls from, and a SQLite3 database that we will store users and saved decks.  Our business layer will include our controller in the form of a Python Flask application and model classes for cards and decks.  Our application layer will be viewed through a web browser where users will authenticate, send search queries, save decks, and view saved decks.  Below is a diagram of our layered architecture:

![alt text](https://github.com/brettephillips/DatabaseAppDevelopment/blob/master/layered_arch.png)

#### Error Handling

We will be employing an error handling model that will collect any error generated inside a Try / Except block.  Any API, Database, model, or controller error is caught and processed by the main controller file __mtg.py__.  The error handling model accepts two parameters: error type and error message.  

__snippet from mtg.py__
``` python
	# Get some cards
	try:
		cards = Card.where(page=1).where(pageSize=40).where(name=search_name).all()

		# Set card name list to sent to template
		c_names = []

		# # Put card names in list
		for c in cards:
			if str(c.image_url) != "None":
				c_names.append([c.name, c.image_url, c.multiverse_id])

		return render_template('search.html',
			title=title,
			cards=c_names
		)

	# catch and log error
	except Exception as ex:
		logError("API Get Card Search",ex)

		return render_template('search.html',
			title=title,
			cards="error"
		)
```

When an exception is thrown, the model will take these two pieces of information with a timestamp, and write it to a log file.  Below is the error logging model code:

__errorLog.py__

``` python
import datetime

def logError(errorType, errorMessage):
	# Set log Filename
	filename = "log/errorLog.log"

	# Open log file for appending
	logfile = open(filename,"a+")

	# Get current Time
	now = datetime.datetime.now()
	formattedTime = now.strftime("%Y-%m-%d %H:%M:%S")

	fullMessage = (formattedTime +" : "+ errorType + " - " + str(errorMessage) + "\n\r")

	# log error message
	logfile.write(fullMessage)

	# close file
	logfile.close()
```

When an error is generated in the controller, a non-specific, generic message is passed to the presentation layer to let the user know something went wrong.  The HTML templates will check if an error is passed in the following fashion:

__snippet from an html template__
``` html
{% if name == 'error' %}

	<h2 id="card_name">Error Finding Card</h2>
	
{% else %}
	.... successful code here
```


#### Database

Our PostgreSQL database will be comprised of four tables.  First, the USERS table will hold a user's name and password for authentication.  A user may create multiple decks stored in the DECK table.  Each deck can be rated and the rating will be stored in the RATING table.  Each deck can have cards added to it and this is tracked by the DECK_CARD table.  Below is a diagram of our database.

Setting up Postgres DB on Ubuntu:
```
sudo -u postgres psql
ALTER USER postgres PASSWORD '<db password>';
\q
sudo systemctl restart postgresql
```

Import Postgres Database: ```psql < ./DB\ Scripts/createTables.sql```

Export Postgres Database: ```pg_dump mtg > ./DB\ Scripts/databaseExport.sql```

![alt text](https://github.com/brettephillips/DatabaseAppDevelopment/blob/master/DB%20Scripts/schema2.png?raw=true)

#### Flask Application Design Patterns
When developing our controller we will be following industry standard "best practices" for our Flask application architecture.  Below is a breakdown of the Flask app organization.

**Project Root Back-end:**

* Pages will be served using the main application file "mtg.py".
* This file defines URL routes and provides GET and POST methods to pass data from the front-end to the back-end.

EX:
`@app.route('/form-example', methods=['GET', 'POST'])`

* Back-end data is presented to the web interface through rendered HTML templates.
* The location of these templates and other static resources is denoted in this file.
* This

* Below is the current proof of concept code we have developed for "mtg.py":

```python
# Import needed Flask packages
from flask import Flask
from flask import render_template

# Set Project Root directory
import os
project_root = os.path.dirname(__file__)

# Define template and static folders for flask app
template_path = os.path.join(project_root, './templates')
static_path = os.path.join(project_root, './static')

# Import MTG API SDK
from mtgsdk import Card

##################################################################################
app = Flask(__name__, template_folder=template_path, static_folder=static_path)
##################################################################################
# Home Page
@app.route("/")
def home():
	# Set home title
	h_title = "MTG Deck Planner"

	# Search parameters:
	search_name = "card"

	# Get some cards
	cards = Card.where(page=1).where(pageSize=10).where(name=search_name).all()

	# Set card name list to sent to template
	c_names = []

	# # Put card names in list
	for c in cards:
		if str(c.image_url) != "None":
			c_names.append([c.name, c.image_url])

	return render_template('home.html',
		title=h_title,
		cards=c_names
		)

	#return(h_title)

##################################################################################
if __name__ == "__main__":
    app.run(host='0.0.0.0')
```

**HTML templates**

* HTML templates in the ./templates folder are used to render the back-end data provided by mtg.py.
* Back-end variables can be placed in specific places by inserting them in the template like:

EX:
`<title>{{title}}</title>`

* Lists of backend data can be passed to the template and iterated over to create groups web elements

EX: (this code uses a list 'cards' and iterates over each element 'n'.  n[0] is the card name and n[1] is the card image URL.)
```
<div id='card_return'>
  {% for n in cards %}
  <div class='card_show'>
    <p>{{n[0]}}</p>
    <img src="{{n[1]}}" alt="{{n[0]}}">
  </div>
  {% endfor %}
</div>
```

* In addition, other HTML templates can be included in a template.  
* This allows for segmenting code into meaningful, reusable chunks.
* These can be called with:

EX: (this will include the navigation menu) 	
`{% include 'nav.html' %}`


**Static Files**
* The static folder is used to store web resources that will be used by the front end.
* This includes "media", "js", and "css" sub-folders.
* When the template and static folders are specified in the main application file (mtg.py) the HTML have access to the resources in the following path: /static

EX:
`<img src="/static/media/magic_logo.png" alt="logo" width="150">`

## Packaging - Deploy Python 3 Flask Application

This app is meant to run on Ubuntu 18.04.

Primary developemnt is done on the RIT Ubuntu 18.04 Virtual Machine.

https://www.digitalocean.com/community/tutorials/how-to-serve-flask-applications-with-uswgi-and-nginx-on-ubuntu-18-04

First Install dependencies

`sudo apt update`

`sudo apt install python3-pip python3-dev build-essential libssl-dev libffi-dev python3-setuptools postgresql-server-dev-all chromium-browser`

Next, move to your home directory and clone the git repositroy:

```
cd
git clone https://github.com/brettephillips/DatabaseAppDevelopment.git
```

Create a folder 'mtg' and copy the repo files into it.  Then move into that directory.
```
mkdir mtg
cp -R DatabaseAppDevelopment/* mtg/
cd mtg
```

Next, let's install Python dependencies:

`pip3 install wheel uwsgi flask mtgsdk bcrypt psycopg2`

you need to allow access to port 5000:

`sudo ufw allow 5000`

The next step is to configure the PostgreSQL databae user and password.

Enter these commands to set the password for the 'postgres' user:
```
sudo -u postgres psql
ALTER USER postgres PASSWORD '<PASSWORD>';
\q
sudo systemctl restart postgresql
```

The password must also be set in the file `database.ini`

`vi database.ini`

```
[postgresql]
host=localhost
database=mtg
user=postgres
password=<PASSWORD>
```

To load the test data into the database, enter the following command:

`psql < ./DB\ Scripts/databaseExport.sql`

Now, you can run the Flask app by typing:

`python3 mtg.py`

Visit your server's IP address followed by :5000 in your web browser (Best viewed in Chomium):

http://localhost:5000

## Performance and Refactoring

#### Performance Changes

Once instance where we noticed performance issues in our application is during API calls to the MTG API.  These can be slow when returning many cards at once.  Initially, we were going to make API calls to display the cards that are saved in each person's deck ("My Decks" page).  We quickly realized that when a user has many decks saved, each with up to 60 cards or more, this would result in a page that would load extremely slow.  The fix was to store more data in the database when saving a card to a deck.  Instead of storing just the unique API card identifier in the database and making an API call to get more data, we now store the identifier, card name, and image URL after making the initial API call for that single card.  Due to database access being significantly faster, we can now load the "My Decks" page with almost no delay.

#### Performance Testing

Our application environment runs on the RIT Ubuntu 18.04 VM.  This environment is configured to use 2 virtual processors and 4096 MB of RAM.  Below are the network loading tests we have performed on the various pages and functions of our application: 

* Home Page: 314 ms
* Full Card Search (40 cards): 1.74 seconds
* Single Card Details: 1.19 seconds
* Add card to deck: 11 ms
* My Decks (95 cards): 575 ms
* Remove Card from deck: 19 ms
* Remove Deck: 93 ms  
* Explore Decks: not implemented yet

    __Conclusion:__

    At this point we are happy with the performance of our application.  All pages load within two seconds.  We will continue to conduct performance testing as developemt continues.

### Refactoring
we spent a lot of time on refactoring. The refactoring that took place is mainly involving management's decision to change our DBMS. Originally, we had decided to use SQLite3, but due to changing requirements, we had to switch to PostgreSQL. Since our code was very abstract, it did not take long to implement the new database.  The main challenge was setting up the Postgres connection method in our code.  Below is the method that all database calls now utilize:

*Postgres DB Connection Method: in mtg.py*
``` python
import psycopg2
from config import config
def dbConnect():
	conn = None

	try:
		# read connection parameters
		params = config()

		# connect to the PostgreSQL server
		conn = psycopg2.connect(**params)

		return conn

	except (Exception, psycopg2.DatabaseError) as error:
		logError("DB Connection",error)
```
__Note:__ The `config` import is from a file named `config.py`.  This file retrieves the database credentials stored in an `.ini` file.

During this process, we also decided to refactor certain aspects of the code by extracting repeated code and putting the repeated code into methods. As a result, our code looks cleaner and is easier to read.  Part of this was deciding to separate our database endpoints into their own methods, rather than putting them within the page routes.

*add_deck database endpoint within mtg.py*
``` python
# add_deck
@app.route("/add_deck", methods=['GET','POST'])
def add_deck():
	# get add deck form value
	add_deck_name = request.form.get('add_deck_name')
	# create new deck INSERT
	try:
		# Connect to DB
		conn = dbConnect()

		#create cursor
		cursor = conn.cursor()

		# Insert Deck
		cursor.execute("INSERT INTO deck (name, user_id) VALUES (%s,%s)", (add_deck_name, session['user_id'],))

		# commit insert
		conn.commit()

		# close cursor
		cursor.close()

		return json.dumps({'status':'OK'});

	# catch and log DB error
	except Exception as ex:
		logError("DB Create Deck",ex)
		return json.dumps({'status':'BAD'});
```

In addition, we decided to use AJAX to send POST data to our endpoints instead of HTML forms. This allows us more flexibility when sending data to the main controller. Based on the response from the controller, we are able to provide the user with a more seamless interaction with the application as well as have more options for error handling on the controller.

*example AJAX call from mydekcs.html*
``` javascript
// function to remove a user's deck
function removeDeck(deck_id) {

    $.ajax({
        // call remove_deck route in mtg.py
        url: "{{url_for('remove_deck')}}",
        // send POST data
        method: "POST",
        data:{
            // send the deck_id to be removed (unique PK)
            "deck_id":deck_id
        },
        success: function(data) {
            console.log("Removed Deck");
            // reload page
            location.reload();
        },
        error: function(error) {
            console.log(error);
            //error response in DOM
            document.getElementById("success").innerHTML = "Error adding card";
        }
    });
}
```
## Testing
For our testing, we decided to use Selenium. Selenium is an open-source web browser automation tool that allows us to simulate user actions. As a result, this allows us to test the full functionality of the website. Selenium provides us the ability to create complex tests utilizing many different scripting and programming languages. To maintain consistency between our application and tests, we decided to use Python. In the testing directory, you can find the following tests: login.py, filter.py, explore_decks.py.

These automated tests were executed on a Windows 10 system that has network communication with the Ubuntu VM running the application.  To run the Selenium automation server on Windows, first launch the server using the jar file:

`java -jar selenium-server-standalone-3.13.0.jar`

#### Script Configuration
*Before running the Selenium tests, you must first install the selenium package*

`pip3 install selenium`

The path of the Selenium web driver must be specified.  In each script, the driver path is pointing to the location in our environment that contains the Chrome web driver. 

`driver = webdriver.Chrome("C:\\_cuts\\Selenium\\chromedriver.exe")` 

In addition, each script points to a base URL variable that specifies the URL to access the root of the application.  For these tests, the URL is set to:

`base_url = "http://192.168.1.33:8333"`

#### Running Tests
*In order to run the Selenium tests, you must run the following command*

`python3 <filename> [args]`

##### login.py
This will test to see if the user can login correctly with valid credentials. It will also test, with invalid credentials, if the user is prevented access to explore the site further. This test requires a Boolean argument of true or false. True tests invalid credentials, whereas false tests valid credentials.

To run this test run the following command:

`python3 login.py true` or `python3 login.py false`

##### filter.py
This test will go through the various filter options and verify each function is returning the cards from the MTG API properly.
* Test 1: Finding a card just by the name field.
* Test 2: Finding a card using CMC, Power, & Toughness.
* Test 3: Finding cards using color check-boxes.

To run this test run the following command:

`python3 filter.py`

##### explore_decks.py
This test will confirm that each deck listed on the 'Explore Decks' page.  It will iterate over each deck URL and confirm that 60 or more cards are listed in the deck.

To run this test run the following command:

`python3 explore_decks.py`

## Glossary
* CMC
	* Converted Mana Cost, the total cost to play a card within the game.
* Color
	* The color of the cards consist of, White(W), Blue(U), Black(B), Red(R), and Green(G). The single characters are considered the color identities of the card.	
* Deck-list
	* The number and combination of cards in the deck that are a minimum of 60 in standard format.
* Game format
	* Standard, Modern, Pauper, Legacy, Commander/EDH, or Vintage.
* Lands
	* Locations under the player’s control that can be used to generate mana.
* Legality
	* Certain cards are banned within formats and this is a flag to show if the card is legal within a certain format.
* Mana
	* A resource used to play many of the game’s cards and abilities.
* MTG multiverse ID
	* The unique ID of each card stored in the API
* Power
	* The amount of damage a creature will do when combat occurs.
* Rarity
	* Common, Uncommon, Rare, Mythic.
* Sideboard
	* A group of additional cards the player may use to modify his or her deck between games of a match.
* Toughness
	* The amount of damage a creature can endure when combat occurs.
* Type
	* Creature, Enchantment, Instant, Sorcery, Artifact, Planeswalker, Tribal, Land.

