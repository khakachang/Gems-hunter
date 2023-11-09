extends Sprite2D

@export var speed : float = 100

@export var joystick_left : VirtualJoystick

@export var joystick_right : VirtualJoystick

var move_vector := Vector2.ZERO

func _process(delta: float) -> void:
#	# Movement using the joystick output:
#	if joystickLeft and joystickLeft.is_pressed():
#		position += joystickLeft.get_output() * speed * delta
	
	# Movement using Input functions:
	#move_vector = Vector2.ZERO
	#move_vector.x = Input.get_axis("ui_left", "ui_right")
	#move_vector.y = Input.get_axis("ui_up", "ui_down")
	#position += move_vector * speed * delta
	
	#making player look left
	if move_vector < Vector2(0,0):
		$AnimatedSprite2D.scale.x = -0.08
	if move_vector > Vector2(0,0):
		$AnimatedSprite2D.scale.x = 0.08
	#idle animation
	
	if move_vector == Vector2(0,0):
		$AnimatedSprite2D.play("Idle")
	#walk animation
	if move_vector != Vector2(0,0):
		$AnimatedSprite2D.play("Walk")
	
	# Rotation:
	if joystick_right and joystick_right.is_pressed:
		rotation = joystick_right.output.angle()
