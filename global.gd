extends Node

onready var game = get_parent().get_child(3)
var is_dm = false

func _ready():
	print("global ready")

var dm = {
	"realName": "PandaUnwise",
	"lang": ["common", "orcish", "elvish"],
}

onready var self_data = {
	"name": "Simplefuq",
	"realName": "PandaUnwise",
	"ac"  : 10,
	"lang": ["common", "orcish"],
	"prefered_class": "figther",
	"class": "fighter",
	"stats": {
		"str": 10,
		"dex": 10,
		"con": 10,
		"wis": 10,
		"int": 10,
		"cha": 10,
	},
	"spells": {
		
	},
}

