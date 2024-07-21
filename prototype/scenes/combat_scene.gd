extends Node2D
var turn_finished = false
var child_1: atomatron_battle
var child_2: atomatron_battle
func _ready():
	
	
	#clear all atomatrons under entities
	for i in $entities.get_children():
		i.queue_free()
	
	#add new atomatrons
	

	#add atomatrons here first
	child_1 = $entities.get_child(0) as atomatron_battle
	child_2 = $entities.get_child(1) as atomatron_battle

func _on_button_pressed():
	GlobalFunctions.load_to("res://scenes/test_field.tscn")


		
		
	
