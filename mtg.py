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

# Setup Database
# `sudo -u postgres psql`
# `ALTER USER postgres PASSWORD '<db password>';`
# `\q`
# `sudo systemctl restart postgresql`

#IMPORT DB
# psql < ./DB\ Scripts/createTables.sql
# psql mtg < ./DB\ Scripts/databaseExport.sql

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
	search_name = (request.form.get('search')).strip()

	# logError("DEBUG Search Term:", search_name)

	#get colors from form
	white = request.form.get('check_white')
	blue  = request.form.get('check_blue')
	black = request.form.get('check_black')
	red   = request.form.get('check_red')
	green = request.form.get('check_green')

	all_colors = [white, blue, black, red, green]
	color_names = ["white", "blue", "black", "red", "green"]

	#get selected colors, non selected will be None, selected will be ''
	selected_colors = []
	for i in range(0, len(all_colors)):
		if all_colors[i] == '':
			selected_colors.append(color_names[i])


	#logError("DEBUG Color(s):", selected_colors)


	cmc_sign = request.form.get('cmcSign')
	cmc_value = (request.form.get('cmcValue')).strip()
	power_sign = request.form.get('powerSign')
	power_value = (request.form.get('powerValue')).strip()
	toughness_sign = request.form.get('toughnessSign')
	toughness_value = (request.form.get('toughnessValue')).strip()
	button_value = request.form.get('button')

	# Get some cards
	try:
		cards = []

		#BRETS FILTER -------------------------------------------------------------------------------


		# logError("button_value DEBUG 0",button_value)
		# logError("SearchName DEBUG 0",search_name)
		# if button_value == 'search' or (cmc_value == '' and power_value == '' and toughness_value == ''):
		# 	# logError("SearchName DEBUG 1 ",search_name)
		# 	if cmc_value == '' and power_value == '' and toughness_value == '':
		# 		# logError("SearchName DEBUG 2",search_name)
		# 		search_name = '';		
		# 	cards += Card.where(page=1).where(pageSize=40).where(name=search_name).all()
		# else:
		# 	if cmc_value != '':
		# 		if cmc_sign == 'equals':
		# 			cards += Card.where(page=1).where(pageSize=40).where(cmc=cmc_value).all()
		# 		# elif cmc_sign == 'greater':
		# 		# 	cards += Card.where(page=1).where(pageSize=40).where(cmc=cmc_value).all()
		# 		#elif cmc_sign == 'less':
		# 		#	cards += Card.where(page=1).where(pageSize=40).where(cmc<=cmc_value).all()
		# 	if power_value != '':
		# 		if power_sign == 'equals':
		# 			cards += Card.where(page=1).where(pageSize=40).where(power=power_value).all()
		# 		#elif power_sign == 'greater':
		# 		#	cards += Card.where(page=1).where(pageSize=40).where(power>=power_value).all()
		# 		#elif power_sign == 'less':
		# 		#	cards += Card.where(page=1).where(pageSize=40).where(power<=power_value).all()
		# 	if toughness_value != '':
		# 		if toughness_sign == 'equals':
		# 			cards += Card.where(page=1).where(pageSize=40).where(toughness=toughness_value).all()
		# 		#elif toughness_sign == 'greater':
		# 		#	cards += Card.where(page=1).where(pageSize=40).where(toughness>=toughness_value).all()
		# 		#elif toughness_sign == 'less':
		# 		#	cards += Card.where(page=1).where(pageSize=40).where(toughness<=toughness_value).all()


		#DANS FILTER -------------------------------------------------------------------------------
		
		#start base api call
		api_call = "cards += Card.where(page=1).where(pageSize=40)"

		# if search name is set
		search_name_value = ""
		if search_name != '' and search_name != None: 
			search_name_value = search_name
			api_call += ".where(name='"+search_name_value+"')"

		# if color is set
		selected_color = ""
		if len(selected_colors) == 1:
			selected_color = selected_colors[0]
			api_call += ".where(colors='"+selected_color+"')"

		cmc = ""
		# if cmc is set
		if cmc_value != '' and cmc_value != None:
			cmc = cmc_value
			api_call += ".where(cmc="+cmc+")"

		power = ""
		# if power is set
		if power_value != '' and power_value != None:
			power = power_value
			api_call += ".where(power="+power+")"

		toughness = ""
		# if toughness is set
		if toughness_value != '' and toughness_value != None:
			toughness = toughness_value
			api_call += ".where(toughness="+toughness+")"

		#finish api call
		api_call += ".all()"


		# logError("DEBUG API Call:", api_call)
		exec(api_call)

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
			search_name=search_name_value,
			selected_color=selected_color,
			cmc=cmc,
			power=power,
			toughness=toughness,
			logged_in=logged_in
		)

	#catch and log error
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

			# get POST data
			deck_id   = request.form.get('deck_id')
			card_name = request.form.get('card_name')
			api_id    = request.form.get('api_id')
			image_url = request.form.get('image_url')
			card_type = request.form.get('type')

			conn = dbConnect()

			cursor = conn.cursor()

			# see how many of this card are currently in the selected deck (cannot have more than 4)
			cursor.execute("SELECT COUNT(card_name) FROM deck_card WHERE deck_id = %s AND card_name = %s", (deck_id, card_name,))
			count_db = cursor.fetchall()

			count = count_db[0][0]

			#logError("Count DEBUG",(str(deck_id)+" "+str(api_id)+" "+str(count)))

			# as long as there are less than 4 cards in that deck OR it is a Basic Land- add it
			if int(count) < 4 or "Basic Land" in card_type:
				# Insert new username and hashed password
				cursor.execute("INSERT INTO deck_card (deck_id, api_id, card_name, image_url) VALUES (%s,%s,%s,%s)", (deck_id, api_id, card_name, image_url))
				# Save (commit) the changes to DB
				conn.commit()

				return json.dumps({'status':'OK'});
			else:
				# return TOO_MANY response
				return json.dumps({'status':'TOO_MANY'});

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
				# Select deck_card data
				cursor.execute("SELECT api_id, card_name, image_url, card_id FROM deck_card WHERE deck_id = '%s' ORDER BY card_name"% _id)
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
# Explore decks Page

def getRating(deck_id):
	try:
		conn = dbConnect()
		cursor = conn.cursor()

		# get deck rating
		cursor.execute("SELECT score FROM rating WHERE deck_id = %s", (deck_id,))

		scores = cursor.fetchall()

		rating = 0.0
		r = 0.0
		for score in scores:
			r += float(score[0])
			rating = r/len(scores)	

		return round(rating,1)

	except Exception as ex:
		logError("DB Deck Rating",ex)
		return "error"

@app.route("/explore_decks", methods=['GET','POST'])
def explore_decks():
	# check if user is logged in
	logged_in = 'not'
	if 'username' in session:
		logged_in = session['username']
		user_id = session['user_id']

	title = "MTG Deck Planner | Explore Decks"


	# see if add deck is empty - render normal page
	try:
		# Connect to DB
		conn = dbConnect()

		# Get / List all decks of user
		cursor = conn.cursor()

		# Get all decks with with 60 or more cards from all users
		cursor.execute("SELECT deck_id, count(*) FROM deck_card GROUP BY deck_id HAVING count(*) > 59")

		decks = cursor.fetchall()

		# logError("debug big decks!",decks)

		decks_to_show = []
		for deck in decks:

			deck_id = deck[0]
			deck_count = deck[1]

			#get deck name and username it belongs to
			cursor.execute("SELECT d.name, u.username FROM deck d JOIN users u ON u.user_id = d.user_id WHERE d.deck_id = %s", (deck_id,))

			deck_names = cursor.fetchall()
			# logError("debug deck names!",deck_names)
			deck_name = deck_names[0][0]
			user_name = deck_names[0][1]

			#get deck rating
			rating = getRating(deck_id)


			#logError("average rating!",rating)
			decks_to_show.append([deck_id, deck_count, deck_name, user_name, rating])


		sorted_decks = sorted(decks_to_show, key=lambda x: x[4], reverse=True)

		return render_template('explore_decks.html',
			title=title,
			#username=session['user_id'],
			logged_in=logged_in,
			decks_to_show=sorted_decks
		)
	except Exception as ex:
		logError("DB Get Complete Decks",ex)

		return render_template('explore_decks.html',
			title=title,
			#username=session['user_id'],
			logged_in=logged_in,
			decks_to_show="error"
		)


#########################################################################################################################
# View a User's Deck Page
@app.route("/view_deck/<string:deck_id>", methods=['GET','POST'])
def view_deck(deck_id):
	# check if user is logged in
	logged_in = 'not'
	if 'username' in session:
		logged_in = session['username']
		user_id = session['user_id']

	title = "MTG Deck Planner | View Deck"


	# see if add deck is empty - render normal page
	try:
		# Connect to DB
		conn = dbConnect()

		# Get / List all decks of user
		cursor = conn.cursor()

		# Get deck name and username 
		cursor.execute("SELECT d.name, u.username FROM deck d JOIN users u ON u.user_id = d.user_id WHERE d.deck_id = %s", (deck_id,))

		deck = cursor.fetchall()

		#get cards in this deck
		cursor.execute("SELECT * FROM deck_card WHERE deck_id = %s", (deck_id,))

		deck_cards = cursor.fetchall()

		#get deck rating
		rating = getRating(deck_id)

	
		return render_template('view_deck.html',
			title=title,
			#username=session['user_id'],
			logged_in=logged_in,
			deck=deck,
			deck_cards=deck_cards,
			rating=rating,
			deck_id=deck_id
		)
	except Exception as ex:
		logError("DB Get Complete Decks",ex)

		return render_template('view_deck.html',
			title=title,
			#username=session['user_id'],
			logged_in=logged_in,
			deck="error"
		)


#########################################################################################################################
# rate_deck
@app.route("/rate_deck", methods=['GET','POST'])
def rate_deck():
	# get rate deck form value
	deck_id = request.form.get('deck_id')
	score = request.form.get('score')
	# rate deck INSERT
	try:
		# Connect to DB
		conn = dbConnect()

		#create cursor
		cursor = conn.cursor()

		# Insert Deck
		cursor.execute("INSERT INTO rating (deck_id, score) VALUES (%s,%s)", (deck_id, score,))

		# commint insert
		conn.commit()

		# close cursor
		cursor.close()

		return json.dumps({'status':'OK'});

	# catch and log DB error
	except Exception as ex:
		logError("DB Rate Deck",ex)
		return json.dumps({'status':'BAD'});



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
		cursor.execute("INSERT INTO deck (name, user_id) VALUES (%s,%s)", (add_deck_name, session['user_id'],))

		# commint insert
		conn.commit()

		# close cursor
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
		cursor.execute("DELETE FROM deck_card WHERE deck_id = %s;", (deck_id,))
		cursor.execute("DELETE FROM deck WHERE deck_id = %s;", (deck_id,))

		conn.commit()

		cursor.close()

		return json.dumps({'status':'OK'});

	# catch and log DB error
	except Exception as ex:
		logError("DB remove_deck",ex)
		return json.dumps({'status':'BAD'});


# remove_deck
@app.route("/remove_card", methods=['GET','POST'])
def remove_card():
	# get add deck form value
	card_id = request.form.get('card_id')
	# create new deck INSERT
	try:
		# Connect to DB
		conn = dbConnect()

		#create cursor
		cursor = conn.cursor()

		# delete Deck
		cursor.execute("DELETE FROM deck_card WHERE card_id = %s;", (card_id,))

		conn.commit()

		cursor.close()

		return json.dumps({'status':'OK'});

	# catch and log DB error
	except Exception as ex:
		logError("DB remove_deck",ex)
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

	#logError("DEBUG pass hash 1",hashed_pw)
	#logError("DEBUG pass hash 2",hashed_pw.decode("utf-8") )

	hashed_pw_decode = hashed_pw.decode("utf-8") # need to decode this to store in Postgres properly

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
			cursor2.execute("INSERT INTO users (username, password) VALUES (%s,%s)", (username, hashed_pw_decode))

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

		#logError("users pass/id debug",type(hashed))
		#logError("users pass/id debug",hashed)

		# Check if nothing is returned from DB (bad username)
		if not hashed:
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
