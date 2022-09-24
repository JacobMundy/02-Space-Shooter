extends KinematicBody2D

var velocity = Vector2.ZERO
var speed = 500.0
var damage = 1

onready var Explosion = load("res://Effects/Explosion.tscn")
var Effects = null

func _ready():
	velocity = Vector2(0,-speed).rotated(rotation)

func _physics_process(_delta):
	velocity = move_and_slide(velocity, Vector2.ZERO)
	position.x = wrapf(position.x, 0, Global.VP.x)
	position.y = wrapf(position.y, 0, Global.VP.y)
	


func _on_Area2D_body_entered(body):
	if not "Bullet" in body.name:
		if body.has_method("damage"):
			body.damage(damage)
		Effects = get_node_or_null("/root/Game/Effects")
		if Effects != null:
			var explosion = Explosion.instance()
			Effects.add_child(explosion)
			explosion.global_position = global_position
		print(body.name)
		queue_free()


func _on_Timer_timeout():
	queue_free()