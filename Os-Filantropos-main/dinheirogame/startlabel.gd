extends Label

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if get_node("../../Zeppellin").release_controls == false:
		text = "Pressione A ou → para começar"
	else:
		text = ""
