extends Node2D

export var locked = true


func _ready():
	pass # Replace with function body.



func _process(delta):
	
	if locked:
		pass
	else:
		$StaticBody2D/CollisionShape2D.disabled = true
		$AnimatedSprite.animation = "Opend"
