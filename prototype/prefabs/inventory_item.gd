extends Node2D

var itemNameId = "TOMATO"; # this is an id for an item 

const ItemsDict = {
	"TOMATO" : preload("res://assets/food/tomato.png"),
	"BERRIES": preload("res://assets/food/berries.png"),
	"SPINACH": preload("res://assets/food/spinach.png"),
}
# Called when the node enters the scene tree for the first time.
func _ready():
	initialiseItem(itemNameId)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
func initialiseItem(itemType):
	
	if itemType in ItemsDict:
		
		itemNameId = itemType
		var sprite2d = Sprite2D.new()
		sprite2d.texture = ItemsDict[itemNameId]
		
		add_child(sprite2d)
		
		
	
	else:
		print("OI BOZO THAT ISNT A VALID ITEM:", itemType)
		push_error()
	
