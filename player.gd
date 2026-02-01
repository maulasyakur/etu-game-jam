extends CharacterBody2D

const SPEED = 100.0
const JUMP_VELOCITY = -200.0

@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
		   
func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta
#
	## Handle jump.
	#if Input.is_action_pressed("jump") and is_on_floor():
		#velocity.y = JUMP_VELOCITY
#
	## Get the input direction and handle the movement/deceleration.
	## As good practice, you should replace UI actions with custom gameplay actions.
	#var direction := Input.get_axis("left", "right")
	#if direction:
		#velocity.x = direction * SPEED
		#animated_sprite_2d.flip_h = (direction < 0)
		#animated_sprite_2d.play("run")
	#else:
		#velocity.x = move_toward(velocity.x, 0, SPEED)
		#animated_sprite_2d.play("default")

	move_and_slide()
