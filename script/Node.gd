extends Node

@onready var player = $Player
var scoreJugador := 0
var scores_a_llegar = {}
var spawner = load("res://Escenas/spawner.tscn")
# Called when the node enters the scene tree for the first time.
func _llenar_scores():
	var spawner = 10
	var spawner_inicial = 1
	for i in range(0, spawner):
		var score_random = randi_range(1,10) + spawner_inicial
		scores_a_llegar[score_random] = "Score para pasar " + str(score_random)
		spawner_inicial = score_random
	
func _ready():
	player.connect("scoreUp",subirScore)
	player.connect("playerDied",perder)
	_llenar_scores()
func subirScore():
	scoreJugador +=1
	$ScoreLabel.text = str(scoreJugador)
	if scoreJugador in scores_a_llegar:
		add_child(spawner.instantiate())
func perder():
	$DeathScreen/HBoxContainer/FinalScore.text = str(scoreJugador)
	$DeathScreen.show()
	get_tree().paused = true
