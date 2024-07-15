extends StaticBody2D

var id = "blocker"
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_area_2d_area_entered(area):
	var body = area.get_parent()
	print(area, body)
	if body.id == "item":
		body.queue_free()
