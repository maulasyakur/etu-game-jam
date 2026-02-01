extends Node2D

@onready var timer: Timer = $Timer
@onready var enemy_path = preload("res://enemy.tscn")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var enemy_instance = enemy_path.instantiate()
	add_child(enemy_instance)
	var random_number = randi_range(5,20)
	print(random_number)
	timer.start(random_number)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_timer_timeout() -> void:
	print("on spawner timer timeout")
	var enemy_instance = enemy_path.instantiate()
	add_child(enemy_instance)
	var random_number = randf() * 5
	timer.start(random_number)
