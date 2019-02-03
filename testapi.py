# cd "C:\Users\deden\RIT-GDrive\_DataBase Applications\project"
# cd "E:\Dan's Folder\RIT_Fall_2018\_DataBase Applications\project"

from mtgsdk import Card
from mtgsdk import Set
from mtgsdk import Type
from mtgsdk import Supertype
from mtgsdk import Subtype
from mtgsdk import Changelog

# card = Card.find(386616)

# print(card.name)
# print(card.layout)
# print(card.life)
# print(card.cmc)
# print(card.colors)
# print(card.types)
# print(card.supertypes)
# print(card.subtypes)
# print(card.rarity)
# print(card.set_name)
# print(card.text)
# print(card.power)
# print(card.toughness)
# print(card.loyalty)
# print(card.legalities)
# print(card.image_url)



#cards = Card.where(language="English").where(name='Pacifism').all()
# Card.where(page=5).where(pageSize=1000).all()

for i in range(1,7):

	cards = Card.where(page=i).where(pageSize=10).where(name="Gorilla").all()

	c = 0
	for card in cards:
		if str(card.image_url) != "None":
			print(card.name, card.image_url)
			c+=1


	print("")
	print(c)