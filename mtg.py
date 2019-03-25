# Import needed Flask packages
from flask import Flask
from flask import render_template
from flask import request, session, redirect, url_for

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

# set sesssion key
app.secret_key = b'_5#y2L"F4#gg88opQ8z\n\xec]/'
app.config['SESSION_TYPE'] = 'filesystem'


##################################################################################
# Card Sarch Page
@app.route("/", methods=['GET','POST'])
def home():

	# check if user is logged in
	logged_in = 'not'
	if 'username' in session:
		logged_in = session['username']

	return render_template('home.html',
		title="MTG Deck Planner",
		bad_login="no",
		logged_in=logged_in
	)


##################################################################################
# Card Sarch Page
@app.route("/search", methods=['GET','POST'])
def search():

	# check if user is logged in
	logged_in = 'not'
	if 'username' in session:
		logged_in = session['username']

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
			cards=c_names,
			logged_in=logged_in
		)

	# catch and log error
	except Exception as ex:
		logError("API Get Card Search",ex)

		return render_template('search.html',
			title=title,
			cards="error",
			logged_in=logged_in
		)
##################################################################################
# Card Details Page
@app.route("/card/<string:card_id>", methods=['GET','POST'])
def card(card_id):

	# check if user is logged in
	logged_in = 'not'
	if 'username' in session:
		logged_in = session['username']
	

	title = "MTG Deck Planner | Card Details"

	# card card details from API based on multiverse ID
	try:
		api_card = Card.find(card_id)

		return render_template('card.html',
			title=title,
			logged_in=logged_in,
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
			logged_in=logged_in
		)


##################################################################################
# Mydecks Page
@app.route("/mydecks", methods=['GET','POST'])
def mydecks():

	# check if user is logged in
	logged_in = 'not'
	if 'username' in session:
		logged_in = session['username']

	title = "MTG Deck Planner | My Saved Decks"

	return render_template('mydecks.html',
		title=title,
		username=session['username'],
		logged_in=logged_in
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

	# check if user is logged in
	logged_in = 'not'
	if 'username' in session:
		logged_in = session['username']

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

		# Check if nothing is returned from DB (bad username)
		if hashed is None:
			return render_template('home.html',
				title="MTG Deck Planner",
				bad_login="yes",
				logged_in=logged_in
			)
		else:
			# Check if passed password matches the stored password for the passed username
			if bcrypt.checkpw(password.encode('utf8'), hashed[0]):
				# (good username and password)				
				#set session name
				session['username'] = username

				return redirect(url_for('mydecks'))

			else:
				# (bad password)
				return render_template('home.html',
					title="MTG Deck Planner",
					bad_login="yes",
					logged_in=logged_in
				)

	# catch and log DB error
	except Exception as ex:
		logError("DB User Auth",ex)

		return render_template('login.html',
			title=title,
			username="error",
			logged_in=logged_in
		)

##################################################################################
# Logout
@app.route("/logout", methods=['GET','POST'])
def logout():
	session.pop('username')
	return redirect(url_for('home'))

##################################################################################
if __name__ == "__main__":
    app.run(host='0.0.0.0')