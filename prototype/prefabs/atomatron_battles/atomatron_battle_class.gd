extends CharacterBody2D
class_name atomatron_battle
@export var max_health: int
var health: int
@export var speed: int
@export var target: atomatron_battle



func get_hit(damage: move_info):
	health -= damage.move_damage
	await get_tree().create_timer(10).timeout
	
