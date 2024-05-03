extends Node2D

func _ready():
	self.pressed.connect(letter_out)

func letter_out():
	get_parent().get_node("LogicScript").guess = ""
