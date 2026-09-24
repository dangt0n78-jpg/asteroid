extends Area2D
class_name Bullet
const speed = 2000.0

func _on_area_entered(area: Area2D) -> void:
	queue_free()
	Stats.score += 10

func _process(delta: float) -> void:
	position += transform.x * speed * delta
	

func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	queue_free()
