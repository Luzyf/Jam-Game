extends Node2D
class_name Weapon
# don"t change any values in skript !!!
export var bullet_speed = 2000 # speed of the bullet
export var burst = false
export var burstspeed = 0.1 # how fast tje bullets will fire in the burst mode
export var semi_auto = true # if you need to click or hold to fire
export var bulletspread:float = 0# don"t overdue it
export var bullets:float = 1# how many bullets there are per shot or burst
export var max_bullets = 10 # clip size
export var damage =1 
var bulletspreadgenerator = RandomNumberGenerator.new()
var clip = 10

var bullet = preload("res://Scenes/Player/Bullet.tscn")# fire skript
#class_name Weapon
func _ready():
	max_bullets = clip
func shoot(r):
	if Input.is_action_pressed("fire") and $firespeed.is_stopped():
		
		for number in range(bullets,0,-1):
			var bullet_instance = bullet.instance()
			bullet_instance.position = get_global_position() 
			bullet_instance.damage = damage
			bulletspreadgenerator.randomize()
			var random = bulletspreadgenerator.randf_range(-bulletspread,bulletspread)
			bullet_instance.rotation = r + random 
			bullet_instance.apply_impulse(Vector2(),Vector2(bullet_speed,0).rotated(r+ random))
			get_tree().get_root().add_child(bullet_instance)
			if burst:
				yield(get_tree().create_timer(burstspeed),"timeout")
		
		$firespeed.start()
func start_reload():
	pass
