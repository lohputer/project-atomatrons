extends Node2D

var playerScene
var inHideArea = false

var EntitiesInArea = []
const id = "hidearea"

func int_to_hex(n):
	const letterArray = "0123456789abcdef"
	
	return letterArray[int(n/16)] + letterArray[n%16] 

func getGradient(distance):
	return int(255 * min(abs((500-distance)/500), 1))

# Called when the node enters the scene tree for the first time.
func _ready():
	playerScene = get_node("/root/TestField/player")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
		
	for entity in EntitiesInArea:
		entity.visible = inHideArea
		entity.modulate = "ffffff"+int_to_hex(getGradient((playerScene.position-entity.position).length()))

		
	
#var  i = Vector2(2,1)


func _on_area_2d_area_entered(area):
	var body = area.get_parent()
	if body.id == "player":
		playerScene.inTallGrass = true
		inHideArea = true	
	else:	
		EntitiesInArea.append(body)


func _on_area_2d_area_exited(area):
	var body = area.get_parent()
	
	if body.id == "player":
		playerScene.inTallGrass = false
		inHideArea = false
	else:
		EntitiesInArea.erase(body)
		body.modulate = "ffffff"
		body.visible = true
	
