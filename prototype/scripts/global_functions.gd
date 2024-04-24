extends Node
func load_to(target: String):
	var loading_Screen = preload("res://prefabs/loading_screen.tscn").instantiate()
	loading_Screen.next_scene_path = target
	get_tree().current_scene.add_child(loading_Screen)
