extends StaticBody2D
class_name food
var foodName : String
var carbs : int
var proteins : int
var fats : int
var vitC : int
var vitD : int
var calcium : int
var iron : int
# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if foodName == "berries":
		carbs = 10
		vitC = 10
	elif foodName == "spinach":
		iron = 10
		calcium = 10
