extends "res://Scripts/Items/Item.gd"

@export var damage = 2 # amount of damage to deal to the player

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func consume():
	# TODO: deal damage to player
	print("Used spike item, deal damage to player")
	pass

func on_enemy_enter():
	# TODO: kill enemy
	pass