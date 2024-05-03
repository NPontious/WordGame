extends Node2D

func _ready():
	self.pressed.connect(letter_out)

func letter_out():
	#get_parent().get_node("LogicScript").guess = "mix"
	var shuffled = get_parent().get_node("LogicScript").shuffled
	get_parent().get_node("LogicScript").shuffle_array(shuffled)
	var number = 0
	for child in get_parent().get_node("Buttons").get_children():
		child.letter = shuffled[number]
		var label = child.get_node("Label")
		label.text = shuffled[number]
		number += 1
