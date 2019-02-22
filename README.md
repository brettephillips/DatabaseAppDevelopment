# Development Book

ISTE 432

## Team Members and Roles
* Backend Developers
	* Daniel Eden
	* Alex Johnson
* Frontend Developers
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
		* A help specification, detailing wha tkinds of help would be provided in a full-blown installation
* Milestone 8 - Finalized Code
	* Due Date - Apr 29, 2019 11:59 PM
	* For this milestone, include:
		* A submission of the full code in the dropbox

## Background
Magic the Gathering(MTG) is a card game that was started in 1993 by Richard Garfield and his team, now known to be Wizard's of the Coast(WOTC).  The cards were originally made with intent for them to be collected and played with for fun.  No single person would need more than one copy of each card in their possession, but eventually that turned to everyone needing four of each card to conform to the new competitive rules that had come about. These competitive rules came out in 1996 when "Organized Play" was being put into place by WOTC.  Not all players jumped on the boat for this form of play right away. Many continued to play with their own rules, or the original rules they had played with before the new rules where established. These players would be referred to as casual players since they did not use the official "Organized Play" rules.  

The objective of the game is to get your opponent to zero life points. In most games a player will start at 20 life points, however there are some formats of the game where a player can start at more life. There is a lesser known way to win which requires your opponent draw their entire deck.  When the player with the exhausted deck attempts to draw a card when none are present in the deck, that player loses.  A normal game usually plays out with both players putting lands into play that are used to cast creatures, instants, sorceries, enchantments, artifacts, or planeswalker, all of which are referred to as spells. Playing these spell cards can be used to defeat the opponent or prevent the opponent from winning all together, which can result in a draw.

## Summary/Project Description
This application will be used to make decklists for Magic the Gathering players who want to save and keep track of their own decklists as well as the decklists of other players. The decks can be sorted by user input and filters such as color and format. The other use of the application will be for users that want to create a deck. This will be done by searching for specific cards, which can be done with attributes like name, color of the card, and rarity of the card. Once the user finds the card they desire, they can add it to the list. The user will be able to view any card and acquire all of the information associated with the cards, including color, CMC(converted mana cost), power, toughness, type, set name, rarity, and the text on the card. This application will be helpful to players of the game because it allows them to look up other decks in order to prepare themselves for an event. In addition, they can save their own decks in order to print them out for an event in which decklists are required.

## Goals
* Users will be able to search through cards based on selectable filters. Some filters will be checkboxes, while others will accept text input.
* Users will be able to select cards and add them to a saved decklist.
* A user can create, edit, save, share, and delete their saved decklists.
* Users will be able to view saved decklists from other users.
* Users can filter saved decklists by criteria.
* Users will be able to rate decklists saved by other users.

## Stakeholders
* Players of “Magic the Gathering”, both casual and competitive
	* They want to be able to easily print off their decklist for competitions.
	* They want to be able to scout their competition
	* They want to explore other decklist setups in order to improve their own
* Hobby shop owners
	* They want to review popular cards and decklists for the purpose of making a profit.

## Scope
* Out-of-scope: Players will not be able to play against each other using their saved decks.
* We will only be dealing with English cards.
* Information of individual cards and sets will be displayed.
* The scope of the project includes searching through cards and saving cards in a “Deck List”. The scope also includes viewing and rating saved card lists from other users.

## Project Requirements
* Card Viewing
	* Users must be able to view a list of cards and the card's attributes
	* Users must be able to view decklists they have created as well as decklists created by other users
* Searching
	* Users must be able to apply search filters when searching cards (like searching for most popular)
	* Users must be able to apply search filters when searching saved decklists
* Creating Card Decks
	* Users must be able to select cards to add to a deck
	* Users must be able to save their decks
	* Users must be able to edit and delete saved decks
	* Users must be able to share decks
* Rating
	* Users should be able to rate decklists saved by other users
	
## Business Rules
* A saved deck must be at least 60 cards.
* Up to fifteen cards may be included in your sideboard, if you use one.
* Include no more than four copies of any individual card in your main deck and sideboard combined (except basic lands).
* There's no maximum deck size, as long as you can shuffle your deck in your hands unassisted.

## Technologies Used
* Frontend
	* HTML/CSS
	* JavaScript
		* jQuery
	* BootStrap
* Backend
	* Python
		* Flask
	* Magic API
	* Magic Python SDK
* DBMS
	* SQLite 3
* OS
	* Ubuntu 18.04
* Hosting
	* Heroku

## Input
* User input will be received as search queries based on filters.
* Card and Set metadata from an online database API.
* Users will enter the number of a single card needed for a deck, excluding basic lands.
* User input will be entered into the database when saving, editing, or deleting a deck.
* User input will be used to filter community made decklists.
* Partial user input will be gathered for rating of decklists saved by other users.

## Processing
Card searching will be based off of filtered parameters selected by the user. Some filters will be checkboxes, while others will accept text input. These parameters will include:
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
* In order to persist data, creation of completed decklists, consisting of 60+ cards, will be stored in a database.
* Saved deck lists will be pulled from the local database and displayed in the application.
* The rating of community decklists will be saved in the local database as well and be limited to a scale of 1-5.
* All input will be sanitized and validated to prevent malicious content and user errors.

## Output
* For players: A collection of personalized Magic the Gathering card decks.
* Hobby Shop Owners: A searchable collection of Magic the Gathering cards to determine the most popular cards, so that they shop owners can purchase and profit off of certain cards.
* Clicking on a individual card or set will display the detailed information for that item.

## Data Sources
* https://magicthegathering.io/: A REST API that offers detailed data on Magic the Gathering cards. This data includes the card name, image, as well as attributes related to a single card.

## Design Patterns
We will be employing a layered architecture following a MVC (Model–View–Controller) design pattern.  Our data layer will include the API that we will making calls from, and a SQLite3 database that we will store users and saved decks.  Our business layer will include our controller in the form of a Python Flask application and model classes for cards and decks.  Our application layer will be viewed through a web browser where users will authenticate, send search queries, save decks, and view saved decks.  Below is a diagram of our layered architecture:

![alt text](https://github.com/brettephillips/DatabaseAppDevelopment/blob/master/layered_arch.png)

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

## Glossary
* CMC
	* Converted Mana Cost, the total cost to play a card within the game.
* Color
	* The color of the cards consist of, White(W), Blue(U), Black(B), Red(R), and Green(G). The single characters are considered the color identities of the card.	
* Decklist
	* The number and combination of cards in the deck that are a minimum of 60 in standard format.
* Game format
	* Standard, Modern, Pauper, Legacy, Commander/EDH, or Vintage.
* Lands
	* Locations under the player’s control that can be used to generate mana.
* Legality
	* Certain cards are banned within formats and this is a flag to show if the card is legal within a certain format.
* Mana
	* A resource used to play many of the game’s cards and abilities.
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
