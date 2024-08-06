extends Node2D

@export_file var dialogueFileName = "res://dialouge/baseDialogue.dialogue"
@export_file var imageFileName = "res://icon.svg"
@export var topic: String = ""
@export var qNum = 1
var dialogueFile
var questions = {}
var isTalking = false
var isFlipped = false

const id = "NPC"



# Called when the node enters the scene tree for the first time.
func _ready():
	dialogueFile = load(dialogueFileName)
	var file = FileAccess.open("res://dialouge/quiz.txt", FileAccess.READ)
	var content = file.get_as_text()
	content = content.split("TOPIC ")
	
	$talkingAnimation.play("default")
	$idleAnimation.play("default")
	
	for topic in content:
		var lines = []
		if "question: " in topic:
			lines = topic.split("\nquestion: ")
		else:
			lines = topic.split("\nQuestion: ")
		if lines[0]:
			questions[lines[0]] = []
		else:
			continue
		var unsplitted = lines.slice(1,)
		for q in unsplitted:
			var newList = []
			var question = ""
			var options = []
			var correct = ""
			if "options" in q:
				question = q.split("\noptions: ")[0]
				options = q.split("\noptions: ")[1].split("\ncorrect: ")[0]
				options = options.split(", ")
				correct = q.split("\noptions: ")[1].split("\ncorrect: ")[1].split("\n")[0]
			else:
				question = q.split("\nOptions: ")[0]
				options = q.split("\nOptions: ")[1].split("\nCorrect: ")[0]
				options = options.split(", ")
				correct = q.split("\nOptions: ")[1].split("\nCorrect: ")[1].split("\n")[0]
			if options.find(correct,0) != -1:
				correct = options.find(correct,0)
			questions[lines[0]].append([question, options, correct])
	var texture = load(imageFileName)
	$Sprite2D.texture = texture
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$talkingAnimation.flip_h = isFlipped
	$idleAnimation.flip_h = isFlipped
	if isTalking:
		$talkingAnimation.visible = true
		$idleAnimation.visible = false
	else:
		$talkingAnimation.visible = false
		$idleAnimation.visible = true

func pick_random(dict, num, topic):
	var qs = []
	for i in range(num):
		var lst = []
		print(dict.keys())
		if not topic:
			lst = dict[dict.keys()[randi() % len(dict)]]
		else:
			lst = dict[topic]
		while len(lst) == 0:
			lst = dict[dict.keys()[randi() % len(dict)]]
		var rand = randi() % len(lst)
		while lst[rand] in qs:
			rand = randi() % len(lst)
		qs.append(lst[rand])
	return qs

func _on_area_2d_body_entered(body):
	if body.id == "player":
		var q = pick_random(questions, qNum, topic)
		GameState.question = q[0][0]
		GameState.option1 = q[0][1][0]
		GameState.option2 = q[0][1][1]
		GameState.option3 = q[0][1][2]
		GameState.option4 = q[0][1][3]
		GameState.correct =  q[0][1][int(q[0][2])-1]
		DialogueManager.show_example_dialogue_balloon(dialogueFile, "starting_node")
		isTalking = true
		if body.global_position > global_position:
			isFlipped = false
		else:
			isFlipped = true
			
		
		




func _on_area_2d_body_exited(body):
	isTalking = false
	isFlipped = false
