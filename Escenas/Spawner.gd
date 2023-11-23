extends Node2D

var coleccionableEscena = preload("res://Escenas/coleccionable.tscn")
var dificultad =  0
func _ready():
	$Timer.stop()
	$Timer.wait_time = randf_range(2,4)
	$Timer.start()
	
func _on_timer_timeout():
	dificultad += .01
	var coleccionable = coleccionableEscena.instantiate()
	coleccionable.global_position = Vector2(randi_range(30,610),20)
	coleccionable.speed += dificultad
	add_child(coleccionable)
