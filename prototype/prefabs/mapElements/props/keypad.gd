extends Node2D

var answer = "9145"
var code = ""
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.zzzzzzzzzzzzzzzzzzzzzzzzzzsza

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_button_pressed():
	if code == answer:
		$player/Warning.text = "Correct!"
	else:
		$player/Warning.text = "Oof, that's not the correct code"

func _on_line_edit_text_changed(new_text):
	code = new_text
