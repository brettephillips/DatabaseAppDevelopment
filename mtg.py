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

# Import error logging model
from errorLog import logError

#Import Password Hashing
import bcrypt


import json

##################################################################################
app = Flask(__name__, template_folder=template_path, static_folder=static_path)

# set sesssion key
app.secret_key = b'_5#y2L"F4#gg88opQ8z\n\xec]/'
app.config['SESSION_TYPE'] = 'filesystem'






#########################################################################################################################
#########################################################################################################################
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


#########################################################################################################################

# Import Database


# `sudo -u postgres psql`
# `ALTER USER postgres PASSWORD 'student';`
# `\q`
# `sudo systemctl restart postgresql`

#IMPORT DB
# psql < ./DB\ Scripts/createTables.sql

#DUMP DB
# pg_dump mtg > ./DB\ Scripts/databaseExport.sql


##### import sqlite3 - OLD
import psycopg2
from config import config

# Postgres DB Connection Method
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



#########################################################################################################################
# Card Sarch Page
@app.route("/search", methods=['GET','POST'])
def search():

	# check if user is logged incards
	logged_in = 'not'
	if 'username' in session:
		logged_in = session['username']

	# Set home title
	title = "MTG Deck Planner | Card Search"

	# Search parameters:
	#search_name = "city of ass"
	search_name = request.form.get('search')
	cmc_sign = request.form.get('cmcSign')
	cmc_value = request.form.get('cmcValue')
	power_sign = request.form.get('powerSign')
	power_value = request.form.get('powerValue')
	toughness_sign = request.form.get('toughnessSign')
	toughness_value = request.form.get('toughnessValue')
	button_value = request.form.get('button')

	# Get some cards
	try:
		cards = []
		if button_value == 'search' or (cmc_value == '' and power_value == '' and toughness_value == ''):
			if cmc_value == '' and power_value == '' and toughness_value == '':
				search_name = '';		
			cards += Card.where(page=1).where(pageSize=40).where(name=search_name).all()
		else:
			if cmc_value != '':
				if cmc_sign == 'equals':
					cards += Card.where(page=1).where(pageSize=40).where(cmc=cmc_value).all()
				#elif cmc_sign == 'greater':
				#	cards += Card.where(page=1).where(pageSize=40).where(cmc>=cmc_value).all()
				#elif cmc_sign == 'less':
				#	cards += Card.where(page=1).where(pageSize=40).where(cmc<=cmc_value).all()
			if power_value != '':
				if power_sign == 'equals':
					cards += Card.where(page=1).where(pageSize=40).where(power=power_value).all()
				#elif power_sign == 'greater':
				#	cards += Card.where(page=1).where(pageSize=40).where(power>=power_value).all()
				#elif power_sign == 'less':
				#	cards += Card.where(page=1).where(pageSize=40).where(power<=power_value).all()
			if toughness_value != '':
				if toughness_sign == 'equals':
					cards += Card.where(page=1).where(pageSize=40).where(toughness=toughness_value).all()
				#elif toughness_sign == 'greater':
				#	cards += Card.where(page=1).where(pageSize=40).where(toughness>=toughness_value).all()
				#elif toughness_sign == 'less':
				#	cards += Card.where(page=1).where(pageSize=40).where(toughness<=toughness_value).all()

		# Set card name list to sent to template
		c_names = []

		# Put card names in list
		for c in cards:
			if [c.name, c.image_url, c.multiverse_id] in c_names:
				continue
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





#########################################################################################################################
# Card Details Page
@app.route("/card/<string:card_id>", methods=['GET','POST'])
def card(card_id):

	decks = []
	added = "no"

	# check if user is logged in
	logged_in = 'not'
	if 'username' in session:
		logged_in = session['username']

		#get user's deck lists
		try:
			conn = dbConnect()
			# Get / List all decks of user
			cursor = conn.cursor()

			# Select user_id of logged in username
			cursor.execute("SELECT deck_id, name FROM deck WHERE user_id = '%s' ORDER BY deck_id"% session['user_id'])

			decks = cursor.fetchall()

		except Exception as ex:
			logError("DB Get User's Decks",ex)
	

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
			set_name = api_card.set_name,
			decks=decks
		)

	# catch and log error
	except Exception as ex:
		logError("API Get Card Details",ex)

		return render_template('card.html',
			title=title,
			name = "error",
			logged_in=logged_in
		)


#########################################################################################################################
# Mydecks Page
@app.route("/add_to_deck", methods=['GET','POST'])
def add_to_deck():
	try:
		if request.method == "POST":
			deck_id   = request.form.get('deck_id')
			card_name = request.form.get('card_name')
			api_id    = request.form.get('api_id')
			image_url = request.form.get('image_url')

			conn = dbConnect()

			cursor = conn.cursor()

			# Insert new username and hashed password
			cursor.execute("INSERT INTO deck_card (deck_id, api_id, card_name, image_url) VALUES (%s,%s,%s,%s)", (deck_id, api_id, card_name, image_url))
			# Save (commit) the changes to DB
			conn.commit()

			return json.dumps({'status':'OK'});

	except Exception as ex:
		logError("DB Add Card to Deck",ex)
		return json.dumps({'status':'BAD'});



#########################################################################################################################
# Mydecks Page
@app.route("/mydecks", methods=['GET','POST'])
def mydecks():

	# check if user is logged in
	logged_in = 'not'
	if 'username' in session:
		logged_in = session['username']
		user_id = session['user_id']

	title = "MTG Deck Planner | My Saved Decks"



	# see if add deck is empty - render normal page
	try:
		# Connect to DB
		conn = dbConnect()

		# Get / List all decks of user
		cursor = conn.cursor()

		# Select user_id of logged in username
		cursor.execute("SELECT deck_id, name FROM deck WHERE user_id = '%s' ORDER BY deck_id"% session['user_id'])

		decks = cursor.fetchall()

		#logError("deck debug1",decks)	

		# List containers
		deck_ids = []
		deck_names = []
		deck_cards = []

		# parse / get deck ids and deck names
		if decks is None:
			deck_ids = "none"
			deck_names = "none"
			num_decks = 0
		else:
			num_decks = len(decks)

			for deck in decks:
				deck_ids.append(deck[0])
				deck_names.append(deck[1])

				#logError("deck debug2",deck_ids)		
				#logError("deck debug3",deck_names)	

			# get the cards in each deck
			for _id in deck_ids:
				conn = dbConnect()
				cursor = conn.cursor()
				# Select user_id of logged in username
				cursor.execute("SELECT api_id, card_name, image_url FROM deck_card WHERE deck_id = '%s'"% _id)
				cards = cursor.fetchall()	

				deck_cards.append(cards)

	
		return render_template('mydecks.html',
			title=title,
			username=session['user_id'],
			logged_in=logged_in,
			deck_names=deck_names,
			deck_cards=deck_cards,
			deck_ids=deck_ids
		)
	except Exception as ex:
		logError("DB Get User Decks",ex)

		return render_template('mydecks.html',
			title=title,
			username=session['user_id'],
			logged_in=logged_in,
			decks="error"
		)



#########################################################################################################################
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
		cursor.execute("INSERT INTO deck (name, user_id) VALUES (%s,%s)", (add_deck_name, session['user_id']))

		conn.commit()

		cursor.close()

		return json.dumps({'status':'OK'});

	# catch and log DB error
	except Exception as ex:
		logError("DB Create Deck",ex)
		return json.dumps({'status':'BAD'});

#########################################################################################################################
# remove_deck
@app.route("/remove_deck", methods=['GET','POST'])
def remove_deck():
	# get add deck form value
	deck_id = request.form.get('deck_id')
	# create new deck INSERT
	try:
		# Connect to DB
		conn = dbConnect()

		#create cursor
		cursor = conn.cursor()

		# delete Deck
		cursor.execute("DELETE FROM deck_card WHERE deck_id = %s;", (deck_id))
		cursor.execute("DELETE FROM deck WHERE deck_id = %s;", (deck_id))

		conn.commit()

		cursor.close()

		return json.dumps({'status':'OK'});

	# catch and log DB error
	except Exception as ex:
		logError("DB Create Deck",ex)
		return json.dumps({'status':'BAD'});

#########################################################################################################################
# SIgnUP
@app.route("/signup", methods=['GET','POST'])
def signup():

	# check if user is logged in
	logged_in = 'not'
	if 'username' in session:
		logged_in = session['username']

	# get passed in username and password
	username = request.form.get('username')
	password = request.form.get('password')

	# hash password
	hashed_pw = bcrypt.hashpw(password.encode('utf8'), bcrypt.gensalt())

	try:
		# Connect to DB
		conn = dbConnect()

		#create cursor
		cursor = conn.cursor()

		# Select password from passed username
		cursor.execute("SELECT username FROM users")

		# Get user tuples from DB
		db_users = cursor.fetchall()
		# Get just user names to a list
		users = []
		for row in db_users:
			users.append(row[0])

		# cehck if username exists
		if username in users:
			return render_template('home.html',
				title="MTG Deck Planner",
				bad_login="no",
				registered="Username already exists",
				logged_in=logged_in
			)
		else:
			cursor2 = conn.cursor()

			# Insert new username and hashed password
			cursor2.execute("INSERT INTO users (username, password) VALUES (%s,%s)", (username, hashed_pw))

			# Save (commit) the changes to DB
			conn.commit()

			# render SignUp Page

			return render_template('home.html',
				title="MTG Deck Planner",
				bad_login="no",
				registered="yes",
				logged_in=logged_in
			)
	# catch and log DB error
	except Exception as ex:
		logError("DB Insert New USER",ex)

		return render_template('home.html',
			title="MTG Deck Planner",
			bad_login="no",
			registered="There was an error registering, try again",
			logged_in=logged_in
		)






#########################################################################################################################
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
		#conn = sqlite3.connect('mtg.sqlite3')
		conn = dbConnect()


		#create cursor
		cursor = conn.cursor()

		# Select password from passed username
		cursor.execute("SELECT password, user_id FROM users WHERE username = '%s'" % username)

		# Get Password
		hashed = cursor.fetchall()

		# logError("users pass/id debug",type(hashed[0][0]))
		# logError("users pass/id debug",hashed[0][1])

		# Check if nothing is returned from DB (bad username)
		if hashed is None:
			return render_template('home.html',
				title="MTG Deck Planner",
				bad_login="yes",
				logged_in=logged_in
			)
		else:
			# Check if passed password matches the stored password for the passed username
			if bcrypt.checkpw(password.encode('utf8'), hashed[0][0].encode('utf8')):
				# (good username and password)				
				#set session data: username and user_id
				session['username'] = username
				session['user_id'] = hashed[0][1]

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

		return render_template('home.html',
			title=title,
			username="error",
			logged_in=logged_in
		)






#########################################################################################################################
# Logout
@app.route("/logout", methods=['GET','POST'])
def logout():
	session.pop('username')
	return redirect(url_for('home'))






#########################################################################################################################
#########################################################################################################################
if __name__ == "__main__":
    app.run(host='0.0.0.0')
