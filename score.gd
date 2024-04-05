extends Label

var points = 0

func _process(delta):
	points = get_parent().get_parent().get_node("LogicScript").points
	text = str(points)
