extends "res://Scripts/Items/Item.gd"

@export var enemy_scene: PackedScene
@export var wait_time = 20
@export var first_wait_time = 5
var player_instance

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func consume():
	# TODO: Implement enemy spawner
	pass

func _on_spawn_timer_timeout():
	# create instance of enemy scene
	var enemy = enemy_scene.instantiate()
	#enemy.set_player(player_instance)
	enemy.add_to_group("enemies", true)

	# position to spawn enemy
	enemy.set_global_position(self.get_global_position())
	
	get_tree().get_root().get_node("Main").add_child(enemy)

	pass # Replace with function body.

func set_player(player):
	player_instance = player

func on_start():
	$SpawnTimer.start(first_wait_time)
	$SpawnTimer.wait_time = wait_time
