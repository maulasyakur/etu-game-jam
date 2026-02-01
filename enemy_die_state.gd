extends State

@onready var animated_sprite_2d: AnimatedSprite2D = $"../../AnimatedSprite2D"
@onready var enemy: CharacterBody2D = $"../.."
@export var SPEED: float


func Enter() -> void:
	enemy.velocity.x = move_toward(enemy.velocity.x, 0, SPEED)
	animated_sprite_2d.play("death")

func _on_animated_sprite_2d_animation_finished() -> void:
	if animated_sprite_2d.animation == "death":
		enemy.queue_free()
