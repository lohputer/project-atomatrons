extends Node
var inventory = {}
var carbs = 100
var proteins = 80
var fats = 60
var vitC = 30
var vitD = 15
var calcium = 20
var iron = 20
var player_pos: Vector2
var player_node: CharacterBody2D
var player_name: String

var player_base_speed = 200
var player_speed_modifier = 1.0
var player_speed = 1

func _process(delta):
	player_speed = player_base_speed * player_speed_modifier
