extends CharacterBody2D

@export var move_Speed = 200

var id = "player"
var player_direction: Vector2
var openInventory = false

func _ready():
	PlayerInfo.player_node = self
	
func _physics_process(delta):
	if not openInventory:
		player_direction = Input.get_vector("left", "right", "up", "down")
		velocity = player_direction * PlayerInfo.player_speed
		
	if player_direction[0] > 0: #right
		$Untitled.flip_h = true
	elif player_direction[0] < 0: 
		$Untitled.flip_h = false
	move_and_slide()
	
	if Input.is_action_just_pressed("open_inventory"):
		var inventoryNode = find_child("Inventory")
		openInventory = not openInventory
		inventoryNode.visible = openInventory
		velocity = Vector2.ZERO
	
	%Stats.text = """
	Player Name: %s
	Carbs: %s
	Proteins: %s
	Fats: %s
	Vitamin C: %s
	Vitamin D: %s
	Calcium: %s
	Iron: %s
	""" % [PlayerInfo.player_name, PlayerInfo.carbs, PlayerInfo.proteins, PlayerInfo.fats, PlayerInfo.vitC, PlayerInfo.vitD, PlayerInfo.calcium, PlayerInfo.iron]
	
	PlayerInfo.player_pos = global_position
	

func _on_area_2d_body_entered(body):
	if body is atomatron_field:
		GlobalFunctions.load_to("res://scenes/test_combat.tscn")


func _on_timer_timeout():
	PlayerInfo.carbs -= 3
	PlayerInfo.proteins -= 3
	PlayerInfo.fats -= 2
	PlayerInfo.vitC -= 1
	PlayerInfo.vitD -= 1
	PlayerInfo.calcium -= 1
	PlayerInfo.iron -= 1
