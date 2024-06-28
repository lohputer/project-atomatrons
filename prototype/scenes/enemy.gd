extends atomatron_battle
func turn():
	await get_tree().create_timer(5).timeout
	get_parent().get_parent().turn_finished = true
	pass
func _process(delta):
	$"../../enemy health".text = str($".".health)
