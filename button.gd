extends Node2D

var letter

func _ready():
	self.pressed.connect(letter_out)

func letter_out():
	print(letter)
	get_parent().get_parent().get_node("LogicScript").guess += letter
