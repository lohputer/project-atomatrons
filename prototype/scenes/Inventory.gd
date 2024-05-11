extends Node2D


var inventoryItemNode = preload("res://prefabs/inventory_item.tscn")


# Called when the node enters the scene tree for the first time.

const inventoryItemPositions = [Vector2(-886,-458)]

var inventoryItems = []
var isFull = false
const maxItems = 10
func _ready():
	addItem("TOMATO")
	addItem("ORANGE")
	addItem("ORANGE")
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var itemContainerNode = get_node("inventoryItems")
	for child in itemContainerNode.get_children():
		
		if child.isBeingPressed:
			rearrangeInventory()
			var mousePos = get_local_mouse_position()
			child.position = mousePos
			
			var offsettedMousePos = get_global_mouse_position() - Vector2(-886,-458) - Vector2(250,250)
			
			print(offsettedMousePos)
			
			var generalPosition = (int(offsettedMousePos.y) / 200) * 5+ int(offsettedMousePos.x) / 300
			
			print(generalPosition)
			itemContainerNode.move_child(child, generalPosition)
			
			
		if child.justReleased:
			rearrangeInventory()
			
		#var textureButton = child.get_node("TextureButton")
		#print(textureButton.isBeingPressed)

func rearrangeInventory():
	var counter = 0
	var itemContainerNode = get_node("inventoryItems")
	for child in itemContainerNode.get_children():
		if child != Sprite2D:
			child.position = Vector2(500*(counter%5),0) + Vector2(0,450 * (counter / 5)) + Vector2(-886,-458)
			counter += 1

func addItem(itemName):
	if not isFull: 
		var itemContainerNode = get_node("inventoryItems")
		var instanceOfItem = inventoryItemNode.instantiate()
		instanceOfItem.itemNameId = itemName
		inventoryItems.append(itemName)
		itemContainerNode.add_child(instanceOfItem)
		isFull = len(inventoryItems) == maxItems
		rearrangeInventory()
		
	
		
