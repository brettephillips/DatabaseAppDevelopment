# Import needed Flask packages
from flask import Flask
from flask import render_template
from flask import request

# Set Project Root directory
import os
project_root = os.path.dirname(__file__)

# Define template and static folders for flask app
template_path = os.path.join(project_root, './templates')
static_path = os.path.join(project_root, './static')

# Import MTG API SDK 
from mtgsdk import Card

# Import card class 
import card

##################################################################################
app = Flask(__name__, template_folder=template_path, static_folder=static_path)
##################################################################################
# Card Sarch Page
@app.route("/search", methods=['GET','POST'])
def search():
	# Set home title
	h_title = "MTG Deck Planner"

	# Search parameters:
	#search_name = "city of ass"
	search_name = request.form.get('search')

	# Get some cards
	cards = Card.where(page=1).where(pageSize=40).where(name=search_name).all()

	# Set card name list to sent to template
	c_names = []

	# # Put card names in list
	for c in cards:
		if str(c.image_url) != "None":
			c_names.append([c.name, c.image_url, c.multiverse_id])

	return render_template('search.html',
		title=h_title,
		cards=c_names
		)

# Card Sarch Page
@app.route("/card/<string:card_id>", methods=['GET','POST'])
def card(card_id):

	title = "MTG Deck Planner - Card Details"

	# card card details from API based on multiverse ID
	api_card = Card.find(card_id)

	# #create Card class objecct
	# card = Card(
	# 		name 			= api_card.name,
	# 		multiverse_id 	= api_card.multiverse_id,
	# 		layout 			= api_card.layout,
	# 		mana_cost 		= api_card.mana_cost,
	# 		cmc 			= api_card.cmc,
	# 		colors 			= api_card.colors,
	# 		color_identity 	= api_card.color_identity,
	# 		type 			= api_card.type,
	# 		supertypes 		= api_card.supertypes,
	# 		subtypes 		= api_card.subtypes,
	# 		rarity 			= api_card.rarity,
	# 		text 			= api_card.text,
	# 		power 			= api_card.power,
	# 		toughness 		= api_card.toughness,
	# 		life 			= api_card.life,
	# 		legalities 		= api_card.legalities,
	# 		image_url 		= api_card.image_url,
	# 		set 			= api_card.set,
	# 		set_name 		= api_card.set_name,
	# 	)

# name
# multiverse_id
# layout
# mana_cost
# cmc
# colors
# color_identity
# type
# supertypes
# subtypes
# rarity
# text
# power
# toughness
# life
# legalities
# image_url
# set
# set_name

	return render_template('card.html',
		title=title,

		name = api_card.name,
		multiverse_id = api_card.multiverse_id,
		layout = api_card.layout,
		mana_cost = api_card.mana_cost,
		cmc = api_card.cmc,
		colors = api_card.colors,
		color_identity = api_card.color_identity,
		type = api_card.type,
		supertypes = api_card.supertypes,
		subtypes = api_card.subtypes,
		rarity = api_card.rarity,
		text = api_card.text,
		flavor = api_card.flavor,
		power = api_card.power,
		toughness = api_card.toughness,
		life = api_card.life,
		legalities = api_card.legalities,
		image_url = api_card.image_url,
		set = api_card.set,
		set_name = api_card.set_name
		)

##################################################################################
if __name__ == "__main__":
    app.run(host='0.0.0.0')