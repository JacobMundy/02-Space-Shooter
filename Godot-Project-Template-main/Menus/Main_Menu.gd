extends Control

func _ready():
	pass

func _on_Play_pressed():
	var _scene = get_tree().change_scene("res://Game.tscn")


func _on_Quit_pressed():
	get_tree().quit()


func _on_Timer_timeout():
	var background = get_node("Label2")
	background.percent_visible += 0.00025
