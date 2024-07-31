extends Node2D

var keypadNode = preload("res://prefabs/mapElements/props/keypad.tscn")
var instantiatedKeypad = keypadNode.instantiate()
var id = "chest"
var in_radius = false
var isOpenned = false
var firstTimeOpenning = true
# Called when the node enters the scene tree for the first time.
func _ready():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("use_item") and in_radius:
		isOpenned = not isOpenned
		
	if isOpenned:
		instantiatedKeypad.position = Vector2(0, 0)
		instantiatedKeypad.visible = true
		instantiatedKeypad.z_index = 3
		if instantiatedKeypad.get_parent() != $"../player":
			$"../player".add_child(instantiatedKeypad)
	else:
		instantiatedKeypad.visible = false 
		
func _on_area_2d_body_entered(body):
	if body.name == "player":
		in_radius = true
		if firstTimeOpenning:
			isOpenned = true
			firstTimeOpenning = false

func _on_area_2d_body_exited(body):
	if body.name == "player":
		isOpenned = false
		in_radius = false
		instantiatedKeypad.queue_free()
		instantiatedKeypad = keypadNode.instantiate()
