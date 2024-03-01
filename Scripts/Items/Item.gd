extends Area2D 

# set this to false if you don't want the item to despawn on pick up
# ex. enemy spawner
@export var use_pickup_behaviour = true

signal started # when the player breaks the cell with this item

func _ready():
	pass

func _process(delta):
	pass

# when the item gets picked up
# mock abstract function, meaning all items need to implement it
func on_pickup():
	consume()

	# destroy the item when pick up
	queue_free()

# when the item gets used
# mock abstract function, meaning all items need to implement it
func consume():
	push_error("UNIMPLEMENTED ERROR: consume()")

func _on_body_entered(body:Node2D):
	if body.name == "Player" and use_pickup_behaviour:
		on_pickup()

func on_start():
	pass
