extends "res://Scripts/Items/Item.gd"

@export var health_increment = 1 # how much health to add to the player on pick up

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func consume():
	# TODO: add to player health
	print("Picked up health, add to player's health")
	pass