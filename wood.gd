extends TileMapLayer

@export var movement := 3.0
@export var speed := 0.7

var start_position: Vector2


func _ready():
	start_position = position


func _process(_delta):
	var wave = sin(Time.get_ticks_msec() / 1000.0 * speed)

	position.x = start_position.x + wave * movement
