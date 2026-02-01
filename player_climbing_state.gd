extends State

@export var animated_body: AnimatedSprite2D

func Enter() -> void:
	animated_body.play("naik_tangga")
