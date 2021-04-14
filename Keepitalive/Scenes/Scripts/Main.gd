extends Node2D

var a
# Called when the node enters the scene tree for the first time.
func _ready():
	$Timer.wait_time = Global_variables.attacktime


# warning-ignore:unused_argument
func _physics_process(delta):
	var pos = $Navigation2D/TileMap.world_to_map(get_global_mouse_position())
	a = $Navigation2D/TileMap.get_cellv(pos)
	print(a)
	if Global_variables.enemymove:
		for i in $Navigation2D/Enemies.get_children():
			var path = $Navigation2D.get_simple_path(i.position,$Player.position)
			var move = path[1] - path[0]
			move = Vector2(sign(move.x),sign(move.y))
			i.move(move)
		Global_variables.enemymove = false
		


func _on_Timer_timeout():
	Global_variables.enemymove = true
