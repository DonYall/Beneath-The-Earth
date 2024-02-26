extends Node

var player_instance

func _ready():
	var player_scene = preload("res://Scenes/Player.tscn")
	player_instance = player_scene.instantiate()
	add_child(player_instance)
	var enemy_scene = preload("res://Scenes/Enemy.tscn")
	var enemy_instance = enemy_scene.instantiate()
	enemy_instance.set_player(player_instance)
	add_child(enemy_instance)

func _process(delta):
	pass
