extends Control

var lives_pos = Vector2.ZERO
var lives_index = 30
onready var Indicator = load("res://Menus/Indicator.tscn")

func _ready():
	lives_pos.x = 20
	lives_pos.y = Global.VP.y - 20
	update_score()
	update_level()
	update_lives()


func update_lives():
	for child in $Indicator.get_children():
	  child.queue_free()
	for i in range(Global.lives):
	  var indicator = Indicator.instance()
	  indicator.position = lives_pos + Vector2(lives_index*i, 0)
	  $Indicator.add_child(indicator)
#
#func _on_Timer_timeout():
#	Global.time -= 1
#	update_time()
#	if Global.time <= 0:
#	  var _scene = get_tree().change_scene("res://UI/End_Game.tscn")


func _on_Restart_pressed():
	Global.reset()
	var _scene = get_tree().change_scene("res://Game.tscn")


func _on_Quit_pressed():
	get_tree().quit()
