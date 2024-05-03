extends Node2D

func _ready():
	self.released.connect(letter_out)
	var button_up = false

func letter_out():
	await get_tree().create_timer(0.01).timeout
	get_parent().get_node("LogicScript").guess = ""
