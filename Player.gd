extends KinematicBody2D

export var  speed = 200#walkingspeed
export var bullet_speed = 1000
var velocity = Vector2()

var bullet = preload("res://Scenes/Bullet.tscn")# easy fire skript

func _physics_process(_delta):
	if Input.is_action_just_pressed("fire"):
		var bullet_instance = bullet.instance()
		bullet_instance.position = $Bulletpoint.get_global_position()
		bullet_instance.rotation_degrees = rotation_degrees
		bullet_instance.apply_impulse(Vector2(),Vector2(bullet_speed,0).rotated(rotation))
		get_tree().get_root().add_child(bullet_instance)
		
	
	look_at(get_global_mouse_position())#  player look to the mousposition

	velocity = Vector2()# simple movmentskript
	if Input.is_action_pressed("down"):# 
		velocity.y += speed
	if Input.is_action_pressed("left"):
		velocity.x -= speed
	if Input.is_action_pressed("right"):
		velocity.x += speed
	if Input.is_action_pressed("up"):
		velocity.y -= speed
		
	move_and_slide(velocity)
	
	
	
