extends atomatron_battle

func turn():
	$"../../player choices".visible = true


func _on_attack_pressed():
	pass # attack
	var newdamage = move_info.new()
	newdamage.move_damage = 5
	newdamage.move_name = "strike"
	newdamage.move_effect = "non"
	target.get_hit(newdamage)
	turn_finished = true


func _on_speed_up_pressed():
	pass # speed up


func _on_defence_up_pressed():
	pass # defence up
