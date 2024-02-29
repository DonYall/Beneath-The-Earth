extends CanvasLayer

var player_instance

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass	

func set_player(player):
	player_instance = player

func show_message(text):
	$MessageLabel.text = text
	$MessageLabel.show()
	$MessageTimer.start()

func show_game_over():
	show_message("Game over!")

func show_win():
	show_message("Victory!")

func _on_message_timer_timeout():
	$MessageLabel.hide()

	var main_menu = preload("res://Scenes/GameScenes/MainMenu.tscn")
	var main_menu_instance = main_menu.instantiate()

	get_tree().get_root().add_child(main_menu_instance)
	get_tree().get_root().get_node("Main").queue_free()

