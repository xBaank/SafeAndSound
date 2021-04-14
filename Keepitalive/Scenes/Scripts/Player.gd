extends KinematicBody2D

var tile_size = 16
var turn = false
var move_speed = 2

var die = false

var down = 0
var up = 0
var right = 0
var left = 0

var w = "w"
var s = "s"
var d = "d"
var a = "a"


func _ready():
	position.snapped(Vector2(tile_size,tile_size))
	$Transition.play("Ready")
func _physics_process(delta):
	if !die:
		movement()
	
	
	if left != 0:
		$Doctor.flip_h = true
	elif right != 0:
		$Doctor.flip_h = false
	
	if die:
		$AnimationPlayer.play("Die")
		#Global_variables.attacktime = 1
		#Global_variables.Levelnumber = 1
		yield(get_tree().create_timer(1),"timeout")
		get_tree().change_scene("res://Scenes/Levels/Level"+  String(Global_variables.Levelnumber) +".tscn")
	


func movement():
	#move_input()
	
	
	if up == 0 && down == 0 && right == 0 && left == 0:
		turn = false
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
	
	


func _input(event):
	if Input.is_action_just_pressed(w) && !$Up.is_colliding() && !turn:
		up = tile_size
		turn = true
		$AnimationPlayer.play("Move")
		$Jump.play()
		$Jump.play()
		#Global_variables.enemymove = true
	if Input.is_action_just_pressed(s) && !$Down.is_colliding() && !turn:
		down = tile_size
		turn = true
		$AnimationPlayer.play("Move")
		$Jump.play()
		#Global_variables.enemymove = true
	if Input.is_action_just_pressed(d) && !$Right.is_colliding() && !turn:
		right = tile_size
		turn = true
		$AnimationPlayer.play("Move")
		$Jump.play()
		#Global_variables.enemymove = true
	if Input.is_action_just_pressed(a) && !$Left.is_colliding() && !turn:
		left = tile_size
		turn = true
		$AnimationPlayer.play("Move")
		$Jump.play()


func _on_Area2D_body_entered(body):
	if body.is_in_group("Enemies"):
		die = true
		$Die.play()
		


func _on_Area2D_area_entered(area):
	if area.is_in_group("Hamster"):
		$Tp.play()
		$Transition.play("SceneChange")
		$CollisionShape2D.disabled = true
		$Area2D/CollisionShape2D2.disabled = true
		yield($Transition,"animation_finished")
		Global_variables.Levelnumber += 1
		get_tree().change_scene("res://Scenes/Levels/Level"+  String(Global_variables.Levelnumber) +".tscn")
		Global_variables.attacktime -= 0.1
