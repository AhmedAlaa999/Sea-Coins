extends CanvasModulate

@export var day_length := 20.0

var time := 10.0
var was_night := false


func _process(delta):
	time += delta

	if time >= day_length:
		time = 0.0

	var progress := time / day_length

	var brightness := (sin(progress * TAU - PI / 2.0) + 1.0) / 2.0

	var day_color := Color(1.0, 1.0, 1.0)

	var night_color := Color(0.12, 0.15, 0.30)

	color = night_color.lerp(day_color, brightness)

	var is_night := brightness < 0.35

	if is_night != was_night:
		get_tree().call_group("lamps", "set_night", is_night)
		was_night = is_night
