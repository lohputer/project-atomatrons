extends Node2D
class_name turn_manager
@export var current_atomatron: atomatron_battle


func change_turn(atomatron_to_change: atomatron_battle):
	if current_atomatron is atomatron_battle:
		pass
	else:
		print("idiot")
	atomatron_to_change #enter turn
	current_atomatron = atomatron_to_change
	pass
