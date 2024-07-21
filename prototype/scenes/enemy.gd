extends atomatron_battle
func turn():
	await get_tree().create_timer(5).timeout
	get_parent().get_parent().turn_finished = true
	pass

func _start_turn():
	$"../../Label".visible = true
	await get_tree().create_timer(3).timeout
	turn_ended.emit()
	_end_turn()
	

func _end_turn():
	$"../../Label".visible = false
func _process(delta):
	$"../../enemy health".text = str($".".health)
