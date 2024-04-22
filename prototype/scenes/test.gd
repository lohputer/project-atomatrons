extends Node2D
@onready var nitrogen = preload("res://scenes/prefabs/nitrogen.tscn")
var nitrogen_limit = 10



#func _on_timer_timeout():
	#if nitrogen_limit > 0:
		#var new_nitrogen = nitrogen.instantiate()
		#new_nitrogen.global_position = Vector2(randf_range(5, 10), randi_range(5, 50))
		#add_child(new_nitrogen)
		#nitrogen_limit -= 1

	
