extends CanvasLayer

func _on_salir_button_pressed():
	get_tree().change_scene_to_file("res://Escenas/main.tscn")
	get_tree().paused = false


func _on_reiniciar_button_pressed():
	get_tree().paused = false
	get_tree().reload_current_scene()
