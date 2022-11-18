'''
GOALS
GUI interface
	allows to pop up multiple windows to view/edit multiple tables
CLI interface
	simple curses shell that displays tables and lets you insert data 
SQLite & PostgreSQL combatibility (database stuff)
	option to save multiple sqlite files for different campaigns/groups
map prototype system
quest/event/interaction planning
character stat & progression tracking
generate random characters, enemies, and encounters



CHARACTER DATA JSON/DICT FORMAT (OUTDATED)

{
	"name": str,
	"age": int,
	"skin": str,
	"weight": int,
	"height": int,
	"hair": str,
	"species": str,
	"class": str,
	"level": int,
	"max_hp": int,
	"initiative": int,
	"speed": int,
	"armor_class": int,
	"gold": int,
	"background": str,
	"alignment": str,
	"stats": dict,
	"equipment": list of tuples,
	"inventory": list of tuples,
	"coins" dict
	"proficiencies": list,
	"ideals": list of tuples,
	"bonds": list,
	"flaws": list,
	"languages": list,
	"special_abilities": list,
	"spells": dict
}

EQUIPMENT TUPLE FORMAT
(
	name, 
	type, 
	weight, 
	ac, 
	enchantments, 
	condition, 
	rarity, 
	description
)

INVENTORY TUPLE FORMAT
(
	name
	weight
	rarity
	description
	enchantments
)

TRAITS TUPLE FORMAT
(

)

STATS JSON/DICT FORMAT

{
	"strength": {
		"value": int,
		"modifier": int
	},
	"dexterity": {
		"value": int,
		"modifier": int
	},
	"constitution": {
		"value": int,
		"modifier": int
	},
	"intelligence": {
		"value": int,
		"modifier": int
	},
	"wisdom": {
		"value": int,
		"modifier": int
	},
	"charisma": {
		"value": int,
		"modifier": int
	},
	"proficiency_bonus": int,
	"character_id" int
}

WEAPON JSON/DICT FORMAT

{
	"name": str,
	"type": str,
	"dice": int,
	"enchantments": list,
	"condition": str,
	"rarity": str,
	"description": str
}

https://roll20.net/compendium/dnd5e/Weapons#content

'''