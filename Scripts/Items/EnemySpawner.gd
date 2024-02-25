extends "res://Scripts/Items/Item.gd"

@export var enemy_scene: PackedScene

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

	# position to spawn enemy
	position = self.position 

	# move enemy to position
	enemy.position = position
	
	add_child(enemy)
	
	pass # Replace with function body.
