extends Node

var collected_coins := 0
var time_left := 40.0
var total_coins := 11
var game_over := false
var result :=""

func start_game():
	collected_coins = 0
	time_left = 40.0
	game_over = false
	result = ""

func collect_coin():
	if game_over:
		return
	collected_coins += 1
	if collected_coins >= total_coins:
		win_game()
		
func win_game():
	if game_over:
		return
	game_over = true
	result = "WIN"
	
func lose_game():
	if game_over:
		return
	game_over = true
	result = "LOSE"
	
func _process(delta):
	if game_over:
		return
	time_left -= delta
	
	if time_left <= 0:
		time_left= 0
		lose_game()
