extends Node2D

@export var speed = 400
@export var damage: float = 20.0
@export var pierce_count: int = 1

var enemies_hit: Array = []

func _process(delta: float) -> void:
	position += transform.x * speed * delta

func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	queue_free()


func _on_body_entered(body: Node2D) -> void:
	var health_component = body.find_child("HealthComponent")
	if health_component and health_component is HealthComponent:
		if body in enemies_hit:
			return
		health_component.take_damage(damage)
		enemies_hit.append(body)
		# Check if bullet should be destroyed
		if enemies_hit.size() >= pierce_count:
			_destroy_bullet()

func _destroy_bullet() -> void:
	# Optional: Play hit effect
	queue_free()
