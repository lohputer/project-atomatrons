extends Node2D

var inventoryItemNode = preload("res://prefabs/inventory_item.tscn")
# Called when the node enters the scene tree for the first time.
func _ready():
	addItem("TOMATO")
	addItem("TOMATO")
	addItem("SPINACH")
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func addItem(itemName):
	var instanceOfItem = inventoryItemNode.instantiate()
	if PlayerInfo.inventory.size() < 10:
		instanceOfItem.itemNameId = itemName
		instanceOfItem.scale = Vector2(1,1)
		instanceOfItem.position = Vector2(1000, 0)
		add_child(instanceOfItem)
	else:
		print("Ruh roh too many items")
