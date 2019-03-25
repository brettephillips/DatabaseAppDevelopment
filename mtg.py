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





#########################################################################################################################
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

	# get add deck form value
	add_deck_name = request.form.get('add_deck_name')

	# see if add deck is empty - render normal page
	if add_deck_name is None:
		try:
			# Connect to DB
			conn = sqlite3.connect('mtg.sqlite3')

			# Get / List all decks of user
			cursor = conn.cursor()

			# Select user_id of logged in username
			cursor.execute("SELECT deck_id, name FROM DECK WHERE user_id = '%s' ORDER BY deck_id"% session['user_id'])

			decks = cursor.fetchall()

			#logError("deck debug1",decks)	

			deck_ids = []
			deck_names = []
			num_decks = 0
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
					conn = sqlite3.connect('mtg.sqlite3')
					cursor = conn.cursor()
					# Select user_id of logged in username
					cursor.execute("SELECT api_id FROM DECK_CARD WHERE deck_id = '%s'"% _id)
					cards = cursor.fetchall()	

					deck_cards.append(cards)


		
			return render_template('mydecks.html',
				title=title,
				username=session['user_id'],
				logged_in=logged_in,
				num_decks=num_decks,
				deck_names=deck_names,
				deck_cards=deck_cards
			)
		except Exception as ex:
			logError("DB Get User Decks",ex)

			return render_template('mydecks.html',
				title=title,
				username=session['user_id'],
				logged_in=logged_in,
				decks="error"
			)
	else:
		# create new deck INSERT
		try:
			# Connect to DB
			conn = sqlite3.connect('mtg.sqlite3')

			#create cursor
			cursor = conn.cursor()

			# Insert Deck
			cursor.execute("INSERT INTO DECK (name, user_id) VALUES (?,?)", (add_deck_name, user_id))

			conn.commit()

			return redirect(url_for('mydecks'))

		# catch and log DB error
		except Exception as ex:
			logError("DB Insert/Delete Deck",ex)

			return render_template('mydecks.html',
				title=title,
				username=session['username'],
				logged_in=logged_in, 
				error='error'
			)






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
		conn = sqlite3.connect('mtg.sqlite3')

		#create cursor
		cursor = conn.cursor()

		# Select password from passed username
		cursor.execute("SELECT username FROM USER")

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
			cursor2.execute("INSERT INTO USER (username, password) VALUES (?,?)", (username, hashed_pw))

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
		conn = sqlite3.connect('mtg.sqlite3')

		#create cursor
		cursor = conn.cursor()

		# Select password from passed username
		cursor.execute("SELECT password, user_id FROM USER WHERE username = '%s'" % username)

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
			if bcrypt.checkpw(password.encode('utf8'), hashed[0][0]):
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

		return render_template('login.html',
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