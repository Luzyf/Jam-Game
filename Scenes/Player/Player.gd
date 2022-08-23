extends KinematicBody2D

export var  speed = 200#walkingspeed
export var bullet_speed = 1000
var velocity = Vector2()

onready var anim = $AnimatedSprite

var bullet = preload("res://Scenes/Player/Bullet.tscn")# easy fire skript

func _physics_process(_delta):
	if Input.is_action_just_pressed("fire"):
		var bullet_instance = bullet.instance()
		bullet_instance.position = $Bulletpoint.get_global_position()
		bullet_instance.rotation_degrees = rotation_degrees
		bullet_instance.apply_impulse(Vector2(),Vector2(bullet_speed,0).rotated(rotation))
		get_tree().get_root().add_child(bullet_instance)
		
	

	velocity = Vector2()
	
	if Input.is_action_pressed("down"):
		anim.animation = "Walk Down"
		velocity.y += speed
	if Input.is_action_pressed("left"):
		anim.animation = "Walk Left"
		velocity.x -= speed
	if Input.is_action_pressed("right"):
		anim.animation = "Walk Right"
		velocity.x += speed
	if Input.is_action_pressed("up"):
		anim.animation = "Walk Up"
		velocity.y -= speed
	
	if velocity.y == 0 && velocity.x == 0:
		anim.animation = "Idle"
	
	move_and_slide(velocity)
	
	
	
