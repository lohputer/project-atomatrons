extends CharacterBody2D

@export var move_Speed = 200

var id = "player"
var player_direction: Vector2
var openInventory = false

var inTallGrass = false


var animationNodeArray = ["runLeft", "runForward", "runBackward", "idle", "left_idle", "forward_idle", "backward_idle"]
var animationType = 4
var currentAnimationNode = animationNodeArray[animationType]

var playerPrevOrientation = Vector2(0,0);

func _ready():
	PlayerInfo.player_node = self
	$Warning.text = ""
	global_position = GlobalFunctions.player_vector
	
	for animName in animationNodeArray:
		var anim = get_node("HidingMask/"+animName)
		anim.play("default")
		anim.visible = false

	
func _physics_process(delta):
	GlobalFunctions.player_vector = global_position
	if not openInventory:
		player_direction = Input.get_vector("left", "right", "up", "down")
		velocity = player_direction * PlayerInfo.player_speed
		if (player_direction.y) > 0:
			animationType = 1
			playerPrevOrientation = player_direction
		elif (player_direction.y) < 0:
			animationType = 2
			playerPrevOrientation = player_direction
		elif abs(player_direction.x) > 0:
			animationType = 0
			playerPrevOrientation = player_direction
		else:
			if abs(playerPrevOrientation.y) > 0:
				if playerPrevOrientation.y > 0:
					animationType = 5
				else:
					animationType = 6
			else:
				animationType = 4
			
	
	for animName in animationNodeArray:
		var anim = get_node("HidingMask/"+animName)
		if animName == animationNodeArray[animationType]:
			anim.visible = true
			continue
		anim.visible = false
	
	currentAnimationNode = get_node("HidingMask/"+animationNodeArray[animationType])
		
	#if player_direction[0] > 0: #right
		#currentAnimationNode.flip_h = true
	#elif player_direction[0] < 0: 
	
	
	
	currentAnimationNode.flip_h = not playerPrevOrientation.x > 0;
	move_and_slide()
	
	if Input.is_action_just_pressed("open_inventory"):
		var inventoryNode = find_child("Inventory")
		openInventory = not openInventory
		inventoryNode.visible = openInventory
		velocity = Vector2.ZERO
	
	$Stats.text = """
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
		
	if inTallGrass:
		$HidingMask.clip_children = true
		$HidingMask.self_modulate = "ffffff"
	else:
		$HidingMask.clip_children = false
		$HidingMask.self_modulate = "ffffff00"
	
	if PlayerInfo.carbs < 50:
		$Camera2D.nausea = true
		PlayerInfo.player_speed_modifier = 0.5

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


func _on_blood_timer_timeout():
	if PlayerInfo.carbs >= 150:
		$Camera2D.blood -= 10
	else:
		$Camera2D.nausea = false
		$Camera2D.blood = 100
	if $Camera2D.blood == 0:
		global_position = $"../mapAreas/lab/Wakeup Point".global_position
	if $Camera2D.blood <= -10:
		$Camera2D.blood = 100
		PlayerInfo.carbs = 100
		PlayerInfo.proteins = 80
		PlayerInfo.fats = 60
		PlayerInfo.vitC = 30
		PlayerInfo.vitD = 15
		PlayerInfo.calcium = 20
		PlayerInfo.iron = 20
		PlayerInfo.inventory = {}
