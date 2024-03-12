extends Control

func _on_start_bttn_pressed():
	get_tree().change_scene_to_file("res://story.tscn")

func _on_opicoesbttn_pressed():
	get_tree().change_scene_to_file("res://instructions.tscn")

func _on_quitbttn_pressed():
	get_tree().quit()
