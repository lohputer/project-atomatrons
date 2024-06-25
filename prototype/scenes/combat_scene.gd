extends Node2D

func _ready():
	turn_manage()
func _on_button_pressed():
	GlobalFunctions.load_to("res://scenes/test_field.tscn")

func turn_manage():
	# sort nodes here
	
	#turns
	for i in $entities.get_children():
		i.turn()
		
		
	
