extends Node2D

 # this is an id for an item 

const ItemsDict = {
	"TOMATO" : preload("res://assets/food/tomato.png"),
	"BERRIES": preload("res://assets/food/berries.png"),
	"SPINACH": preload("res://assets/food/spinach.png"),
}
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
func initialiseItem(itemType):
	
	if itemType in ItemsDict:
		
		var sprite2d = Sprite2D.new()
		sprite2d.texture = ItemsDict[itemType]
		
		add_child(sprite2d)
	
	else:
		print("OI BOZO THAT ISNT A VALID ITEM:", itemType)
		push_error()
	
