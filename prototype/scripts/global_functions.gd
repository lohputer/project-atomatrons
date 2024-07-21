extends Node

var player_atomatron_deployable: String
var enemy_atomatron_deployable: String
func load_to(target: String):
	var loading_Screen = preload("res://prefabs/loading_screen.tscn").instantiate()
	loading_Screen.next_scene_path = target
	get_tree().current_scene.add_child(loading_Screen)

func load_combat(player_atomatron: String, enemy_atomatron: String):
	player_atomatron_deployable = player_atomatron
	enemy_atomatron_deployable = enemy_atomatron
	load_to("res://scenes/test_combat.tscn")
