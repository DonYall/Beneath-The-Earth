extends "res://Scripts/Items/Item.gd"

@export var damage = 2 # amount of damage to deal to the player

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func consume():
	print("Used spike item, deal damage to player")
	pass

func on_enemy_enter():
	pass

func _on_area_entered(area: Area2D):
	area.emit_signal("hit")

	super(area)

func _on_body_entered(body: Node2D):
	# kill enemy
	body.queue_free()

	on_pickup()
