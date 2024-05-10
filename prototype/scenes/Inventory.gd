extends Node2D

var inventoryItemNode = preload("res://prefabs/inventory_item.tscn")
# Called when the node enters the scene tree for the first time.
func _ready():
	addItem("TOMATO")
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func addItem(itemName):
	var instanceOfItem = inventoryItemNode.instantiate()
	instanceOfItem.itemNameId = itemName
	instanceOfItem.position = Vector2(1000, 0)
	
	add_child(instanceOfItem)
