extends State
class_name PlayerShoot

@export var animated_sprite: AnimatedSprite2D
@export var shoot_timer: Timer
@export var character_body: CharacterBody2D
@export var SPEED: float

func Enter() -> void:
	character_body.velocity.x = move_toward(character_body.velocity.x, 0, SPEED)
	animated_sprite.play("fire")
	animated_sprite.flip_h = true
	shoot_timer.start()
	
func Exit() -> void:
	animated_sprite.flip_h = false

func Physics_Update(delta) -> void:
	if not character_body.is_on_floor():
		character_body.velocity += character_body.get_gravity() * delta

func _on_shoot_timer_timeout() -> void:
	Transitioned.emit(self, "idle")
