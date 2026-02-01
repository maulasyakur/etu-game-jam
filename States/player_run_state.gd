extends State
class_name PlayerRun

@export var animated_sprite: AnimatedSprite2D
@export var character_body: CharacterBody2D
@export var SPEED: float = 150.0

func Enter() -> void:
	animated_sprite.play("run")
	
func Physics_Update(delta: float) -> void:
	if not character_body.is_on_floor():
		character_body.velocity += character_body.get_gravity() * delta
	# Handle jump.
	if Input.is_action_pressed("jump") and character_body.is_on_floor():
		Transitioned.emit(self, "jump")
		
	var direction := Input.get_axis("left", "right")
	if direction:
		character_body.velocity.x = direction * SPEED
		animated_sprite.flip_h = (direction < 0)
	else:
		Transitioned.emit(self, "idle")
		
	if Input.is_action_just_pressed("fire"):
		Transitioned.emit(self, "shoot")
