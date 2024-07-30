extends Node

var id = "entrance"
@export var location = "nil"
# Called when the node enters the scene tree for the first time.
var doorway1
var doorway2
var playerInstance

func _ready():
	doorway1 = $doorway
	doorway2 = $doorway2
	playerInstance = get_tree().current_scene.get_node("player")
	#pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if doorway1.bodyEntered == true:		
		playerInstance.global_position = doorway2.global_position + Vector2(20, 100)
		var playerWarning = playerInstance.get_node("Warning")
		playerWarning.text = location
		doorway1.bodyEntered = false
		
	elif doorway2.bodyEntered == true:
		playerInstance.global_position = doorway1.global_position + Vector2(20, 100)
		doorway2.bodyEntered = false
		
	

#func _on_area_2d_body_entered(body):
	#if body.id == "player":
		#$"../../../player".global_position = $exit.global_position + Vector2(20, 200)
		#$"../../../player/Warning".text = location
#
#func _on_exit_area_2d_body_entered(body):
	#if body.id == "player":
		#print('wh wh')
		#$"../../../player".global_position = $entrance.global_position + Vector2(20, 200)
		
		
