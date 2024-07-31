extends atomatron_battle
@onready var attack_dialogue = load("res://dialouge/attack_dialooge.dialogue")
signal player_lost
func _ready():
	max_health = 65
	health = max_health
	
func turn():
	$"../../player choices".visible = true
func _start_turn():
	$"../../player choices".visible = true

func _end_turn():
	$"../../player choices".visible = false
	turn_ended.emit()
func _on_attack_pressed():
	
	var newdamage = move_info.new()
	newdamage.move_damage = 25
	newdamage.move_name = "strike"
	newdamage.move_effect = "non"
	target.get_hit(newdamage)
	GlobalFunctions.move_announced = "corrosive! using its corrosive nature to deal damage to the enemy!"
	GlobalFunctions.current_mover = "player"
	DialogueManager.show_example_dialogue_balloon(attack_dialogue, "start")
	await GlobalFunctions.anounced
	_end_turn()
	


func _on_speed_up_pressed():
	speed += 20
	GlobalFunctions.move_announced = "dissociative dash! dissociating in water to form H+ ions, which move around faster!"
	GlobalFunctions.current_mover = "player"
	DialogueManager.show_example_dialogue_balloon(attack_dialogue, "start")
	await GlobalFunctions.anounced
	_end_turn()


func _on_defence_up_pressed():
	GlobalFunctions.move_announced = "effervescence! boosts its health or smth someone add a more detailed description here"
	GlobalFunctions.current_mover = "player"
	health += 20
	DialogueManager.show_example_dialogue_balloon(attack_dialogue, "start")
	await GlobalFunctions.anounced
	_end_turn()

func _process(delta):
	$"../../ProgressBar".value = health
