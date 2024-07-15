extends Node2D
class_name turn_manager
<<<<<<< Updated upstream
@export var current_atomatron: atomatron_battle


func change_turn(atomatron_to_change: atomatron_battle):
	if current_atomatron is atomatron_battle:
		pass
	else:
		print("idiot")
	atomatron_to_change #enter turn
	current_atomatron = atomatron_to_change
	pass
=======
@export var atomatron: atomatron_battle

func _ready():
	change_atomatron_turn(atomatron)

func change_atomatron_turn(atomatron_to_change: atomatron_battle):
	if atomatron is atomatron_battle:
		atomatron._end_turn()
	else:
		print("thats not an atomatron battle class")
	atomatron_to_change._start_turn()
	atomatron = atomatron_to_change
	
>>>>>>> Stashed changes
