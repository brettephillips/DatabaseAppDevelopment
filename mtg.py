from flask import Flask
from flask import render_template

# Define template and static folders for flask app
import os
project_root = os.path.dirname(__file__)
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

	# Get some cards
	cards = Card.where(page=1).where(pageSize=10).where(name="Gorilla").all()

	# Set card name list to sent to template
	c_names = []

	# # Put card names in list
	for c in cards:
		c_names.append([c.name, c.image_url])

	return render_template('home.html',
		title=h_title,
		cards=c_names
		)

	#return(h_title)

##################################################################################
if __name__ == "__main__":
    app.run(host='0.0.0.0')