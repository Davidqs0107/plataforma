extends Area2D
var esManzana = false 
var espina = preload("res://Assets/spike.png")
var speed := 1.0
func _ready():
	if randf()>.5:
		esManzana = true
	if(!esManzana):
		$sprite.texture = espina
func _on_body_entered(body):
	if body.is_in_group("Player"):
		if(esManzana):
			body.subirScore()
		else:
			body.gameOver()
	queue_free()
func _process(delta):
	position.y += speed
