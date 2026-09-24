extends Area2D

class_name Aster
var speed = 100.0
var size = 3
var screen_size
const ASTEROID = preload("uid://bl1komk2050vl")

func _ready() -> void:
	screen_size = get_viewport_rect().size
	rotation = randi_range(1, 360)
	match size:
		3:
			scale = Vector2(3.5,3.5)
			speed = 30.0
		2:
			scale = Vector2(1.5,1.5)
			speed = 50.0
		1:
			scale = Vector2(0.75,0.75)
			speed = 75.0

func _process(delta: float) -> void:
	position += transform.x * speed * delta
	$Sprite2D.rotate(delta)
	global_position.x = wrapf(global_position.x, 0, screen_size.x)
	global_position.y = wrapf(global_position.y, 0, screen_size.y)


func _on_body_shape_entered(body_rid: RID, body: Node2D, body_shape_index: int, local_shape_index: int) -> void:
	if body.ivframe == true:
		return
	
	Stats.lives -= 1
	Stats.took_damaged.emit(Stats.lives)
	
	if Stats.lives > 0:
		body.respawn()


func _on_area_entered(area: Area2D) -> void:
	if area is Bullet:
		area.queue_free()
		if size > 1:
			for i in range(2):
				var new_asteroid = ASTEROID.instantiate()
				new_asteroid.size = size - 1
				new_asteroid.global_position = global_position
				get_tree().current_scene.call_deferred("add_child", new_asteroid)
		queue_free()
	if area is Aster:
		rotation = -rotation
