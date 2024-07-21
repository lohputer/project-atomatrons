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
	$"../../../player".position = $entrance.position + Vector2(20, 20)
	$"../../../player/Warning".text = location

func _on_exit_area_2d_body_entered(body):
	$"../../../player".position = $exit.position + Vector2(20, 20)
