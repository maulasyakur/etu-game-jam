extends Control

var health = 5
var max_health = 5
var warn_health = 2

func _ready():
	$bleed_timer.wait_time = 5
	$bleed_timer.start()

func _decrease_health():
	health -= 1
	
	health = clamp(health, 0, max_health)
	$healthback/healthbar.value = health
	
func _on_bleed_timer_timeout():
	_decrease_health()
