extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$score.text = str(Stats.score)

func _on_reset_pressed() -> void:
	get_tree().change_scene_to_file("res://_scenes/menu.tscn")
	Stats.score = 0
