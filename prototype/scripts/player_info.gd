extends Node
var carbs : int
var proteins : int
var fats : int
var vitC : int
var vitD : int
var calcium : int
var iron : int
var player_pos: Vector2
var player_node: CharacterBody2D
var player_name: String

var player_base_speed = 200
var player_speed_modifier = 1.0
var player_speed = 1

func _process(delta):
	player_speed = player_base_speed * player_speed_modifier
