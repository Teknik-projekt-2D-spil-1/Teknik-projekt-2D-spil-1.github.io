extends Node2D

export var mainWorld : PackedScene




func _on_Play_Game_Button_button_up():
	get_tree().change_scene(mainWorld.resource_path)

