extends Node2D

var letter

func _ready():
	self.pressed.connect(letter_out)

func letter_out():
	print(letter)
	get_parent().get_parent().get_node("LogicScript").guess += letter
	
	
func adjust_size(new_size):
	var visual_node = get_node("ButtonSprite") # Replace "ButtonSprite" with the actual node name
	visual_node.rect_min_size = new_size
