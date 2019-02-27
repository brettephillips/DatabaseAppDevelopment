class Card:
	def __init__(self, 
				name,
				multiverse_id,
				layout,
				# names,
				mana_cost,
				cmc,
				colors,
				color_identity,
				type,
				supertypes,
				subtypes,
				rarity,
				text,
				# flavor,
				# artist,
				# number,
				power,
				toughness,
				# loyalty,
				# variations,
				# watermark,
				# border,
				# timeshifted,
				# hand,
				life,
				# reserved,
				# release_date,
				# starter,
				# rulings,
				# foreign_names,
				# printings,
				# original_text,
				# original_type,
				legalities,
				# source,
				image_url,
				set,
				set_name
				# id
				):

		self.name = name
		self.multiverse_id = multiverse_id
		self.layout = layout
		# self.names = names
		self.mana_cost = mana_cost
		self.cmc = cmc
		self.colors = colors
		self.color_identity = color_identity
		self.type = type
		self.supertypes = supertypes
		self.subtypes = subtypes
		self.rarity = rarity
		self.text = text
		# self.flavor = flavor
		# self.artist = artist
		# self.number = number
		self.power = power
		self.toughness = toughness
		# self.loyalty = loyalty
		# self.variations = variations
		# self.watermark = watermark
		# self.border = border
		# self.timeshifted = timeshifted
		# self.hand = hand
		self.life = life
		# self.reserved = reserved
		# self.release_date = release_date
		# self.starter = starter
		# self.rulings = rulings
		# self.foreign_names = foreign_names
		# self.printings = printings
		# self.original_text = original_text
		# self.original_type = original_type
		self.legalities = legalities
		# self.source = source
		self.image_url = image_url
		self.set = set
		self.set_name = set_name
		# self.id = id


