extends Label

@onready var result_screen = $"../ResultScreen"
@onready var result_label_w: Label = $"../ResultScreen/ResultLabelW"

var restarting := false


func _ready():
    GameManager.start_game()
    result_screen.hide()


func _process(_delta):
    if not GameManager.game_over:
        text = "TIME: " + str(ceil(GameManager.time_left)) + "    COINS: " + str(GameManager.collected_coins) + "/" + str(GameManager.total_coins)
        return

    if restarting:
        return

    restarting = true

    result_screen.show()

    if GameManager.result == "WIN":
        result_label_w.text = "YOU WIN!\n\nALL COINS COLLECTED!"
    elif GameManager.result == "LOSE":
        result_label_w.text = "YOU LOSE!\n\nTIME'S UP!"

    await get_tree().create_timer(2.0).timeout
    get_tree().reload_current_scene()
