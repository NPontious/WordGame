extends Label

func _process(delta):
	var words = get_parent().get_parent().get_node("LogicScript").used_words
	var s = ""
	for i in words:
		s += i + "\n"
	text = s
