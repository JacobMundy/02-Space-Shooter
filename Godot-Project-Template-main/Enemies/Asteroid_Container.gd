extends Node2D

onready var Asteroid = load("res://Enemies/Asteroid.tscn")
onready var Enemy = load("res://Enemies/Enemy.tscn")
onready var container = get_node_or_null("/root/Game/Enemy_Container")

func _physics_process(_delta):
	if get_child_count() == 0:
		testFunc()
		enemySpawner()
		
func testFunc():
	var num = Global.level
	while get_child_count() < num:
		var asteroid = Asteroid.instance()
		asteroid.position = Vector2(rand_range(0, Global.VP.x), Global.VP.y -20)
		add_child(asteroid)
	
# Enemy Stuff
func enemySpawner():
	var num = Global.level
	while container.get_child_count() < num/2:
		var enemy = Enemy.instance()
		container.add_child(enemy)
		if position.x >= Global.VP.x:
			queue_free()
