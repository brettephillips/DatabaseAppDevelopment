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

# Import SQLite3
import sqlite3

# Import error logging model
from errorLog import logError

#Import Password Hashing
import bcrypt

##################################################################################
app = Flask(__name__, template_folder=template_path, static_folder=static_path)
##################################################################################
# Card Sarch Page
@app.route("/", methods=['GET','POST'])
def home():

	title = "MTG Deck Planner"

	return render_template('home.html',
		title=title
	)


##################################################################################
# Card Sarch Page
@app.route("/search", methods=['GET','POST'])
def search():
	# Set home title
	title = "MTG Deck Planner | Card Search"

	# Search parameters:
	#search_name = "city of ass"
	search_name = request.form.get('search')

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
##################################################################################
# Card Details Page
@app.route("/card/<string:card_id>", methods=['GET','POST'])
def card(card_id):

	title = "MTG Deck Planner | Card Details"

	# card card details from API based on multiverse ID
	try:
		api_card = Card.find(card_id)

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

	# catch and log error
	except Exception as ex:
		logError("API Get Card Details",ex)

		return render_template('card.html',
			title=title,

			name = "error",
		)

##################################################################################
# SIgnUP
@app.route("/signup", methods=['GET','POST'])
def signup():

	title = "MTG Deck Planner | Register"

	# get passed in username and password
	username = request.form.get('username')
	password = request.form.get('password')

	# hash password
	hashed_pw = bcrypt.hashpw(password.encode('utf8'), bcrypt.gensalt())

	try:
		# Connect to DB
		conn = sqlite3.connect('mtg.sqlite3')

		#create cursor
		cursor = conn.cursor()

		# Insert new username and hashed password
		cursor.execute("INSERT INTO USER (username, password) VALUES (?,?)", (username, hashed_pw))

		# Save (commit) the changes to DB
		conn.commit()

		# render SignUp Page

		return render_template('signup.html',
			title=title,
			username=username,
			password=password
		)
	# catch and log DB error
	except Exception as ex:
		logError("DB Insert New USER",ex)

		return render_template('signup.html',
			title=title,
			username="error",
			password="error"
		)

##################################################################################
# Login
@app.route("/login", methods=['GET','POST'])
def login():

	title = "MTG Deck Planner"

	# get passed in username and password
	username = request.form.get('username')
	password = request.form.get('password')

	try:
		# Connect to DB
		conn = sqlite3.connect('mtg.sqlite3')

		#create cursor
		cursor = conn.cursor()

		# Select password from passed username
		cursor.execute("SELECT password FROM USER WHERE username = '%s'" % username)

		# Get Password
		hashed = cursor.fetchone()

		good = ""

		# Check if nothing is returned from DB (bad username)
		if hashed is None:
			good = "bad"
		else:
			# Check if passed password matches the stored password for the passed username
			if bcrypt.checkpw(password.encode('utf8'), hashed[0]):
				# (good username and password)
				good = "valid"
			else:
				# (bad password)
				good = "bad"

		return render_template('login.html',
			title=title,
			username=username,
			good=good
		)
	# catch and log DB error
	except Exception as ex:
		logError("DB User Auth",ex)

		return render_template('login.html',
			title=title,
			username="error",
			good="error"
		)

##################################################################################
if __name__ == "__main__":
    app.run(host='0.0.0.0')