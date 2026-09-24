extends Node

signal took_damaged(lives_left)

var score = 0
var highscore = 0
var lives = 3

func update_highscore():
	if score > highscore:
		highscore = score
