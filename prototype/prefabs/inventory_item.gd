extends Node2D  

var itemNameId = "TOMATO"; # this is an id for an item 

const ItemsDict = {
	"TOMATO" : preload("res://assets/itemImages/ItemTomato.png"),
	"ORANGE" : preload("res://assets/itemImages/orange.png"),
}
# Called when the node enters the scene tree for the first time.
func _ready():
	initialiseItem(itemNameId)
	pass # Replace with function body.
	
var isBeingPressed = false
var justReleased = false
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	justReleased = false
	
	
	#print(isBeingPressed)
	
func initialiseItem(itemType):
	
	if itemType in ItemsDict:
		
		itemNameId = itemType
		var sprite2d = Sprite2D.new()
		sprite2d.texture = ItemsDict[itemNameId]
		
		add_child(sprite2d)
		
		
	
	else:
		print("OI BOZO THAT ISNT A VALID ITEM:", itemType)
		push_error()

func _on_button_button_down():
	isBeingPressed = true
	

func _on_button_button_up():
	isBeingPressed = false
	justReleased = true
