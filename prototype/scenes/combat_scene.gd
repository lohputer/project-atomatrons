extends Node2D


func _on_button_pressed():
	GlobalFunctions.load_to("res://scenes/test_field.tscn")

func turn_manage():
	# sort nodes here
	for i in $entities.get_child(2):
		if i.speed > $entities.get_child(1).speed:
			pass
	
