extends StaticBody2D


func _ready():
	on_pickup()


func _process(delta):
	pass

func on_pickup():
	print("base class")