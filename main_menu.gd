extends Control


@export var game_scene_path : String = "res://game_world.tscn"

func _on_play_button_pressed() -> void:
	get_tree().change_scene_to_file(game_scene_path)

func _on_options_button_pressed() -> void:
	print("Options menu clicked!") # We will placeholder this for now
	
func _on_quit_button_pressed() -> void:
	get_tree().quit()




func _on_playbutton_pressed() -> void:
	pass # Replace with function body.


func _on_quitbutton_pressed() -> void:
	pass # Replace with function body.
