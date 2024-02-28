extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

# When start button is pressed, load the main gameplay scene.
func _on_start_button_pressed():
	get_tree().change_scene_to_file("res://Scenes/Main.tscn")


func _on_instructions_pressed():
	get_tree().change_scene_to_file("res://Scenes/GameScenes/Instructions.tscn")
