extends Node2D

onready var Enemy = load("res://Enemies/Enemy.tscn")

func _physics_process(_delta):
	if get_child_count() == 0:
		testFunc()
		
func testFunc():
	var num = Global.level
	if num >= 3:
		if get_child_count() < num%2:
			var enemy = Enemy.instance()
			add_child(enemy)
	
