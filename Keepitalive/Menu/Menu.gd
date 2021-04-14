extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	$MarginContainer/VBoxContainer/VBoxContainer2/TextureButton.grab_focus()


func _physics_process(delta):
	
	if $MarginContainer/VBoxContainer/VBoxContainer2/TextureButton.pressed:
		get_tree().change_scene("res://Scenes/Levels/Level1.tscn")
