extends Node2D

const inventorySize = 10;
var opennedInventory = false

var inventorySlots = []


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
func addItem(itemName):
	if len(inventorySlots) <= inventorySize:
		inventorySlots.append(itemName)
		return true
	
	else:
		return false
		
func removeItem(itemName):
	if len(inventorySlots) > 0:
		inventorySlots.remove(itemName)
		return true
	
	else:
		return false

