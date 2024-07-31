extends atomatron_battle
@onready var attack_dialogue = load("res://dialouge/attack_dialooge.dialogue")
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
		GlobalFunctions.move_announced = "aqua inferno! reacts explosively with water, dealing heavy damage!"
		GlobalFunctions.current_mover = "magnesium"
		DialogueManager.show_example_dialogue_balloon(attack_dialogue, "start")
		await GlobalFunctions.anounced
		turn_ended.emit()
		_end_turn()
	if behaviour == 2:
		health += 20
		GlobalFunctions.move_announced = "charge absorbtion! releases 2 valence electrons, causing it to become healthier!"
		GlobalFunctions.current_mover = "magnesium"
		DialogueManager.show_example_dialogue_balloon(attack_dialogue, "start")
		await GlobalFunctions.anounced
		turn_ended.emit()
		_end_turn()
		
	if behaviour == 3: 
		speed += 20
		GlobalFunctions.move_announced = "magnesiums light! burns away when in contact with air, causing it to become lighter and faster!"
		GlobalFunctions.current_mover = "magnesium"
		DialogueManager.show_example_dialogue_balloon(attack_dialogue, "start")
		await GlobalFunctions.anounced
		turn_ended.emit()
		_end_turn()
	await get_tree().create_timer(1.5).timeout
	

func _end_turn():
	$"../../Label".visible = false
func _process(delta):
	$"../../enemy health".text = str($".".health) + "speed: " + str(speed)
	$"../../ProgressBar2".value = health
	$"../../ProgressBar2".max_value = max_health
