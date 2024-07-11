extends TextureButton

# Called when the node enters the scene tree for the first time.
@export var itemType = "BERRIES"

func _ready():
	pass # Replace with function body.

"""
Standard Food Stats
var carbs = 100 
var proteins = 80
var fats = 60
var vitC = 30
var vitD = 15
var calcium = 20
var iron = 20
"""
func _on_pressed():
	$"../player/Inventory".addItem(itemType)
	visible = false

func _on_area_2d_body_entered(body):
	if body.id == "player":
		$"../player/Warning".text = "Press E to eat, or click to place in inventory."
		if Input.is_action_just_pressed("use"):
			PlayerInfo.player_speed_modifier = 1.5
			if itemType == "BERRIES":
				PlayerInfo.carbs += 10
				PlayerInfo.vitC += 15
			elif itemType == "SPINACH":
				PlayerInfo.calcium += 5
				PlayerInfo.iron += 10
			elif itemType == "TOMATO":
				pass
			visible = false
			PlayerInfo.player_speed_modifier = 1
			queue_free()
			$"../player/Warning".text = ""
