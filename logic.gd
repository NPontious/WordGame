extends Node

var words = []
var used_words = []
var the_word = ""
var letters = []
var shuffled = []
var points = 0
var run = true
var guess = ""

func _ready():
	words = read_list()
	the_word = pick_word(words)
	letters = char_list(the_word)
	shuffled = letters.duplicate()
	shuffled = shuffle_array(shuffled)
	var number = 0
	for child in get_parent().get_node("Buttons").get_children():
		child.letter = shuffled[number]
		var label = child.get_node("Label")
		label.text = shuffled[number]
		number += 1
	while run:
		await $TouchScreenButtonEnter.released
		print(the_word)
		print(shuffled)
		var curr_word = guess
		process_word(curr_word)

func read_list():
	var file = FileAccess.open("res://words.txt", FileAccess.READ)
	var file_text = file.get_as_text()
	var words = file_text.split("\n")
	file.close()
	return words

func process_word(curr_word):
	if curr_word == "mix":
		shuffle_array(shuffled)
		var number = 0
		for child in get_parent().get_node("Buttons").get_children():
			child.letter = shuffled[number]
			var label = child.get_node("Label")
			label.text = shuffled[number]
			number += 1
	elif curr_word == "bye":
		run = false
	else:
		var letters_in_list = valid_word(curr_word, letters)
		var word_in_list = in_list(curr_word, words)
		var used_word = used_before(curr_word, used_words)
		if letters_in_list and word_in_list and not used_word:
			used_words.append(curr_word)
			points += score_word(curr_word)
		print("You have " + str(points) + " points")

func shuffle_array(array):
	var size = array.size()
	for i in range(size):
		var rand_index = randi() % size
		var temp = array[i]
		array[i] = array[rand_index]
		array[rand_index] = temp
	return array


func pick_word(words):
	var the_word = ""
	while the_word.length() != 7:
		var rand_val = randi_range(0, words.size())
		var the_unfixed_word = words[rand_val]
		the_word = ""
		for i in range(the_unfixed_word.length()):
			var found = true
			for j in range(i):
				if the_unfixed_word[i] == the_unfixed_word[j]:
					found = false
					break
			if found:
				the_word += the_unfixed_word[i]
	return the_word

func char_list(the_word):
	return the_word.split("")

func used_before(curr_word, used_words):
	return used_words.has(curr_word)

func in_list(curr_word, word_list):
	return word_list.has(curr_word)

func valid_word(curr_word, letters):
	for char in curr_word:
		if not letters.has(char):
			return false
	return true

func score_word(curr_word):
	var length = curr_word.length()
	if length < 4:
		return 0
	elif length == 4:
		return 1
	else:
		return length
