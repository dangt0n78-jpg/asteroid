extends CharacterBody2D

const SPEED = 300.0
const rotation_speed = 1.5
var rotation_direction = 0
const acceleration = 15.0
const friction = 5.0
var screen_size
var ivframe = false
const BULLET = preload("uid://cj504n5tnse7j")

func _ready() -> void:
	screen_size = get_viewport_rect().size

func get_input():
	rotation_direction = Input.get_axis("turn_left", "turn_right")
	var input_direction = Input.get_axis("backward", "forward") * SPEED
	
	if input_direction != 0:
		velocity += transform.x * input_direction * acceleration
		velocity = velocity.limit_length(SPEED)
	else:
		velocity = velocity.move_toward(Vector2.ZERO, friction)

func _physics_process(delta: float) -> void:
	get_input()
	rotation += rotation_direction * rotation_speed * delta
	if Input.is_action_just_pressed("shoot"):
		var new_bullet = BULLET.instantiate()
		new_bullet.global_position = $gun.global_position
		new_bullet.rotation = rotation
		get_parent().add_child(new_bullet)
	global_position.x = wrapf(global_position.x, 0, screen_size.x)
	global_position.y = wrapf(global_position.y, 0, screen_size.y)
	move_and_slide()

func respawn():
	position = Vector2(547.0,310.0)
	
	ivframe = true
	modulate.a = 0.5
	
	await get_tree().create_timer(1.0).timeout
	
	ivframe = false
	modulate.a = 1.0
