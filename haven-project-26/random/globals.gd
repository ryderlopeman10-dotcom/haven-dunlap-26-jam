extends Node

var player_dmg : int = 10

var score : int = 0
var high_score : int = 0

var max_enemies : int = 2
var enemy_amount : int = 2

func update_score():
	if score > high_score:
		high_score = score
		
