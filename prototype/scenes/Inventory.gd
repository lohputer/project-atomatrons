extends Node2D

var inventoryItemNode = preload("res://prefabs/inventory_item.tscn")
var itemNode = preload("res://prefabs/item/item.tscn")
const itemDict = {
	"TOMATO" : preload("res://assets/food/tomato.png"),
	"BERRIES": preload("res://assets/food/berries.png"),
	"SPINACH": preload("res://assets/food/spinach.png"),
	"PETRI": preload("res://assets/itemImages/petri.jpg")
}
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func addItem(itemName):
	print(itemName)
	var instanceOfItem = inventoryItemNode.instantiate()
	if PlayerInfo.inventory.size() < 10:
		var instanceOfItemNode = itemNode.instantiate()
		instanceOfItemNode.position = instanceOfItem.position
		instanceOfItem.add_child(instanceOfItemNode)		
		instanceOfItemNode.texture_normal = itemDict[itemName]
		instanceOfItemNode.scale /= Vector2(1.5, 1.5) #dont question, this scale somehow works :)
		add_child(instanceOfItem)
		if itemName not in PlayerInfo.inventory:
			PlayerInfo.inventory[itemName] = 1
		else:
			PlayerInfo.inventory[itemName] += 1
	elif itemName in PlayerInfo.inventory:
		PlayerInfo.inventory[itemName] += 1
	else:
		print("Ruh roh too many items")
	print("what.")
	print(typeof(PlayerInfo.inventory))
	print(PlayerInfo.inventory)
