extends CharacterBody2D


const SPEED = 100.0
const JUMP_VELOCITY = -300.0
signal scoreUp
signal playerDied
# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
@onready var animated_sprite_2d = $AnimatedSprite2D

func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta
		
	# Handle Jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		animated_sprite_2d.play("jump")
		velocity.y = JUMP_VELOCITY
		
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("ui_left", "ui_right")
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
