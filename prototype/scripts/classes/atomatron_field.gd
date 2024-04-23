extends CharacterBody2D
class_name atomatron_field
@export var max_health: int #max health
var health: int 
@export var atomatron_battle_path: String #put the path of the fighting atomatron in here
@export var status_effect_permanent: status_effect
func _process(delta):
	if health > max_health:
		health = max_health
	


