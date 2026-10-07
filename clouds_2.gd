extends Sprite2D

@export var speed:= 15.0

func _process(delta):
	position.x +=speed * delta
	if global_position.x > 1300:
			global_position.x =-200
			
