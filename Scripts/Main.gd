extends Node

var player_instance
var hud_instance

var fossils_collected = 0

func _ready():
	var player_scene = preload("res://Scenes/Player.tscn")
	player_instance = player_scene.instantiate()
	add_child(player_instance)
	var enemy_spawner_scene = preload("res://Scenes/Items/EnemySpawner.tscn")
	var enemy_spawner_instance = enemy_spawner_scene.instantiate()
	enemy_spawner_instance.set_player(player_instance)
	add_child(enemy_spawner_instance)
	var hud_scene = preload("res://Scenes/HUD.tscn")
	hud_instance = hud_scene.instantiate()
	hud_instance.set_player(player_instance)
	player_instance.connect("hit", on_player_hit)
	player_instance.connect("gain_health", on_consume_heart)
	player_instance.connect("fossil_collected", on_consume_fossil)
	add_child(hud_instance)

func _process(delta):
	pass

func on_player_hit():
	player_instance.health -= 1
	hud_instance.get_node("HealthLabel").text = "Health: " + str(player_instance.health)
	
# called when the player picks up a heart
func on_consume_heart():
	player_instance.health += 1
	hud_instance.get_node("HealthLabel").text = "Health: " + str(player_instance.health)
	
func on_consume_fossil():
	fossils_collected += 1
	hud_instance.get_node("FossilsCollectedLabel").text = "Fossils Collected: " + str(fossils_collected) + "/8" 
	
	if fossils_collected >= 8:
		on_win()

func on_win():
	# TODO: Implement win screen
	print("Player won!")
