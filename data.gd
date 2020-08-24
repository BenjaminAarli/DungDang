extends Node

## Data is game data. Stats, Spells, Classes, Languages. 
## Data is a database of these things. 

var spells = {
	"bless": {
		"level": "1st level enchantment",
		"casting_time": "1 action",
		"range": "30 feet",
		"components": ["V", "S", "M", "a sparkling of holy water"],
		"duration": ["Concentration", "up to 1 minute"],
		"details": """You bless up to three creatures of your choice within range. 
		Whenever a target makes an attack roll or a saving throw before the 
		spell ends, the target can roll a d4 and add the number rolled to the 
		attack roll or saving throw. At Higher Levels. When you cast this spell 
		using a spell slot of 2nd level or higher, you can target one additional 
		creature for each slot level above 1st."""
	},
	"cure wound": {
		"level": "1st level evocation",
		"casting_time": "1 action",
		"range": "Touch",
		"components": ["V", "S"],
		"duration": "Instantaneous",
		"details": """A creature you touch regains a number of hit points equal 
		to 1d8 + your spellcasting ability modifier. This spell has no effect 
		on undead or constructs. At Higher Levels. When you cast this spell 
		using a spell slot of 2nd level or higher, the healing increases by 1d8 
		for each slot level above 1st."""
	},
	"bane": {
		"level": "1st level enchantment",
		"casting_time": "1 action",
		"range": "30 feet",
		"components": ["V", "S", "M", "a drop of blood"],
		"duration": ["Concentration", "up to 1 minute"],
		"details": """A creature you touch regains a number of hit points equal 
		to 1d8 + your spellcasting ability modifier. This spell has no effect 
		on undead or constructs. At Higher Levels. When you cast this spell 
		using a spell slot of 2nd level or higher, the healing increases by 1d8 
		for each slot level above 1st."""
	},
	"command": {
		"level": "1st level enchantment",
		"casting_time": "1 action",
		"range": "60 feet",
		"components": ["V"],
		"duration": ["1 round"],
		"details": """You speak a one-word command to a creature you can see 
		within range. The target must succeed on a Wisdom saving throw or follow 
		the command on its next turn. The spell has no effect if the target is 
		undead, if it doesn’t understand your language, or if your command is 
		directly harmful to it. Some typical commands and their effects follow. 
		You might issue a command other than one described here. If you do so, 
		the DM determines how the target behaves. If the target can’t follow 
		your command, the spell ends. Approach. The target moves toward you by 
		the shortest and most direct route, ending its turn if it moves within 
		5 feet of you. Drop. The target drops whatever it is holding and then 
		ends its turn. Flee. The target spends its turn moving away from you by 
		the fastest available means. Grovel. The target falls prone and then ends 
		its turn. Halt. The target doesn’t move and takes no actions. A flying 
		creature stays aloft, provided that it is able to do so. If it must move 
		to stay aloft, it flies the minimum distance needed to remain in the air.
		At Higher Levels. When you cast this spell using a spell slot of 2nd level 
		or higher, you can affect one additional creature for each slot level above 
		1st. The creatures must be within 30 feet of each other when you target them."""
	}, 
	"create/destroy water": {
		"level": "1st level transmutation",
		"casting_time": "1 action",
		"range": "30 feet",
		"components": ["V", "S", "M", "a drop of water if creating water or a few grains of sand if destroying it"],
		"duration": ["Instantaneous"],
		"details": """You either create or destroy water. Create Water. You create 
		up to 10 gallons of clean water within range in an open container. 
		Alternatively, the water falls as rain in a 30-foot cube within range, 
		extinguishing exposed flames in the area. Destroy Water. You destroy up 
		to 10 gallons of water in an open container within range. Alternatively, 
		you destroy fog in a 30-foot cube within range. At Higher Levels. When 
		you cast this spell using a spell slot of 2nd level or higher, you create 
		or destroy 10 additional gallons of water, or the size of the cube 
		increases by 5 feet, for each slot level above 1st."""
	},
	"detect evil and good": {
		"level": "1st level divination",
		"casting_time": "1 action",
		"range": "self",
		"components": ["V", "S"],
		"duration": ["Concentration", "up to 10 minute"],
		"details": """For the duration, you know if there is an aberration, 
		celestial, elemental, fey, fiend, or undead within 30 feet of you, as 
		well as where the creature is located. Similarly, you know if there is 
		a place of object within 30 feet of you that has been magically consecrated 
		or desecrated. The spell can penetrate most barriers, but it is blocked 
		by 1 foot of stone, 1 inch of common metal, a thin sheet of lead, or 3 
		feet of wood or dirt."""
	}, 
	"detect magic": {
		
	}
}

onready var languages = {
	"common" : null,
	"orcish" : [
		"Mub",
		"Pafund",
		"Tharb",
		"Tharm",
		"Ti",
		"Mabas",
		"Larg",
		"Nalt",
		"Sok",
		"Tar",
		"Nadar",
		"Prauta",
		"Do",
		],
	"elvish": [
		"Fa",
		"Li", 
		"Sermi'nus",
		"Lien",
		"Oliva",
		"Feri'em",
		"Lokus",
		"Foru",
		"Da",
		"Siel",
		"Le'a",
		"Ca'il",
		"Mer",
		],
	"undead": [
		"Saaah",
		"Felimaaa",
		"Feeh",
		"Ku'lh",
		"Chee",
		"Ghaas",
		"Fleesh",
		"Bloodh",
		"Heelp",
		"KilhMeee...",
		"Deehd",
		"Diee",
		"Huush"
		],
}

var races = [
	"dragonborn",
	"dwarf",
	"elf",
	"gnome",
	"half-elf",
	"halfling",
	"half-orc",
	"human",
	"tiefling",
]

var classes = [
	"barbarian", 
	"bard",
	"cleric", 
	"druid",
	"fighter",
	"monk",
	"paladin",
	"ranger",
	"rogue",
	"sorcerer",
	"wizard"
]
