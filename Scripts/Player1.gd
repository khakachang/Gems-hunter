extends Area2D
signal fired
@export var speed : float = 100

@export var joystick_left : VirtualJoystick

@export var joystick_right : VirtualJoystick

#Bullet
@onready var bulletSchene = load("res://Scenes/bullet.tscn")
var move_vector := Vector2.ZERO
var look_vector := Vector2.ZERO

	
func _process(delta: float) -> void:
	print(position)
	# Movement using Input functions: (For Move)
	move_vector = Vector2.ZERO
	move_vector.x = Input.get_axis("move_left", "move_right")
	move_vector.y = Input.get_axis("move_up", "move_down")
	position += move_vector * speed * delta
	
	#input For look/firing
	look_vector = Vector2.ZERO
	look_vector.x = Input.get_axis("look_left", "look_right")
	look_vector.y = Input.get_axis("look_up", "look_down")
	
	#Fliiping player based on movement joystick
	if joystick_left.is_pressed and !joystick_right.is_pressed:
		move()
	
	#Animation
	animation()
	
	#if look_vector != Vector2(0,0):
		#fire()

	#if joystick_right.is_pressed:
		#gun_rotation()

func move() -> void:
	$gun.rotation = joystick_left.output.angle()
		#print(joystick_left.output.angle())
	if joystick_left.output.angle() > -1.5 or joystick_left.output.angle() < 1.5:
		$AnimatedSprite2D.scale.x = 0.08
		$gun.scale.y = 0.04
	if joystick_left.output.angle() < -1.5 or joystick_left.output.angle() > 1.5:
		$AnimatedSprite2D.scale.x = -0.08
		$gun.scale.y = -0.04

#func fire() -> void:
	#var bullet_instance = bulletSchene.instantiate()
	#bullet_instance.rotation = joystick_right.output.angle()
	#bullet_instance.position = position
	
	#bullet_instance.velocity = Vector2(cos(bullet_instance.rotation), sin(bullet_instance.rotation)) * 200
	#get_parent().add_child(bullet_instance)


#func gun_rotation():
	#$gun/AnimationPlayer.stop()
	#$gun.rotation = joystick_right.output.angle()
		#flipping Player Sprite and gun based on firing joystick
	#if joystick_right.output.angle() > -1.5 or joystick_right.output.angle() < 1.5:
		#$gun.scale.y = 0.04
		#$AnimatedSprite2D.scale.x = 0.08
	#if joystick_right.output.angle() < -1.5 or joystick_right.output.angle() > 1.5:
		#$gun.scale.y = -0.04
		#$AnimatedSprite2D.scale.x = -0.08

func animation():
	if move_vector == Vector2(0,0):
		$AnimatedSprite2D.play("Idle")
		$gun/AnimationPlayer.play("idle")
		#$gun.play("idle")
		
	if move_vector != Vector2(0,0):
		$AnimatedSprite2D.play("Walk")
		$gun/AnimationPlayer.stop()
		#$gun.play("walk")
