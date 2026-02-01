extends CharacterBody2D

@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D

const SPEED = 100.0
const JUMP_VELOCITY = -200.0
var on_ladder: bool = false
var is_running: bool = false
var was_on_floor: bool = true
var current_animation: String = ""
var wearing_mask := false

func _physics_process(delta: float) -> void:
	# Handle gravity (except when on ladder)
	if not is_on_floor() and not on_ladder:
		velocity += get_gravity() * delta
	
	# Handle jump
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY
	
	# Get input direction
	var direction := Input.get_axis("left", "right")
	
	# Handle horizontal movement (except when on ladder)
	if not on_ladder:
		if direction:
			velocity.x = direction * SPEED
			is_running = true
		else:
			velocity.x = move_toward(velocity.x, 0, SPEED)
			is_running = false
		
		# Flip sprite based on direction
		if direction != 0:
			animated_sprite_2d.flip_h = direction < 0
	
	# Handle ladder movement
	if on_ladder:
		velocity.x = direction * SPEED
		# Disable gravity on ladder
		velocity.y = 0
		
		var vertical_dir = Input.get_axis("climb_up", "climp_down")  # Note: typo "climp_down"
		if vertical_dir:
			velocity.y = vertical_dir * SPEED
		else:
			velocity.y = move_toward(velocity.y, 0, SPEED)  # Fixed: velocity.y not velocity.x
	
	# Update animation based on state
	update_animation()
	
	move_and_slide()

func update_animation():
	var new_animation = "default"
	var need_flip = false

	if on_ladder:
		if abs(velocity.y) > 10:
			new_animation = "covid_naik_tangga" if  wearing_mask else "naik_tangga"
		else:
			new_animation = "covid_default" if wearing_mask else "default"

	elif not is_on_floor():
		new_animation = "covid_jump" if wearing_mask else "jump"

	elif is_running and abs(velocity.x) > 10:
		new_animation = "covid_walk" if wearing_mask else "run"

	else:
		new_animation = "covid_default" if wearing_mask else "default"

	# Only play if changed
	if new_animation != current_animation:
		animated_sprite_2d.play(new_animation)
		current_animation = new_animation


func _on_area_ladder_body_entered(body: Node2D) -> void:
	print("player entered stair area")
	on_ladder = true
	velocity.y = 0  # Reset vertical velocity when grabbing ladder

func _on_area_ladder_body_exited(body: Node2D) -> void:
	print("player exited stair area")
	on_ladder = false

func _on_area_plant_body_entered(body: Node2D) -> void:
	print(body)

func _on_area_plant_body_exited(body: Node2D) -> void:
	print(body)
	
func wear_mask():
	wearing_mask = true
