extends "res://Scripts/Items/Item.gd"

@export var fossil_textures: Array[CompressedTexture2D] = []
var sprite

func _ready():
	sprite = $Sprite2D

	# set default texture to first fossil
	change_texture(0)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func consume():
	# TODO: add to player's collected fossils
	print("Picked up fossil, added to player's fossil collection")

# this function will change the Sprite2D's texture
func change_texture(index):
	# if sprite is null, then don't do anything
	if(sprite == null):
		return	

	sprite.set_texture(fossil_textures[index])
	
func _on_area_entered(area: Area2D):
	if area.name == "Player":
		area.emit_signal("fossil_collected")
		on_pickup()
