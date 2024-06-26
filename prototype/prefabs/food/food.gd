extends TextureButton

# Called when the node enters the scene tree for the first time.
@export var foodType = "BERRIES"

func _ready():
	pass # Replace with function body.

func _on_pressed():
	PlayerInfo.player_speed_modifier = 1.5
	if foodType == "BERRIES":
		PlayerInfo.carbs += 10
		PlayerInfo.vitC += 20
	elif foodType == "SPINACH":
		pass
	visible = false
	PlayerInfo.player_speed_modifier = 1
	queue_free()
