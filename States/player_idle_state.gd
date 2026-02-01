extends State
class_name PlayerIdle

@export var animated_sprite: AnimatedSprite2D
@export var character_body: CharacterBody2D
@export var SPEED: float = 150.0

func Enter() -> void:
	character_body.velocity.x = move_toward(character_body.velocity.x, 0, SPEED)
	animated_sprite.play("default")
	animated_sprite.flip_h = true

func Physics_Update(delta: float) -> void:
	if not character_body.is_on_floor():
		character_body.velocity += character_body.get_gravity() * delta
		
	var direction := Input.get_axis("left", "right")
	if direction:
		Transitioned.emit(self, "run")
		
	if Input.is_action_pressed("jump") and character_body.is_on_floor():
		Transitioned.emit(self, "jump")
		
	if Input.is_action_just_pressed("fire"):
		Transitioned.emit(self, "shoot")

func Exit() -> void:
	animated_sprite.flip_h = false;
