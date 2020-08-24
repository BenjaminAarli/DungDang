extends Node

var SERVER_PORT = 55255
var SERVER_IP   = "176.74.211.208"
var MAX_PLAYERS = 10

var is_dm = false
var game

onready var self_data = {
	"charName": "Snap Maitai",
	"realName": "Unamed",
	"ac"  : 10,
	"hp": 1,
	"maxhp": 1,
	"speed": "30 feet",
	"initiative": 4,
	"deathsaves": {
		"success": 0,
		"failure": 0,
	},
	"alignment": "neutral",
	"xp": 0,
	"lang": ["common", "orcish"],
	"prefered_class": "figther",
	"class": "fighter",
	"race": "human",
	"stats": {
		"str": 10,
		"dex": 10,
		"con": 10,
		"wis": 10,
		"int": 10,
		"cha": 10,
	},
	"saving_throws":{
		"str": 0,
		"dex": 0,
		"con": 0,
		"wis": 0,
		"int": 0,
		"cha": 0,
	},
	"spells": [],
	"features": [],
	"personality_traits": [],
	"ideals": [],
	"bonds": [],
	"flaws": [],
	"age": 21,
	"height": "180cm",
	"weight": "80kg",
	"eyes": "green",
	"skin": "dark",
	"hair": "grey",
	"equipment": [],
	"attacks": [],
	"passive_wisdom (perception)": 0,
}

onready var dm = {
	"lang": ["common", "orcish", "elvish", "undead"],
}

var players = {
	
}

func _ready():
	if is_dm:
		self_data.lang.append(dm.lang)
		print("Since you are the DM, you get to have these languages. " + str(self_data.lang))
	get_tree().connect("network_peer_disconnected", self, "_network_peer_disconnected")
	if get_parent().has_node("Game"):
		game = get_parent().get_node("Game")
	print("network ready")

func write(dict = {"text": "the text", "lang": "common"}):
	rpc("write_self", dict)

sync func write_self(dict = {"text": "the text", "lang": "common", "id": get_tree().get_network_unique_id()}):
	print("write_self() player:" + str(who_wrote(get_tree().get_network_unique_id())))
	var p
	for person in players.size():
		print(players.keys())
		if 1 == players.keys()[person]:
			p = players.keys()[person]
	print("The senders name is ", p)
	if get_parent().has_node("Game"):
		game = get_parent().get_node("Game")
		if typeof(dict) == TYPE_DICTIONARY:
			game.add_text(dict.text, dict.lang)
		else:
			print("!!!!!! write text was not string or dict !!!!!!!")

func host_server():
	players[1] = self_data
	var peer = NetworkedMultiplayerENet.new()
	peer.create_server(SERVER_PORT, MAX_PLAYERS)
	get_tree().set_network_peer(peer)
	print("Hosted server at " + str(SERVER_IP) + ":" + str(SERVER_PORT) + " with a limit of "  + str(MAX_PLAYERS) + " players.")

func join_server(SERVER_IP = "127.0.0.1", SERVER_PORT = 55255):
	get_tree().connect("connected_to_server", self, "_connected_to_server")
	var peer = NetworkedMultiplayerENet.new()
	peer.create_client(str(SERVER_IP), int(SERVER_PORT))
	get_tree().set_network_peer(peer)
	self_data.id = get_tree().get_network_unique_id()
	print("You try connecting to server " + str(SERVER_IP) + ":" + str(SERVER_PORT))

func _connected_to_server():
	players[get_tree().get_network_unique_id()] = self_data
	rpc('_send_player_info', get_tree().get_network_unique_id(), self_data)
	self_data.id = get_tree().get_network_unique_id()
	write(str(players[get_tree().get_network_unique_id()]) + " joined to server " + str(SERVER_IP) + ":" + str(SERVER_PORT))
	print(str(players[get_tree().get_network_unique_id()]) + " joined to server " + str(SERVER_IP) + ":" + str(SERVER_PORT))

func who_wrote(id):
	var player_found = false
	for x in players.size():
		if id == players[x]:
			return str(players[x].self_data.fakeName)
	if player_found == false:
		return str("player not found")

func _network_peer_disconnected():
	write({"text": str(players[get_tree().get_network_unique_id()]) + " exited to server", "lang": "common", "name": str(players[players.size()-1])})
	print(str(players[get_tree().get_network_unique_id()]) + " exited to server" + str(who_wrote(get_tree().get_network_unique_id())))

sync func _send_player_info(id, info):
	if get_tree().is_network_server():
		for peer_id in players:
			rpc_id(id, '_send_player_info', peer_id, players[peer_id])
	players[id] = info
	game.add_text(str(players[id].realName) + " joined the server!")
	# insert later
	pass

func send_message(msg):
	var id = get_tree().get_network_unique_id()
	rpc("get_message", id, msg)
	pass

sync func get_message(id, msg):
	game = get_parent().get_node("Game")
	
	var do_you_understand = false
	if msg.lang != "common":
		for x in self_data.lang.size():
			if msg.lang == self_data.lang[x]:
				do_you_understand = true
	
	if not do_you_understand:
		game.add_text(str(players[id].realName) + ": " + msg.text)
		print(str(id) + ": " + msg.text)
	else:
		game.add_text(str(players[id].realName) + ": " + msg.translated_text + " (Translation): " + msg.text)
		print("send_message() elsed into this. If nothing is above me, ")
