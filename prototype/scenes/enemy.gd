extends atomatron_battle
func turn():
	pass
func _process(delta):
	$"../../enemy health".text = str($".".health)
