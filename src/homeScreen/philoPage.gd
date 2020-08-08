extends Control

onready var anim_player := get_parent().get_node("AnimationPlayer")

func _on_back_button_pressed() -> void:
	anim_player.play("to_main")
