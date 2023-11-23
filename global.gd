extends Node

var score_global := 0
var save_path := "user://variable.save"

func load_score():
	if FileAccess.file_exists(save_path):
		var file = FileAccess.open(save_path,FileAccess.READ)
		score_global = file.get_var(score_global)
	else:
		score_global = 0
