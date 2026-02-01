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


func _on_shoot_timer_timeout() -> void:
	Transitioned.emit(self, "idle")
