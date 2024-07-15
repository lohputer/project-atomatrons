extends CharacterBody2D
class_name atomatron_battle
@export var max_health: int
var health: int
@export var speed: int
@export var target: atomatron_battle
<<<<<<< Updated upstream

func _start_turn() -> void:
	pass

func _end_turn() -> void:
	pass


=======
signal turn_finished
func _start_turn() -> void:
	pass
func _end_turn() -> void:
	pass
>>>>>>> Stashed changes
func get_hit(damage: move_info):
	health -= damage.move_damage

	
