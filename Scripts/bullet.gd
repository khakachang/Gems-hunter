extends Area2D
var velocity:Vector2;
func _process(delta):
	position += velocity * delta
func _on_visible_on_screen_notifier_2d_screen_exited():
	queue_free()
	
