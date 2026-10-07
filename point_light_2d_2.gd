extends PointLight2D

@export var min_energy := 0.75
@export var max_energy := 1.15

var target_energy := 1.0
var timer := 0.0
var is_night := false


func _ready():
	randomize()
	add_to_group("lamps")
	energy = 0.0


func _process(delta):
	if not is_night:
		energy = lerp(energy, 0.0, delta * 5.0)
		return

	timer -= delta

	if timer <= 0:
		target_energy = randf_range(min_energy, max_energy)
		timer = randf_range(0.05, 0.2)

	energy = lerp(energy, target_energy, delta * 8.0)


func set_night(value: bool):
	is_night = value
