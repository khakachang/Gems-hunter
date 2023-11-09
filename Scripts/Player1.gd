extends Area2D

@export var speed : float = 100

@export var joystick_left : VirtualJoystick

@export var joystick_right : VirtualJoystick

var move_vector := Vector2.ZERO
var look_vector := Vector2.ZERO
func _process(delta: float) -> void:
#	# Movement using the joystick output:
#	if joystickLeft and joystickLeft.is_pressed():
#		position += joystickLeft.get_output() * speed * delta
	
	# Movement using Input functions: (For Move)
	move_vector = Vector2.ZERO
	move_vector.x = Input.get_axis("move_left", "move_right")
	move_vector.y = Input.get_axis("move_up", "move_down")
	position += move_vector * speed * delta
	
	#Fliiping player based on movement joystick
	if joystick_left.is_pressed and !joystick_right.is_pressed:
		$gun.rotation = joystick_left.output.angle()
		print(joystick_left.output.angle())
		if joystick_left.output.angle() > -1.5 or joystick_left.output.angle() < 1.5:
			$AnimatedSprite2D.scale.x = 0.08
			$gun.scale.y = 0.06
		if joystick_left.output.angle() < -1.5 or joystick_left.output.angle() > 1.5:
			$AnimatedSprite2D.scale.x = -0.08
			$gun.scale.y = -0.06
	#if move_vector < Vector2(0,0):
		#$AnimatedSprite2D.scale.x = -0.08
	#if move_vector > Vector2(0,0):
		#$AnimatedSprite2D.scale.x = 0.08
		
	#Animation
	if move_vector == Vector2(0,0):
		$AnimatedSprite2D.play("Idle")
		$gun.play("idle")
	if move_vector != Vector2(0,0):
		$AnimatedSprite2D.play("Walk")
		$gun.play("walk")
	
	#input For look/firing
	look_vector = Vector2.ZERO
	look_vector.x = Input.get_axis("look_left", "look_right")
	look_vector.y = Input.get_axis("look_up", "look_down")
	
	
	if joystick_right.is_pressed:
		#Firing Angle
		$gun.rotation = joystick_right.output.angle()
		#flipping Player Sprite and gun based on firing joystick
		if joystick_right.output.angle() > -1.5 or joystick_right.output.angle() < 1.5:
			$gun.scale.y = 0.06
			$AnimatedSprite2D.scale.x = 0.08
		if joystick_right.output.angle() < -1.5 or joystick_right.output.angle() > 1.5:
			$gun.scale.y = -0.06
			$AnimatedSprite2D.scale.x = -0.08
	
	#if look_vector < Vector2(0,0):
		#$AnimatedSprite2D.scale.x = -0.08
		#$WeaponR1.scale.y = -0.03
	#if look_vector > Vector2(0,0):
		#$AnimatedSprite2D.scale.x = 0.08
		#$WeaponR1.scale.y = 0.03
	# Rotation:
	#if joystick_right and joystick_right.is_pressed:
		#rotation = joystick_right.output.angle()
