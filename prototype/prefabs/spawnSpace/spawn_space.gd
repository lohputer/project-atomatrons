extends Node2D

@export var SPAWN_RATE = 60; # /minute
@export var SPAWN_CAP = 100;
@export var SPAWN_WHEN_INSIDE = false;
@export var  SPAWN_RADIUS = 50;

var globalScene
var spawnTime = 60/SPAWN_RATE

var hydrogen_scene = preload("res://prefabs/atomatrons/atomic/hydrogen/hydrogen.tscn")
# Called when the node enters the scene tree for the first time.

func calculate_spawn_position():
	var spawn_angle = randf_range(0, 2 * PI)
	var spawn_distance = randf_range(0, SPAWN_RADIUS)
	var spawn_offset = Vector2(cos(spawn_angle), sin(spawn_angle)) * spawn_distance
	return global_position + spawn_offset

func _ready():
	globalScene = get_node("/root/TestField/")
	var timer = get_node("spawnTimer")
	timer.wait_time = spawnTime
	
	#var spawnArea = get_node("Area2D")
	
	#spawnArea.Scale = SPAWN_RADIUS


func _process(delta):
	pass
	


func _on_spawn_timer_timeout():
	var hydrogenThing = hydrogen_scene.instantiate()
	hydrogenThing.position = calculate_spawn_position()
	globalScene.add_child(hydrogenThing)
