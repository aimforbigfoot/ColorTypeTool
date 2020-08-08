extends Control


func _on_Button_pressed() -> void:
	get_tree().change_scene("res://src/gameScreen/GameScene.tscn")
	


func _on_Button2_pressed() -> void:
	$AnimationPlayer.play("to_philo")
