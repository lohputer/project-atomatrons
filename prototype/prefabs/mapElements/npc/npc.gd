extends Node2D

@export_file var dialogueFileName = "res://dialouge/baseDialogue.dialogue"
@export_file var imageFileName = "res://icon.svg"
@export var topic = 0 
var dialogueFile
var questions = {}

const id = "NPC"

# Called when the node enters the scene tree for the first time.
func _ready():
	dialogueFile = load(dialogueFileName)
	var file = FileAccess.open("res://dialouge/quiz.txt", FileAccess.READ)
	var content = file.get_as_text()
	content = content.split("TOPIC ")
	for topic in content:
		var lines = topic.split("\nquestion: ")
		if lines[0]:
			questions[int(lines[0])] = []
		else:
			continue
		var unsplitted = lines.slice(1,)
		for q in unsplitted:
			var newList = []
			var question = q.split("\noptions: ")[0]
			var options = q.split("\noptions: ")[1].split("\ncorrect: ")[0]
			options = options.split(", ")
			var correct = q.split("\noptions: ")[1].split("\ncorrect: ")[1].split("\n")[0]
			if len(correct) != 1:
				correct = options.index(correct)
			questions[lines[0]].append([question, options, correct])
	if topic:
		questions = questions[topic]
	var texture = load(imageFileName)
	$Sprite2D.texture = texture
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_area_2d_body_entered(body):
	DialogueManager.show_example_dialogue_balloon(dialogueFile, "starting_node")

