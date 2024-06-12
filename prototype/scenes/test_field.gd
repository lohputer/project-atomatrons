extends Node2D

var nitrogen_scene = preload("res://prefabs/nitrogen/field/nitrogen_field.tscn")
var spawn_timer = Timer.new()
var despawn_timer = Timer.new()

var player
var spawn_radius = 500
var min_spawn_distance
var max_spawn_distance
var max_nitrogen_instances = 5
var max_food_instances = 10
var nitrogen_instances
var food_instances

func _ready():
	player = get_node("/root/TestField/player")
	
	min_spawn_distance = spawn_radius / 2
	max_spawn_distance = spawn_radius

	spawn_timer.timeout.connect(_on_spawn_timer_timeout)
	despawn_timer.timeout.connect(_on_despawn_timer_timeout)
	
	add_child(spawn_timer)
	add_child(despawn_timer)
	
	start_spawn_timer()

func _update():
	nitrogen_instances = get_tree().get_nodes_in_group("nitrogen")
	food_instances = get_tree().get_nodes_in_group("berries") + get_tree().get_nodes_in_group("tomato") +  get_tree().get_nodes_in_group("spinach")
	
func start_spawn_timer():
	if nitrogen_instances.size() < max_nitrogen_instances:
		var spawn_interval = randf_range(2, 5)
		spawn_timer.set_wait_time(spawn_interval)
		spawn_timer.start()
	if food_instances.size() < max_food_instances:
		var spawn_interval = randf_range(2, 5)
		spawn_timer.set_wait_time(spawn_interval)
		spawn_timer.start()

func _on_spawn_timer_timeout():
	if nitrogen_instances.size() < max_nitrogen_instances:
		var spawn_position = calculate_spawn_position()
		var nitrogen_instance = nitrogen_scene.instantiate()
		nitrogen_instance.position = spawn_position
		add_child(nitrogen_instance)

		var despawn_time = randf_range(10, 15)
		despawn_timer.set_wait_time(despawn_time)
		despawn_timer.start()
		
		if nitrogen_instances.size() + 1 >= max_nitrogen_instances:
			spawn_timer.stop()
	elif food_instances.size() >= max_food_instances:
		spawn_timer.stop()
	if food_instances.size() < max_food_instances:
		var spawn_position = calculate_spawn_position()
		var nitrogen_instance = nitrogen_scene.instantiate()
		nitrogen_instance.position = spawn_position
		add_child(nitrogen_instance)

		var despawn_time = randf_range(10, 15)
		despawn_timer.set_wait_time(despawn_time)
		despawn_timer.start()
		
		if nitrogen_instances.size() + 1 >= max_nitrogen_instances:
			spawn_timer.stop()
	

func _on_despawn_timer_timeout():
	if nitrogen_instances.size() > 0:
		var nitrogen_to_despawn = nitrogen_instances[0]
		nitrogen_to_despawn.queue_free()
		if nitrogen_instances.size() > 1:
			var despawn_time = randf_range(10, 15)
			despawn_timer.set_wait_time(despawn_time)
			despawn_timer.start()
		
		if nitrogen_instances.size() - 1 < max_nitrogen_instances:
			start_spawn_timer()

func calculate_spawn_position():
	var spawn_angle = randf_range(0, 2 * PI)
	var spawn_distance = randf_range(min_spawn_distance, max_spawn_distance)
	var spawn_offset = Vector2(cos(spawn_angle), sin(spawn_angle)) * spawn_distance
	return player.global_position + spawn_offset
