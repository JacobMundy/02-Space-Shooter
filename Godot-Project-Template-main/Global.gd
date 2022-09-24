extends Node

var VP = Vector2.ZERO

var score = 0
var level = 1
var lives = 0


onready var Asteroid = load("res://Enemies/Asteroid.tscn")


func _ready():
  pause_mode = Node.PAUSE_MODE_PROCESS
  randomize()
  VP = get_viewport().size
  var _signal = get_tree().get_root().connect("size_changed", self, "_resize")
  reset()

func _resize():
  VP = get_viewport().size

func reset():
  get_tree().paused = false
  score = 0
  level = 1
  lives = 4

func update_score(s):
	score += s
	var hud = get_node_or_null("/root/Game/UI/HUD")
	if hud != null:
		hud.update_score()

func update_lives(l):
	lives += l
	if lives == 0:
		var _scene = get_tree().change_scene("res://Menus/GameOverMan.tscn")
	var hud = get_node_or_null("/root/Game/UI/HUD")
	if hud != null:
		hud.update_lives()

func _physics_process(_delta):
	var Asteroid_Container = get_node_or_null("/root/Game/Asteroid_Container")
	var Enemy_Container = get_node_or_null("/root/Game/Enemy_Container")
	var Player_container = get_node_or_null("/root/Game/Player_Container")
	if Asteroid_Container != null and Enemy_Container != null:
		if Asteroid_Container.get_child_count() == 0 and Enemy_Container.get_child_count() == 0 and Player_container.get_child_count() == 1:
			levelUp()


func levelUp():
	var HUD = get_node("/root/Game/UI/HUD")
	level += 1
	if level%2 == 0:
		lives += 1
		HUD.update_lives()
	
