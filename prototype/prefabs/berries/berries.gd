extends food

var playerInRange = false
var id = "berries";
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_area_2d_body_entered(body):
	print(body.name, body.name == "player")
	if body.name == "player":
		playerInRange = true
		
func _on_area_2d_body_exited(body):
	print(body.name)
	if body.name == "player":
		playerInRange = false

func _on_area_2d_input_event(viewport, event, shape_idx):
	if Input.is_action_just_pressed("click"):
		print("I do love berries! Yum! Hi Mr Zhou")
		var foodStats = food.new()
		foodStats.carbs = 10
