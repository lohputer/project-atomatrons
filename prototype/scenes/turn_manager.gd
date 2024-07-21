extends Node2D
class_name turn_manager
@export var current_atomatron: atomatron_battle

func _ready():
	var child_1 = get_child(0) as atomatron_battle
	var child_2 = get_child(1) as atomatron_battle
	if child_1.speed > child_2.speed:
		change_turn(child_1)
	else:
		change_turn(child_2)
	child_1.turn_ended.connect(change_turn.bind(child_2))
	child_2.turn_ended.connect(change_turn.bind(child_1))
	

func change_turn(atomatron_to_change: atomatron_battle):
	if current_atomatron is atomatron_battle:
		pass
	else:
		print("idiot")
	atomatron_to_change #enter turn
	current_atomatron = atomatron_to_change
	current_atomatron._start_turn()
	pass
