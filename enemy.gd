extends Node2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0
var health = 3


func _on_health_component_health_depleted() -> void:
	
	queue_free()
