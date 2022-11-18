import sqlite3
from contextlib import closing

class Character:
	def __init__(self, db, character_data):
		self.db = db
		self.name = character_data["name"]
		self.age = character_data["age"]
		self.skin = character_data["skin"]
		self.weight = character_data["weight"]
		self.height = character_data["height"]
		self.hair = character_data["hair"]
		self.level = character_data["level"]
		self.player_name = character_data["player_name"]
		self.species = character_data["species"]
		self.stats = character_data["stats"]
		self.equipment = character_data["equipment"]
		self.inventory = character_data["inventory"]
		self.coins = character_data["coins"]
		self.proficiencies = character_data["proficiencies"]
		self.ideals = character_data["ideals"]
		self.bonds = character_data["bonds"]
		self.max_hp = character_data["max_hp"]
		self.speed = character_data["speed"]
		self.flaws = character_data["flaws"]
		self.traits = character_data["traits"]
		self.languages = character_data["languages"]
		self.spells = character_data["spells"]

	def new_character(self):
		with sqlite3.connect(self.db) as c:
			with closing(c.cursor()) as sql:
				char = sql.execute(f'''
					INSERT INTO character (
						name,age,skin,weight,height,hair,species,level, player_name,
						max_hp, speed, stats_id, coins_id
					) VALUES (
						{self.name}, {self.age}, {self.skin}, {self.weight}, {self.height},
						{self.hair}, {self.species}, {self.level}, {self.player_name},
						NULL, NULL 
					) RETURNING *;
				''')
				stats_id = sql.execute(f'''
					INSERT INTO stats (
						strength, dexterity, constitution, intelligence, wisdom, charisma,
						strength_mod, dexterity_mod, constitution_mod, intelligence_mod, 
						wisdom_mod, charisma_mod,character_id
					)  VALUES (
						{self.stats["strength"]["value"]},{self.stats["dexterity"]["value"]},
						{self.stats["constitution"]["value"]},{self.stats["intelligence"]["value"]},
						{self.stats["wisdom"]["value"]},{self.stats["charisma"]["value"]},
						{self.stats["strength_mod"]["modifier"]},{self.stats["dexterity"]["modifier"]},
						{self.stats["constitution"]["modifier"]}, {self.stats["intelligence"]["modifier"]},
						{self.stats["wisdom"]["modifier"]},{self.stats["charisma"]["modifier"]},
						{self.stats["proficiency_bonus"]}, {char.fetchone()[0]}
					) RETURNING *;
				''')
				for item in self.equipment:
					sql.execute(f'''
						INSERT INTO equipment (
							name, weight, ac, type, condition, description, 
							stealth, rarity, enchantments, character_id
						) VALUES (
							{item[0]},{item[1]},{item[2]},{item[3]},{item[4]},
							{item[5]},{item[6]},{item[7]},{item[8]}, {char}
						) RETURNING *;
					''')
				for item in self.inventory:
					sql.execute(f''' 
						INSERT INTO inventory (
							name, weight, rarity, description, enchantments, character_id
						) VALUES (
							{item[0]},{item[1]},{item[2]},{item[3]},{item[4]}, {char}
						) RETURNING *;
					''')
				sql.execute(f'''
					INSERT INTO inventory (
						bronze, silver, gold, platinum, character_id
					) VALUES (
						{self.coins[0]},{self.coins[1]},{self.coins[2]},{self.coins[3]}, {char}
					) RETURNING *;
				''')
				# LOOP THESE
				for proficiency in self.proficiencies:
					sql.execute(f'''
						INSERT INTO proficiencies(name, character_id)
						VALUES ({proficiency}, {char});
					''')
				for ideal in self.ideals:	
					sql.execute(f'''
						INSERT INTO ideals(name, character_id)
						VALUES ({ideal}, {char});
					''')
				for flaw in self.flaws:
					sql.execute(f'''
						INSERT INTO flaws(name, character_id)
						VALUES ({flaw}, {char});
					''')
				for language in self.languages:
					sql.execute(f'''
						INSERT INTO languages(name, character_id)
						VALUES ({language}, {char});
					''')
				sql.execute(f'''
					INSERT INTO traits(
						name,
						description,
						benefit,
						drawback,
						special,
						character_id
					)
					VALUES (
						{self.traits[0]},
						{self.traits[1]},
						{self.traits[2]},
						{self.traits[3]},
						{self.traits[4]},
						{char}
					);
				''')
class Quest:
	def __init__(self):
		pass

class Interaction:
	def __init__(self):
		pass

class Event:
	def __init__(self):
		pass

class Item:
	def __init__(self):
		pass

class Settlement:
	def __init__(self):
		pass

class Building:
	def __init__(self):
		pass

class Faction:
	def __init__(self):
		pass

class Coin:
	def __init__(self):
		pass

class Weapon(Item):
	def __init__(self):
		pass

class Equipment(Item):
	def __init__(self):
		pass

class Food(Item):
	def __init__(self):
		pass

class Liquid(Item):
	def __init__(self):
		pass

class Container(Item):
	def __init__(self):
		pass
