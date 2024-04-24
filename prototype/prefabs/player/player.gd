extends CharacterBody2D

@export var move_Speed = 200
@export var carbs = 50
@export var proteins = 50
@export var fats = 50
@export var vitC = 50
@export var vitD = 50
@export var calcium = 50
@export var iron = 50




var id = "player"
var player_direction: Vector2


func _ready():
	PlayerInfo.player_node = self
	PlayerInfo.carbs = 100
	PlayerInfo.fats = 60
	PlayerInfo.proteins = 80
	PlayerInfo.iron = 20
	PlayerInfo.calcium = 20
	PlayerInfo.vitD = 15
	PlayerInfo.vitC = 30
	
func _physics_process(delta):
	player_direction = Input.get_vector("left", "right", "up", "down")
	velocity = player_direction * PlayerInfo.player_speed
	if player_direction[0] > 0: #right
		$Untitled.flip_h = true
	elif player_direction[0] < 0: 
		$Untitled.flip_h = false
	move_and_slide()
	PlayerInfo.player_pos = global_position
	await get_tree().create_timer(10).timeout
	digest()
	await get_tree().create_timer(10).timeout #fix timer send help
	
func digest():
	print(PlayerInfo.carbs, PlayerInfo.proteins, PlayerInfo.fats, PlayerInfo.vitC, PlayerInfo.vitD, PlayerInfo.iron, PlayerInfo.calcium)
	PlayerInfo.carbs -= 3
	PlayerInfo.proteins -= 3
	PlayerInfo.fats -= 2
	PlayerInfo.vitC -= 1
	PlayerInfo.vitD -= 1
	PlayerInfo.calcium -= 1
	PlayerInfo.iron -= 1

func _on_area_2d_body_entered(body):
	if body is atomatron_field:
		GlobalFunctions.load_to("res://scenes/test_combat.tscn")
