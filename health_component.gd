# health_component.gd
class_name HealthComponent
extends Node

signal health_changed(current_health: float)
signal health_depleted
signal damage_taken(amount: float)

@export var max_health: float = 100.0
@export var invulnerable_time: float = 0.2

var current_health: float
var is_invulnerable: bool = false

func _ready() -> void:
	current_health = max_health
	health_changed.emit(current_health)

func take_damage(amount: float) -> void:
	if is_invulnerable:
		return
		
	current_health = max(current_health - amount, 0)
	health_changed.emit(current_health)
	damage_taken.emit(amount)
	
	if current_health <= 0:
		health_depleted.emit()
	
	# Invulnerability frames
	if invulnerable_time > 0:
		is_invulnerable = true
		await get_tree().create_timer(invulnerable_time).timeout
		is_invulnerable = false

func heal(amount: float) -> void:
	current_health = min(current_health + amount, max_health)
	health_changed.emit(current_health)

func reset() -> void:
	current_health = max_health
	health_changed.emit(current_health)
	is_invulnerable = false
