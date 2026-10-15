extends Area2D

@export var coin_value := 1

@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@onready var audio_stream_player: AudioStreamPlayer2D = $AudioStreamPlayer

var collected := false

func _ready():
	animated_sprite_2d.play("Ideal")
	body_entered.connect(_on_body_entered)

func _on_body_entered(body):
	if not body.is_in_group("player") or collected:
		return

	collected = true

	GameManager.collect_coin()

	set_deferred("monitoring", false)

	animated_sprite_2d.hide()

	audio_stream_player.play()

	await audio_stream_player.finished
	queue_free()
