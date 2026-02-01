extends State

@export var character_body: CharacterBody2D
@export var speed: float
var players

func Enter() -> void:
	players = get_tree().get_nodes_in_group("player")

func Physics_Update(_delta: float) -> void:
	var player = players[0]
	
	# Calculate direction to player
	var direction = (player.global_position - character_body.global_position).normalized()
	
	# Move toward player
	character_body.velocity = direction * speed
	character_body.move_and_slide()
