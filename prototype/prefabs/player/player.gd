extends CharacterBody2D

@export var move_Speed = 200

var id = "player"
var player_direction: Vector2
var openInventory = false

var inTallGrass = false


var animationNodeArray = ["runLeft", "runForward", "runBackward", "idle"]
var animationType = 3
var currentAnimationNode = animationNodeArray[animationType]


func _ready():
	PlayerInfo.player_node = self
	$Warning.text = ""
	
	for animName in animationNodeArray:
		var anim = get_node("HidingMask/"+animName)
		anim.play("default")
		anim.visible = false

	
func _physics_process(delta):
	
	if not openInventory:
		player_direction = Input.get_vector("left", "right", "up", "down")
		velocity = player_direction * PlayerInfo.player_speed
		
		if (player_direction.y) == 1:
			animationType = 1
		elif (player_direction.y) == -1:
			animationType = 2
		elif abs(player_direction.x) == 1:
			animationType = 0
		else:
			animationType = 3
	
	for animName in animationNodeArray:
		var anim = get_node("HidingMask/"+animName)
		if animName == animationNodeArray[animationType]:
			anim.visible = true
			continue
		anim.visible = false
	
	currentAnimationNode = get_node("HidingMask/"+animationNodeArray[animationType])
		
	if player_direction[0] > 0: #right
		currentAnimationNode.flip_h = true
	elif player_direction[0] < 0: 
		currentAnimationNode.flip_h = false
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
	
	#Time to add some code for checking deficiency/overconsumption
	
	if inTallGrass:
		$HidingMask.clip_children = true
		$HidingMask.self_modulate = "ffffff"
	else:
		$HidingMask.clip_children = false
		$HidingMask.self_modulate = "ffffff00"

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

