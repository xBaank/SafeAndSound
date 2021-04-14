extends KinematicBody2D


var tile_size = 16
var move_speed = 2


var down = 0
var up = 0
var right = 0
var left = 0


# Called when the node enters the scene tree for the first time.
func _ready():
	position.snapped(Vector2(tile_size,tile_size))

func _physics_process(delta):
	if  up == 0 && down == 0 && right == 0 && left == 0:
		$AnimationPlayer.play("Idle")
	
	
	if up != 0:
		global_position.y -= move_speed
		up -= move_speed
	if down != 0:
		global_position.y += move_speed
		down -= move_speed
	if right != 0:
		global_position.x += move_speed
		right -= move_speed
	if left != 0:
		global_position.x -= move_speed
		left -= move_speed
	
	
	if left != 0:
		$Sprite.flip_h = true
	elif right != 0:
		$Sprite.flip_h = false


func move(var direction):
	if direction.x == 1 && !$Right.is_colliding():
		right = tile_size
	elif direction.x == -1 && !$Left.is_colliding():
		left = tile_size
	elif direction.y == 1 && !$Down.is_colliding():
		down = tile_size
	elif direction.y == -1 && !$Up.is_colliding():
		up = tile_size
	$AnimationPlayer.play("Move")
