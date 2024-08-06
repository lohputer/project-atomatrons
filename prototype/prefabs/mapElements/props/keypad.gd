extends Node2D

@export var answer = "9120"
@export var physics = false
var code = ""
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.zzzzzzzzzzzzzzzzzzzzzzzzzzsza

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_button_pressed():
	if code == answer:
		$"../Warning".text = "Correct!"
	else:
		$"../Warning".text = "Incorrect :("
	if physics:
		pass
		#hold lyndon i passed this cus it was causing error
		

func _on_line_edit_text_changed(new_text):
	code = new_text
