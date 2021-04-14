extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _physics_process(delta):
	if get_parent().get_node("Player").position < position:
		$AnimationPlayer.play("Left")
	else:
		$AnimationPlayer.play("Right")
