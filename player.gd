extends CharacterBody2D

@export var speed := 200.0
@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D

var last_direction := "down"

func _physics_process(_delta):
	var direction := Input.get_vector(
		"move_left",
		"move_right",
		"move_up",
		"move_down"
	)

	velocity = direction * speed
	move_and_slide()

	update_animation(direction)

func update_animation(direction: Vector2):
	if direction == Vector2.ZERO:
		animated_sprite.play("Idle-" + last_direction)
		return

	if abs(direction.x) > abs(direction.y):
		if direction.x > 0:
			last_direction = "Right"
		else:
			last_direction = "Left"
	else:
		if direction.y > 0:
			last_direction = "down"
		else:
			last_direction = "up"

	if last_direction == "Left":
		animated_sprite.play("Run-left")
	elif last_direction == "Right":
		animated_sprite.play("Run-Right")
	elif last_direction == "up":
		animated_sprite.play("Run-Up")
	elif last_direction == "down":
		animated_sprite.play("Run-Down")
