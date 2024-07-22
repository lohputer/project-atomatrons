extends Node2D

const id = "entrance_mechanic_doorway"
# Called when the node enters the scene tree for the first time.

var bodyEntered = false;

func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_area_2d_body_entered(body):
	bodyEntered = true
