extends "res://Scripts/Items/Item.gd"

@export var fossil_textures: Array[CompressedTexture2D] = []
var sprite

signal spawned

func _ready():
	self.connect("spawned", on_spawn)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func consume():
	# TODO: add to player's collected fossils
	print("Picked up fossil, added to player's fossil collection")

# this function will change the Sprite2D's texture
func change_texture(index):
	sprite = $Sprite2D

	sprite.set_texture(fossil_textures[index])
	
func _on_body_entered(body: Node2D):
	if body.name == "Player":
		body.emit_signal("fossil_collected")
		on_pickup()

func on_spawn(index):
	print("test")
	change_texture(index)
