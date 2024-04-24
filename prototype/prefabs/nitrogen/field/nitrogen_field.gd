extends atomatron_field
@export var speed = 50
var wandering = false
var foundPlayer = false
var id = "hydrogen"

func _ready():
	pass

func _physics_process(delta):
	if not wandering and not foundPlayer:
		wander()
		
	if foundPlayer:
		playerAggressing()
		
	if randi_range(0, 5) == 1:
		pass
	move_and_slide()
	
func playerAggressing():
	#var player = get_node("/TestField/player")
	#var player = get_node("/TestField/player")
	#
	#print(player.global_position)
	velocity = (PlayerInfo.player_pos - global_position).normalized() * speed * 2
	foundPlayer = true
	
	
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
	print("athan does not has big forehead and in fact is really smart")


func _on_area_2d_body_entered(body):
	if body.id == "player":
		print("I chasing... *kneels down*   Oh its you Ding Hong!")
		foundPlayer = true
		await get_tree().create_timer(10).timeout
		print("Ding Hong's willy timer ended")
		foundPlayer = false
