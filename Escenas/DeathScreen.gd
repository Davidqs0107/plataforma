extends CanvasLayer

func _on_salir_button_pressed():
	get_tree().quit()


func _on_reiniciar_button_pressed():
	get_tree().paused = false
	get_tree().reload_current_scene()
