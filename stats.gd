extends Control

@onready var notiffication_bar: Control = $"../notifficationBar"
@onready var notiftxt: RichTextLabel = $"../notifficationBar/notiftxt"


var health = 5
var max_health = 5
var warn_health = 2

var energy = 5
var max_energy = 5
var warn_energy = 2

func _ready():
	$'Hungerbar/bleed_timer'.wait_time = 90 #testing doang
	$'Hungerbar/bleed_timer'.start()

func _on_bleed_timer_timeout():
	_decrease_energy()
	_remind_energy()

func _decrease_energy():
	energy -= 1
	energy = clamp(energy, 0, max_energy)
	$Hungerbar/hungerbg/ProgressBar.value = energy

func _remind_energy():
	if $Hungerbar/hungerbg/ProgressBar.value <= warn_energy:
		notiftxt.text = "Watch your hunger"
		notiffication_bar.show()
