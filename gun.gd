extends Node2D
@onready var player_sprite: AnimatedSprite2D = $"../AnimatedSprite2D"
@onready var gun_sprite: Sprite2D = $Sprite2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if player_sprite.flip_h:
		scale.x = -1
	else:
		scale.x = 1
