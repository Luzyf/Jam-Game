extends KinematicBody2D

export var  speed = 200#walkingspeed


var velocity = Vector2()

var bullet = preload("res://Scenes/Player/Bullet.tscn")# easy fire skript
#class_name Weapon
onready var current_weapon: Weapon = $Weaponmaster/Pistol
var weapon_nummber = 0

var weapons: Array = []


func _ready() :
	weapons = $Weaponmaster.get_children()
	for weapon in weapons:
		weapon.hide()
	current_weapon.show()
	$Ammoniton/RichTextLabel.text = String (current_weapon.clip)+ "|" +String (current_weapon.reserve_ammo)
	

func get_current_weapon() -> Weapon:
	return current_weapon
	
func switch_weapon(weapon: Weapon):
	if weapon == current_weapon:
		return
	current_weapon.hide()
	weapon.show()
	current_weapon = weapon
	$Ammoniton/RichTextLabel.text = String (current_weapon.clip) +"|" +  String (current_weapon.reserve_ammo)
func _physics_process(_delta):
	if  Input.is_action_pressed("fire") and !current_weapon.semi_auto:
		current_weapon.shoot(rotation)
		$Ammoniton/RichTextLabel.text = String (current_weapon.clip) +"|" +  String (current_weapon.reserve_ammo)
	elif Input.is_action_just_pressed("fire") :#and current_weapon.semi_auto:
		current_weapon.shoot(rotation)
		  
		$Ammoniton/RichTextLabel.text = String (current_weapon.clip)+"|" +  String (current_weapon.reserve_ammo)
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
	
	
func _unhandled_input(event: InputEvent) -> void:
	
	if event.is_action_released("reload"):
		current_weapon.start_reload()
	elif event.is_action_released("weapon+"):
		 
		
		weapon_nummber += 1
		if weapon_nummber == weapons.size():
			weapon_nummber = 0
		switch_weapon(weapons[weapon_nummber])
	elif event.is_action_released("weapon-"):
		weapon_nummber -= 1
		if weapon_nummber < 0:
			weapon_nummber = weapons.size() -1
		switch_weapon(weapons[weapon_nummber])
	elif event.is_action_released("weapon 1"):
		if 0 <= weapons.size() -1:
			switch_weapon(weapons[0])
		
	elif event.is_action_released("weapon 2"):
		if 1 <= weapons.size() -1:
			switch_weapon(weapons[1])
	elif event.is_action_released("weapon 3"):
		if 2 <= weapons.size() -1:
			switch_weapon(weapons[2])
