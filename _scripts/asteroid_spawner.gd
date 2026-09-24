extends Marker2D

const ASTEROID = preload("uid://bl1komk2050vl")


func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_timer_timeout() -> void:
	var new_asteroid = ASTEROID.instantiate()
	new_asteroid.size = randi_range(1,3)
	new_asteroid.global_position = global_position
	get_parent().add_child(new_asteroid)
