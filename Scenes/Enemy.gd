extends CharacterBody2D

var speed = (randi() % 75 + 200)
var screen_size
var player_instance

# Called when the node enters the scene tree for the first time.
func _ready():
	screen_size = get_viewport_rect().size

func set_player(player):
	player_instance = player

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if player_instance:
		var velocity = Vector2.ZERO
		if player_instance.position.y == position.y:
			return
		var active = position.distance_to(player_instance.position) <= screen_size.x / 4
		if not active:
			$AnimatedSprite2D.play("passive")
			return
		$AnimatedSprite2D.play("active")
		var direction_to_player = player_instance.position - position
		var theta = atan2(direction_to_player.y, direction_to_player.x)

		velocity.x = cos(theta)
		velocity.y = sin(theta)

		if velocity.length() > 0:
			velocity = velocity.normalized() * speed
		position += velocity * delta
		position = position.clamp(Vector2.ZERO, screen_size)
