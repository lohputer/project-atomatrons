extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	$Keypad.visible = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_area_2d_body_entered(body):
	$Keypad.visible = true
