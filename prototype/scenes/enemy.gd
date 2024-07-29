extends atomatron_battle
func _ready():
	health = max_health
func turn():
	await get_tree().create_timer(5).timeout
	get_parent().get_parent().turn_finished = true
	pass

func _start_turn():
	$"../../Label".visible = true
	await get_tree().create_timer(1.5).timeout
	var behaviour = randi_range(1, 3)
	if behaviour == 1:
		var newdamage = move_info.new()
		newdamage.move_damage = 5
		newdamage.move_name = "strike"
		newdamage.move_effect = "non"
		target.get_hit(newdamage)
		turn_ended.emit()
		_end_turn()
	if behaviour == 2:
		health += 20
		turn_ended.emit()
		_end_turn()
	if behaviour == 3: 
		speed += 20
		turn_ended.emit()
		_end_turn()
	await get_tree().create_timer(1.5).timeout
	

func _end_turn():
	$"../../Label".visible = false
func _process(delta):
	$"../../enemy health".text = str($".".health) + "speed: " + str(speed)
	$"../../ProgressBar2".value = health
	$"../../ProgressBar2".max_value = max_health
