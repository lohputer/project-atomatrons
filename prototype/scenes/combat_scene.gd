extends Node2D
var turn_finished = false
var child_1: atomatron_battle
var child_2: atomatron_battle
func _ready():
	#add atomatrons here first
	
	child_1 = $entities.get_child(0) as atomatron_battle
	child_2 = $entities.get_child(1) as atomatron_battle
	turn_manage()
func _on_button_pressed():
	GlobalFunctions.load_to("res://scenes/test_field.tscn")

func turn_manage():
	var fast_child: atomatron_battle
	var slow_child: atomatron_battle
	#sort and put child 1/ child 2 into the fast and slow things
	if child_1.speed > child_2.speed:
		fast_child = child_1
		slow_child = child_2
	elif child_1.speed < child_2.speed:
		fast_child = child_2
		slow_child = child_1
	elif child_1.speed == child_2.speed:
		if randi_range(0,1) == 1:
			fast_child = child_1
			slow_child = child_2
		else:
			slow_child = child_1
			fast_child = child_2
	#turns
	fast_child.turn()
	for i in 7200:
		if turn_finished:
			turn_finished = false
			slow_child.turn()
			for t in 7200:
				if turn_finished:
					turn_finished = false
					turn_manage()
					return
				await get_tree().create_timer(0.03).timeout
			turn_manage()
			return
		await get_tree().create_timer(0.03).timeout
		slow_child.turn()
		for t in 7200:
			if turn_finished:
				turn_finished = false
				turn_manage()
				return
			await get_tree().create_timer(0.03).timeout
		turn_manage()
		return
	
		
		
	
