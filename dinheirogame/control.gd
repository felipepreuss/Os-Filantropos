extends Control

var has_seen_story = false

func _physics_process(delta):
	if Input.is_action_just_pressed("hotkey"):
		get_tree().change_scene_to_file("res://jgoo.tscn")

func _on_start_bttn_pressed():
	if has_seen_story == false:
		has_seen_story = true
		get_tree().change_scene_to_file("res://story.tscn")
	else:
		get_tree().change_scene_to_file("res://jgoo.tscn")

func _on_opicoesbttn_pressed():
	get_tree().change_scene_to_file("res://instructions.tscn")

func _on_quitbttn_pressed():
	get_tree().quit()
