extends CharacterBody2D


const SPEED = 200.0
const JUMP_VELOCITY = -400.0
signal scoreUp
signal playerDied
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
@onready var animated_sprite_2d = $AnimatedSprite2D
func _input(event):
	if Input.is_action_just_pressed("jump") and is_on_floor():
		animated_sprite_2d.play("jump")
		velocity.y = JUMP_VELOCITY
	if Input.is_action_just_released("jump"):
		velocity.y += 50
		
func _physics_process(delta):
	if not is_on_floor():
		velocity.y += gravity * delta

	var direction = Input.get_axis("left", "right")
	if direction:
		velocity.x = direction * SPEED
		if velocity.y == 0:
			animated_sprite_2d.play("run")
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		if velocity.y == 0:
			animated_sprite_2d.play("idle")
	if direction != 0:
		animated_sprite_2d.flip_h = direction < 0
	
	if velocity.y > 0:
		animated_sprite_2d.play("fall")
	move_and_slide()
func subirScore():
	$SubirScoreSonido.play()
	emit_signal("scoreUp")
func gameOver():
	animated_sprite_2d.play("hurt")
	$GameOverSonido.play()
	emit_signal("playerDied")
