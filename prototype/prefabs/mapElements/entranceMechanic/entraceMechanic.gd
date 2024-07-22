extends Node

var id = "entrance"
@export var location = "nil"
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_area_2d_body_entered(body):
	if body.id == "player":
		$"../../../player".global_position = $exit.global_position + Vector2(20, 200)
		$"../../../player/Warning".text = location

func _on_exit_area_2d_body_entered(body):
	if body.id == "player":
		print('wh wh')
		$"../../../player".global_position = $entrance.global_position + Vector2(20, 200)
