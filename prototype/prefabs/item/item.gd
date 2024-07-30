extends TextureButton

# Called when the node enters the scene tree for the first time.
@export var itemType = "BERRIES"
var in_radius = false
var id = "item" 

func _ready():
	pass 
	
func _physics_process(delta):
	if Input.is_action_just_pressed("use_item") and in_radius:
		$"../player/Warning".text = ""
		PlayerInfo.player_speed_modifier = 1.5
		if itemType == "BERRIES":
			PlayerInfo.carbs += 10
			PlayerInfo.vitC += 15
		elif itemType == "SPINACH":
			PlayerInfo.calcium += 5
			PlayerInfo.iron += 10
		elif itemType == "TOMATO":
			PlayerInfo.carbs += 2
			PlayerInfo.vitC += 15
		visible = false
		PlayerInfo.player_speed_modifier = 1
		queue_free()

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
	if in_radius:
		$"../player/Inventory".addItem(itemType)
		visible = false
		$"../player/Warning".text = " "

func _on_area_2d_body_entered(body):
	if body.name == "player" and self.get_parent().get_parent().name != "Inventory":
		in_radius = true
		$"../player/Warning".text = "Press E to eat, or click to place in inventory."

func _on_area_2d_body_exited(body):
	if body.name == "player" and self.get_parent().get_parent().name != "Inventory":
		in_radius = false
		$"../player/Warning".text = " "
