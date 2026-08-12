extends Node

var score = 0

@onready var label_score: Label = $Label_score

func add_score():
	score += 1
	label_score.text = "Obtuviste \n"+str(score)+" monedas."
