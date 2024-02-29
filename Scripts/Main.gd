extends Node

var player_instance
var hud_instance

var fossils_collected = 0

# scene references
var player_scene
var hud_scene
var grid_scene
var grid_instance

@export var start_position: Vector2 

func _ready():
	initialize()

func _process(delta):
	pass

# initial setup
func initialize():
	player_scene = preload("res://Scenes/Player.tscn")
	player_instance = player_scene.instantiate()
	add_to_group("player")
	add_child(player_instance)
	grid_scene = preload("res://Scenes/Grid/grid_map.tscn")
	grid_instance = grid_scene.instantiate()
	grid_instance.player_instance = player_instance
	add_child(grid_instance)
	hud_scene = preload("res://Scenes/HUD.tscn")
	hud_instance = hud_scene.instantiate()
	hud_instance.set_player(player_instance)
	player_instance.connect("hit", on_player_hit)
	player_instance.connect("gain_health", on_consume_heart)
	player_instance.connect("fossil_collected", on_consume_fossil)
	add_child(hud_instance)

func new_game():
	player_instance.position = start_position
	set_player_health(player_instance.starting_health)

func set_player_health(health: int):
	player_instance.health = health
	hud_instance.get_node("HealthLabel").text = "Health: " + str(player_instance.health)

func set_fossils_collected(fossils: int):
	fossils_collected = fossils
	hud_instance.get_node("FossilsCollectedLabel").text = "Fossils Collected: " + str(fossils_collected) + "/8"

	if fossils_collected >= 8:
		on_win()

func on_player_hit():
	set_player_health(player_instance.health - 1)
	
# called when the player picks up a heart
func on_consume_heart():
	set_player_health(player_instance.health + 1)
	
func on_consume_fossil():
	set_fossils_collected(fossils_collected + 1)

func on_win():
	# TODO: Implement win screen
	print("Player won!")
