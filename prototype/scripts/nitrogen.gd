extends CharacterBody2D
@export var speed = 50
var wandering = false

func _physics_process(delta):
	if not wandering:
		wander()
	if randi_range(0, 5) == 1:
		pass
	move_and_slide()
func wander():
	wandering = true
	var wander_x = randi_range(-1,1)
	var wander_y = randi_range(-1, 1)
	velocity = Vector2(wander_x,wander_y) * speed
	await get_tree().create_timer(randi_range(3, 5)).timeout
	velocity = Vector2.ZERO
	await get_tree().create_timer(randi_range(3, 5)).timeout
	wandering = false


func _on_timer_timeout():
	print("athan has big forehead")
