# Development Book

ISTE 432

Brett Phillips \
Alex Johnson \
Daniel Eden \
Brie McIntosh

## Milestone 1 - Requirements
#### Summary
* This application will be used to make decklists for Magic the Gathering players who want to save and keep track of their own decklists as well as the decklists of other players. The decks can be sorted by user input and filters such as color and format. The other use of the application will be for users that want to create a deck. This will be done by searching for specific cards, which can be done with attributes like name, color of the card, and rarity of the card. Once the user finds the card they desire, they can add it to the list. The list will require a minimum of 60 cards total, or in some cases it will require 100 depending on the game type. Users are allowed to have multiple identical cards if they are playing the 100 card format of the game. The user will be able to view any card and acquire all of the information associated with the cards, including color, CMC(converted mana cost), power, toughness, type, set name, rarity, and the text on the card. This application will be helpful to players of the game because it allows them to look up other decks in order to prepare themselves for an event. In addition, they can save their own decks in order to print them out for an event in which decklists are required.

#### Goals
* Users will be able to search through cards based on selectable filters.  Some filters will be checkboxes, while others will accept text input.
* Users will be able to select cards and add them to a saved decklist.
  * A user can create, edit, save, share, and delete their saved decklists.
* Users will be able to view saved decklists from other users.
* Users can filter saved decklists by criteria.
* Users will be able to rate decklists saved by other users.

#### Stakeholders
* Players of “Magic the Gathering”, both casual and competitive
  * They want to be able to easily print off their decklist for competitions.
  * They want to be able to scout their competition
  * They want to explore other decklist setups in order to improve their own
* Hobby shop owners 
  * They want to review popular cards and decklists for the purpose of making a profit.

#### Scope
* Out-of-scope: Players will not be able to play against each other using their saved decks.
* We will only be dealing with English cards.
* Information of individual cards and sets will be displayed.
* The scope of the project includes searching through cards and saving cards in a “Deck List”.  The scope also includes viewing and rating saved card lists from other users.

#### Input
* User input will be received as search queries based on filters.
* Card and Set metadata from an online database API.
* Users will enter the number of a single card needed for a deck, excluding basic lands.
* User input will be entered into the database when saving, editing, or deleting a deck.
* User input will be used to filter community made decklists.
* Partial user input will be gathered for rating of decklists saved by other users.

#### Processing
* Card searching will be based off of filtered parameters selected by the user. Some filters will be checkboxes, while others will accept text input. These parameters will include:
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
* In order to persist data, creation of completed decklists, consisting of 60 cards or a total of 100 cards depending on the format, will be stored in a database.
* Saved deck lists will be pulled from the local database and displayed in the application.
* The rating of community decklists will be saved in the local database as well and be limited to a scale of 1-5.
* All input will be sanitized and validated to prevent malicious content and user errors.

#### Output
* For players: A collection of personalized Magic the Gathering card decks.
* Hobby Shop Owners: A searchable collection of Magic the Gathering cards to determine the most popular cards, so that they shop owners can purchase and profit off of certain cards.
* Clicking on a individual card or set will display the detailed information for that item.

#### Data Sources
* https://magicthegathering.io/: A REST API that offers detailed data on Magic the Gathering cards. This data includes the card name, image, as well as attributes related to a single card.

#### Glossary
* CMC
	* Converted Mana Cost, the total cost to play a card within the game.
* Color
	* The color of the cards consist of, White(W), Blue(U), Black(B), Red(R), and Green(G). The single characters are considered the color identities of the card.
* Decklist
	* The number and combination of cards in the deck that are a minimum of 60 or a total of 100 cards, depending on the format.
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
* Toughness
	* The amount of damage a creature can endure when combat occurs.
* Type
	* Creature, Enchantment, Instant, Sorcery, Artifact, Planeswalker, Tribal, Land.
	
## Milestone 2 - Requirements
#### Team Members and Roles
#### Background
#### Project Description
#### Project Requirements
#### Business Rules
#### Technologies Used
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
#### Timeline
#### Design Patterns
