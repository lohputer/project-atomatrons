extends CharacterBody2D

@export var move_Speed = 100
@export var carbs = 50
@export var proteins = 50
@export var fats = 50
@export var vitC = 50
@export var vitD = 50
@export var calcium = 50
@export var iron = 50

var id = "player"
var player_direction: Vector2
func _physics_process(delta):
	player_direction = Input.get_vector("left", "right", "up", "down")
	velocity = player_direction * move_Speed
	if player_direction[0] > 0: #right
		$Untitled.flip_h = true
	elif player_direction[0] < 0: 
		$Untitled.flip_h = false
	move_and_slide()
	PlayerInfo.player_pos = global_position
	
