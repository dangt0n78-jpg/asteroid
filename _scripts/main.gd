extends Node

func _ready() -> void:
	Stats.took_damaged.connect(update_ui)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	$ui/Label.text = str(Stats.score)

func update_ui(lives_left: int) -> void:
	if lives_left == 2:
		$ui/health3.queue_free()
	elif lives_left == 1:
		$ui/health2.queue_free()
	elif Stats.lives == 0:
		get_tree().change_scene_to_file("res://_scenes/dead.tscn")
		Stats.update_highscore()
