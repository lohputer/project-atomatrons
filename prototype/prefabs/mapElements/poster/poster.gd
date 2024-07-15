extends Node2D

@export var posterContent = ""
var posterNode = preload("res://prefabs/mapElements/poster/poster_content.tscn")
const contentDict = {
	"DIFFUSION" : preload("res://assets/posters/diffusion.PNG"),
	"RESPIRATORY": preload("res://assets/posters/respiration.PNG"),
	"ROOT": preload("res://assets/posters/rootPoster.PNG"),
}
var in_radius = false
var instantiatedPosterNode = posterNode.instantiate()
var isOpenned = false;
var firstTimeOpenning = true;
const id = "poster"
# Called when the node enters the scene tree for the first time.
func _ready():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("use_item") and in_radius:
		isOpenned = not isOpenned
		print(isOpenned)
		
	if isOpenned:	
		if posterContent:
			instantiatedPosterNode.get_child(0).texture = contentDict[posterContent]
		instantiatedPosterNode.position = Vector2(0, 0)
		instantiatedPosterNode.visible = true
		instantiatedPosterNode.z_index = 3
		$"../player".add_child(instantiatedPosterNode)
	else:
		instantiatedPosterNode.visible = false 
		

func _on_area_2d_body_entered(body):
	if body.name == "player":
		in_radius = true
		if firstTimeOpenning:
			isOpenned = true
			firstTimeOpenning = false

func _on_area_2d_body_exited(body):
	if body.name == "player":
		isOpenned = false
		in_radius = false
		#instantiatedPosterNode.queue_free()
		#instantiatedPosterNode = posterNode.instantiate()
		instantiatedPosterNode.visible = false
