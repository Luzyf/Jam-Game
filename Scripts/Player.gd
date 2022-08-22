extends KinematicBody2D

var speed = 100
var velocity = Vector2()

func _ready():
	pass


func _process(delta):
	velocity = Vector2()
	
	if Input.is_action_pressed("up"):
		velocity.y -= speed
	if Input.is_action_pressed("down"):
		velocity.y += speed
	if Input.is_action_pressed("right"):
		velocity.x += speed
	if Input.is_action_pressed("left"):
		velocity.x -= speed
	
	move_and_slide(velocity)
