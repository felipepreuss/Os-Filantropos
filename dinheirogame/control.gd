extends Control


  

func _on_start_bttn_pressed():
	get_tree().change_scene_to_file("res://node_2d.tscn")


func _on_opicoesbttn_pressed():
	pass # Replace with function body.


func _on_quitbttn_pressed():
	get_tree().quit()
