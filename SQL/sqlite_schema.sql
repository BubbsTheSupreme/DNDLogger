CREATE TABLE IF NOT EXISTS "character"(
	"id" INTEGER PRIMARY KEY,
	"name" TEXT, 
	"age" INTEGER, 
	"skin" TEXT, 
	"weight" INTEGER, 
	"height" INTEGER,
	"hair" TEXT,
	"species" TEXT,
	"max_hp" INTEGER,
	"speed" INTEGER,
	"level" INTEGER,
	"player_name" TEXT,
	"stats_id" INTEGER, 
	"coins_id" INTEGER, 
	"proficiencies_id" INTEGER,
	"ideals_id" INTEGER,
	"bonds_id" INTEGER,
	"flaws_id" INTEGER,
	"traits_id" INTEGER,
	"languages_id" INTEGER,			
	FOREIGN KEY(stats_id) REFERENCES stats (id),
	FOREIGN KEY(coins_id) REFERENCES coins (id),
	FOREIGN KEY(proficiencies_id) REFERENCES proficiencies (id),
	FOREIGN KEY(ideals_id) REFERENCES ideals (id),
	FOREIGN KEY(bonds_id) REFERENCES bonds (id),
	FOREIGN KEY(flaws_id) REFERENCES flaws (id),
	FOREIGN KEY(traits_id) REFERENCES traits (id),
	FOREIGN KEY(languages_id) REFERENCES languages (id)
);

CREATE TABLE IF NOT EXISTS "stats" (
	"id" INTEGER PRIMARY KEY,
	"strength" INTEGER,
	"dexterity" INTEGER,
	"constitution" INTEGER,
	"intelligence" INTEGER,
	"wisdom" INTEGER,
	"charisma" INTEGER,
	"strength_mod" INTEGER,
	"dexterity_mod" INTEGER,
	"constitution_mod" INTEGER,
	"intelligence_mod" INTEGER,
	"wisdom_mod" INTEGER,
	"charisma_mod" INTEGER,
	"proficiency_bonus" INTEGER,
	"character_id" INTEGER,
	FOREIGN KEY(character_id) REFERENCES character(id)
);

CREATE TABLE IF NOT EXISTS "coins" (
	"id" INTEGER PRIMARY KEY,
	"copper" INTEGER,
	"silver" INTEGER,
	"gold" INTEGER,
	"platinum" INTEGER,
	"character_id" INTEGER, 
	FOREIGN KEY(character_id) REFERENCES character(id)
);

CREATE TABLE IF NOT EXISTS "proficiencies" ( 
	"id" INTEGER PRIMARY KEY,
	"name" TEXT
);

CREATE TABLE IF NOT EXISTS "ideals" (
	"id" INTEGER PRIMARY KEY,
	"description" TEXT
);

CREATE TABLE IF NOT EXISTS "bonds" (
	"id" INTEGER PRIMARY KEY,
	"description" TEXT
);

CREATE TABLE IF NOT EXISTS "flaws" (
	"id" INTEGER PRIMARY KEY,
	"description" TEXT
);

CREATE TABLE IF NOT EXISTS "traits" (
	"id" INTEGER PRIMARY KEY,
	"name" TEXT,
	"description" TEXT,
	"benefit" TEXT,
	"drawback" TEXT
);

CREATE TABLE IF NOT EXISTS "languages" (
	"id" INTEGER PRIMARY KEY,
	"name" TEXT
);

CREATE TABLE IF NOT EXISTS "item" (
	"id" INTEGER PRIMARY KEY,
	"name" TEXT,
	"weight" TEXT,
	"rarity" TEXT,
	"type" TEXT,
	"effect" TEXT,
	"description" TEXT,
	"enchantments" INTEGER,
	"character_id" INTEGER,
	FOREIGN KEY(enchantments) REFERENCES enchantment(id)
);

CREATE TABLE IF NOT EXISTS "enchantment" (
	"id" INTEGER PRIMARY KEY,
	"name" TEXT,
	"effect" TEXT
);

CREATE TABLE IF NOT EXISTS "equipment" (
	"id" INTEGER PRIMARY KEY,
	"name" TEXT,
	"weight" TEXT,
	"ac" INTEGER,
	"type" TEXT,
	"condition" TEXT,
	"description" TEXT,
	"rarity" TEXT,
	"enchantments" INTEGER,
	"character_id" INTEGER,
	FOREIGN KEY(enchantments) REFERENCES enchantment(id)
);

CREATE TABLE IF NOT EXISTS "weapon" (
	"id" INTEGER PRIMARY KEY, 
	"name" TEXT,
	"weight" TEXT,
	"range", INTEGER,
	"damage" INTEGER,
	"damage_type" TEXT,
	"weapon_type" TEXT,
	"condition" TEXT,
	"description" TEXT,
	"enchantments" INTEGER,
	"properties_id" INTEGER,
	"character_id" INTEGER,
	FOREIGN KEY(character_id) REFERENCES character(id),
	FOREIGN KEY(enchantments) REFERENCES enchantment(id),
	FOREIGN KEY(properties_id) REFERENCES properties(id)
);

CREATE TABLE IF NOT EXISTS "inventory" (
	"id" INTEGER PRIMARY KEY,
	"character_id" INTEGER,
	"item_ids" INTEGER,
	FOREIGN KEY(character_id) REFERENCES character(id),
	FOREIGN KEY(item_ids) REFERENCES item(id)	
);

CREATE TABLE IF NOT EXISTS "spell" (
	"id" INTEGER PRIMARY KEY,
	"name" TEXT,
	"level" INTEGER,
	"spell_type" TEXT,
	"damage_type" TEXT,
	"casting_time" TEXT,
	"range" INTEGER,
	"attack" TEXT,
	"save" TEXT,
	"class" TEXT,
	"description" TEXT,
	"character_ids" INTEGER,
	FOREIGN KEY(character_ids) REFERENCES character(id)
);

CREATE TABLE IF NOT EXISTS "special_ability" (
	"id" INTEGER PRIMARY KEY,
	"name" TEXT,
	"type" TEXT,
	"description" TEXT
);

CREATE TABLE IF NOT EXISTS "container" (
	"id" INTEGER PRIMARY KEY,
	"description" TEXT,
	"items" INTEGER, 
	FOREIGN KEY(items) REFERENCES item(id)
);

CREATE TABLE IF NOT EXISTS "settlement" (
	"id" INTEGER PRIMARY KEY,
	"faction" INTEGER,
	"type" TEXT,
	"description" TEXT,
	"structures" INTEGER, 
	"character_ids" INTEGER, 
	FOREIGN KEY(character_ids) REFERENCES character(id)
	FOREIGN KEY(structures) REFERENCES structure(id)
);

CREATE TABLE IF NOT EXISTS "structure" (
	"id" INTEGER PRIMARY KEY,
	"description" TEXT,
	"owner" INTEGER,
	"settlement_id" INTEGER,
	FOREIGN KEY(settlement_id) REFERENCES settlement(id),
	FOREIGN KEY(owner) REFERENCES character(id)
);

CREATE TABLE IF NOT EXISTS "faction" ( 
	"id" INTEGER PRIMARY KEY ,
	"name" TEXT,
	"type" TEXT,
	"goal" TEXT,
	"allied_factions" INTEGER, 
	"enemy_factions" INTEGER,
	"key_members" INTEGER,
	FOREIGN KEY(allied_factions) REFERENCES faction(id),
	FOREIGN KEY(enemy_factions) REFERENCES faction(id),
	FOREIGN KEY(key_members) REFERENCES character(id)
);

CREATE TABLE IF NOT EXISTS "quest" (
	"id" INTEGER PRIMARY KEY,
	"description" TEXT,
	"type" TEXT,
	"target" TEXT,
	"reward" TEXT,
	"quest_giver_id" INTEGER,
	"step_id" INTEGER,
	FOREIGN KEY(quest_giver_id) REFERENCES character(id),
	FOREIGN KEY(step_id) REFERENCES quest_step(id)
); 

CREATE TABLE IF NOT EXISTS "quest_step" (
	"id" INTEGER PRIMARY KEY,
	"step_number" INTEGER,
	"task" TEXT,
	"event_id" INTEGER,
	"quest_id" INTEGER,
	FOREIGN KEY(quest_id) REFERENCES quest(id),
	FOREIGN KEY(event_id) REFERENCES event(id)            
);

CREATE TABLE IF NOT EXISTS "event" (
	"id" INTEGER PRIMARY KEY,
	"description" TEXT,
	"location" TEXT,
	"characters" INTEGER,
	"interactions" INTEGER,
	FOREIGN KEY(characters) REFERENCES character(id),
	FOREIGN KEY(interactions) REFERENCES interaction(id)
);

CREATE TABLE IF NOT EXISTS "interaction" (
	"id" INTEGER PRIMARY KEY,
	"description" TEXT,
	"npc" INTEGER,
	"sub_interactions" INTEGER,
	FOREIGN KEY(sub_interactions) REFERENCES sub_interaction(id)
);

CREATE TABLE IF NOT EXISTS "sub_interaction" (
	"id" INTEGER PRIMARY KEY,
	"trigger" TEXT,
	"action" TEXT,
	"low_roll" INTEGER,
	"low_roll_action" TEXT,
	"low_roll_dialogue" TEXT,
	"high_roll" INTEGER,
	"high_roll_action" TEXT,
	"high_roll_dialogue" TEXT,
	"description" TEXT,
	"ability_check_id" INTEGER,  
	"key_items_id" INTEGER, 
	"npc_id" INTEGER,  
	FOREIGN KEY(npc_id) REFERENCES character(id),
	FOREIGN KEY(key_items_id) REFERENCES item(id),
	FOREIGN KEY(ability_check_id) REFERENCES ability_check(id)
);

CREATE TABLE IF NOT EXISTS "ability_check"(
	"id" INTEGER PRIMARY KEY,
	"ability" TEXT,
	"passing_roll" INTEGER,
	"good_results" TEXT,
	"bad_results" TEXT
);