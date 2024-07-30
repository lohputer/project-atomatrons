extends Camera2D

var angle = 0
@export var nausea = false
@export var blood = 100
func _ready():
	pass

func _process(delta):
	if nausea:
		angle += 3 * delta
		offset.x += 3*cos(angle)
		offset.y += 2*sin(angle)
		
	if blood <= 0:
		$ColorRect.modulate = Color(255, 255, 255, 1)
	elif blood != 100:
		$ColorRect.modulate = Color(255, 0, 0, float(float(100-blood)/100))
	else:
		$ColorRect.modulate = Color(255, 255, 255, 0)
		
