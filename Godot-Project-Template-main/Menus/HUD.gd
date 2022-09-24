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

func update_score():
	$Score.text = "Score: " + str(Global.score)

func update_level():
	$Level.text = "Level: " + str(Global.level)

func update_lives():
	for child in $Indicator.get_children():
	  child.queue_free()
	for i in range(Global.lives - 1):
	  var indicator = Indicator.instance()
	  indicator.position = lives_pos + Vector2(lives_index*i, 0)
	  $Indicator.add_child(indicator)

func _physics_process(_delta):
	update_level()

func _on_Restart_pressed():
	Global.reset()
	var _scene = get_tree().change_scene("res://Game.tscn")


func _on_Quit_pressed():
	get_tree().quit()

func _on_Continue_pressed():
	var Menu = get_node("/root/Game/UI/Menu")
	get_tree().paused = false
	Menu.hide()
	

func _unhandled_input(event):
	if event.is_action_pressed("menu"):
		var Menu = get_node_or_null("/root/Game/UI/Menu")
		if Menu == null:
			get_tree().quit()
		else:
			if Menu.visible:
				get_tree().paused = false
				Menu.hide()
			else:
				get_tree().paused = true
				Menu.show()

