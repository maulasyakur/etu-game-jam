extends State
class_name PlayerJump

@export var animated_sprite: AnimatedSprite2D
@export var character_body: CharacterBody2D
@export var JUMP_VELOCITY: float
@export var SPEED: float = 150.0

func Enter() -> void:
	character_body.velocity.y = JUMP_VELOCITY
	animated_sprite.play("jump")
	animated_sprite.flip_h = true;

func Physics_Update(delta: float) -> void:
	if not character_body.is_on_floor():
		character_body.velocity += character_body.get_gravity() * delta
		
	var direction := Input.get_axis("left", "right")
	if direction:
		character_body.velocity.x = direction * SPEED
		animated_sprite.flip_h = (direction < 0)
		
	if character_body.is_on_floor():
		Transitioned.emit(self, "idle")
	
	if Input.is_action_just_pressed("fire"):
		Transitioned.emit(self, "shoot")

func Exit() -> void:
	animated_sprite.flip_h = false;
