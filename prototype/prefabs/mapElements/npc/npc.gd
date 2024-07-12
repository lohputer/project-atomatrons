extends Node2D

@export_file var dialogueFileName = "res://dialouge/baseDialogue.dialogue"
@export_file var imageFileName = "res://icon.svg"

var dialogueFile;

# Called when the node enters the scene tree for the first time.
func _ready():
	dialogueFile = load(dialogueFileName)
	var texture = load(imageFileName)
	$Sprite2D.texture = texture
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_area_2d_body_entered(body):
	DialogueManager.show_example_dialogue_balloon(dialogueFile, "starting_node")

