extends Node2D

@export var SPAWN_RATE = 60; # /minute
@export var SPAWN_CAP = 100;
@export var SPAWN_WHEN_INSIDE = true;
@export var  SPAWN_TYPE = "hydrogen";
#@export var SPAWN_RANGE = 50;
#@export var DETECTION_RANGE = 150;

var globalScene
var spawnTime = 60.0/SPAWN_RATE
var path
var atomatron_scene
var numberAtomatronsSpawned = 0
var PlayerInDetectionRange = false
var SPAWN_RANGE = 50
var DETECTION_RANGE = 150
# Called when the node enters the scene tree for the first time.

func calculate_spawn_position():
	var spawn_angle = randf_range(0, 2 * PI)
	var spawn_distance = randf_range(0, SPAWN_RANGE)
	var spawn_offset = Vector2(cos(spawn_angle), sin(spawn_angle)) * spawn_distance
	return global_position + spawn_offset

func _ready():
	globalScene = get_node("/root/TestField/")
	var timer = get_node("spawnTimer")
	timer.wait_time = spawnTime
	#SPAWN_RADIUS = get_node("Area2D/CollisionShape2D").shape.radius
	#print(SPAWN_RADIUS)
	get_node("Area2D/CollisionShape2D").shape.radius = SPAWN_RANGE*scale.x
	get_node("DetectRange/CollisionShape2D").shape.radius = DETECTION_RANGE*scale.x
	
	path = "res://prefabs/atomatrons/atomic/"+SPAWN_TYPE+"/"+SPAWN_TYPE+".tscn"	
	
	atomatron_scene = load(path)

func _process(delta):
	pass
	


func _on_spawn_timer_timeout():
	if numberAtomatronsSpawned >= SPAWN_CAP:
		return 0 
	
	if SPAWN_WHEN_INSIDE and not PlayerInDetectionRange:
		return 0
	
	var hydrogenThing = atomatron_scene.instantiate()
	hydrogenThing.position = calculate_spawn_position()
	globalScene.add_child(hydrogenThing)
	if SPAWN_CAP != -1:
		numberAtomatronsSpawned+=1
		



func _on_detect_range_body_entered(body):
	if body.id == "player":
		PlayerInDetectionRange = true

func _on_detect_range_body_exited(body):
	if body.id == "player":
		PlayerInDetectionRange = false
