extends Node2D
@export var posterContent = ""
const contentDict = {
	"DIFFUSION" : preload("res://assets/posters/diffusion.PNG"),
	"RESPIRATORY": preload("res://assets/posters/respiration.PNG"),
	"ROOT": preload("res://assets/posters/rootPoster.PNG"),
}
var in_radius = false

# Called when the node enters the scene tree for the first time.
func _ready():
	if posterContent:
		$posterContent.get_child(0).texture = contentDict[posterContent]

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("use_item") and in_radius:
		$posterContent.position = Vector2(0, 0)
		$posterContent.visible = true
		$posterContent.z_index = 3
		$"../player".add_child($posterContent)

func _on_area_2d_body_entered(body):
	if body.id == "player":
		in_radius = true

func _on_area_2d_body_exited(body):
	if body.id == "player":
		in_radius = false
