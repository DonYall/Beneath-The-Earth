extends Area2D

@export var speed = 400
var screen_size

func _ready():
	screen_size = get_viewport_rect().size
	
func _process(delta):
	var velocity = Vector2.ZERO
	if Input.is_action_pressed("move_right"):
		velocity.x += 1
	if Input.is_action_pressed("move_left"):
		velocity.x -= 1
	if Input.is_action_pressed("move_down"):
		velocity.y += 1
	if Input.is_action_pressed("move_up"):
		velocity.y -= 1

	if velocity.length() > 0:
		velocity = velocity.normalized() * speed
		$AnimatedSprite2D.play()
	else:
		$AnimatedSprite2D.stop()
	position += velocity * delta
	position = position.clamp(Vector2.ZERO, screen_size)
	
	if velocity.x != 0:
		if velocity.y != 0:
			if velocity.x > 0:
				$AnimatedSprite2D.rotation = PI / 4 if velocity.y < 0 else 3 * PI / 4
			else:
				$AnimatedSprite2D.rotation = 7 * PI / 4 if velocity.y < 0 else 5 * PI / 4
		else:
			$AnimatedSprite2D.rotation = PI / 2 if velocity.x > 0 else 3 * PI / 2
	elif velocity.y != 0:
		$AnimatedSprite2D.rotation = 0 if velocity.y < 0 else PI


func _on_animated_sprite_2d_animation_finished():
	$AnimatedSprite2D.play("idle")
