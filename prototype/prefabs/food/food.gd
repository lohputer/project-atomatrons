extends food

var playerInRange = false
var ids = ["berries", "spinach"]
var id = ids[randi_range(0, len(ids)-1)]
# Called when the node enters the scene tree for the first time.
func _ready():
	var foodInfo = food.new()
	foodInfo.name = id
	print(foodInfo.name, foodInfo.iron, foodInfo.carbs, foodInfo.iron == 0)

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
	if Input.is_action_just_pressed("click") and playerInRange:
		print("I do love " + id + "! Yum! Hi Mr Zhou")
		var foodStats = food.new()
		foodStats.carbs = 10
