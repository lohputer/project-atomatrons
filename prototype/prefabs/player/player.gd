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
func _physics_process(delta):
	player_direction = Input.get_vector("left", "right", "up", "down")
	velocity = player_direction * PlayerInfo.player_speed
	if player_direction[0] > 0: #right
		$Untitled.flip_h = true
	elif player_direction[0] < 0: 
		$Untitled.flip_h = false
	move_and_slide()
	PlayerInfo.player_pos = global_position
	





func _on_area_2d_body_entered(body):
	if body is atomatron_field:
		GlobalFunctions.load_to("res://scenes/test_combat.tscn")
