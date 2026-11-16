extends Node

var player_dmg : int = 10

var score : int = 0
var high_score : int = 0

func update_score():
	score += 1
	if score > high_score:
		high_score = score
