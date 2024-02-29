extends Area2D

signal cell_ready_to_be_destroyed

var item_instance

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

# Once player enters the grid cell, the cells breaks and sends out a signal
# saying it is ready to be destroyed.
# TODO - determine whether or not to break cell here or have a controller handle this.
func _on_area_entered(body):
	if body.get_name() == "Player":
		# print("Cell ready to break!")
		emit_signal("cell_ready_to_be_destroyed")
		
		if item_instance != null:
			item_instance.emit_signal("started")

		queue_free()
