extends Node2D

var plumb = "абвгдеёжзийклмнопрстуфхцчшщъыьэюя"
var dictionary
var filword_size = [17,25]
var sum_of_cells = 17 * 25
var all_symbols = 0
var grid_symbols
var grid_words
var press_queue = []
var puzzle
var words_find = []


func _ready() -> void:
	var file = FileAccess.open("res://GameData/json/Words_filwords.json",FileAccess.READ)
	dictionary =  file.get_as_text()
	file.close() 
	var json = JSON.new()
	json.parse(dictionary)
	dictionary = json.get_data()
	grid_symbols = $GridContainer
	grid_symbols.set_columns(filword_size[1])
	grid_words = $GridContainer2
	grid_words.set_columns(10)
	puzzle = generate_word_search(dictionary)
	generate_grid()
	print(str(puzzle) + "\n")
	display_words(words_find)

func display_words(words_to_find):
	for word in words_to_find:
		var label = Label.new()
		label.set_name(word)
		label.set_text(word)
		label.set_horizontal_alignment(1)
		label.set_vertical_alignment(1)
		label.add_theme_font_override("font", load("res://GameData/Fonts/Аукционист.ttf"))
		label.add_theme_font_size_override("font_size", 40)
		label.set_custom_minimum_size(Vector2(40,40))
		grid_words.add_child(label)
		
	pass

func generate_grid():
	all_symbols = filword_size[0] * filword_size[1]
	for j in range(all_symbols):
		
		
		var button = Button.new()
		button.set_name(str(j))
		button.set_text(str(puzzle[j]))
		button.set_draw_behind_parent(true)
		var stylebox = StyleBoxFlat.new()
		stylebox.set_bg_color(Color("99e499ff"))
		button.set_toggle_mode(true)
		button.set_custom_minimum_size(Vector2(40,40))
		button.add_theme_font_override("font", load("res://GameData/Fonts/Аукционист.ttf"))
		button.add_theme_font_size_override("font_size", 40)
		button.add_theme_stylebox_override("pressed",stylebox)
		button.add_theme_stylebox_override("normal",StyleBoxEmpty.new())
		button.add_theme_stylebox_override("hover",StyleBoxEmpty.new())
		stylebox = StyleBoxFlat.new()
		stylebox.set_bg_color(Color("000000"))
		button.add_theme_stylebox_override("disabled",stylebox)
		button.pressed.connect(_toggled_button.bind(button))
		grid_symbols.add_child(button)
	pass
	
func _toggled_button(toggled_button):
	if toggled_button.is_pressed():
		var sum_of_symbols = ""
		press_queue.append(toggled_button)
		for i in range(press_queue.size()):
			sum_of_symbols += press_queue[i].get_text()
		print(sum_of_symbols)
		if words_find.find(sum_of_symbols) != -1:
			print("Слово нашлось")
			for k in press_queue:
				k.set_disabled(true)
			press_queue = []
			var child = grid_words.get_node(sum_of_symbols)
			child.free()
		
	else:
		var start_delete_queue = int(press_queue.find(toggled_button))
		#print(start_delete_queue)
		#print(press_queue)
		for k in range(start_delete_queue,press_queue.size()):
			press_queue[k].set_pressed(false)
		for k in range(press_queue.size()-1,start_delete_queue-1,-1):
			press_queue.remove_at(k)
	pass

func generate_word_search(word_list: Array):
	var available_words = word_list.duplicate()
	available_words.shuffle()
	var flat_grid = []
	flat_grid.resize(sum_of_cells)
	flat_grid.fill("0")
	var placed_word = []
	for i in range(20):
		var choosen_word = available_words[i]
		words_find.append(choosen_word)
		print(choosen_word)
		var start_word = false
		var queue_word = []
		var placed_symbol = false
		for symbol in choosen_word.length():
			if start_word == false:
				var random_position = randi_range(0,sum_of_cells-1)
				flat_grid[random_position] = choosen_word[symbol]
				queue_word.append(random_position)
				print(queue_word)
				start_word = true
				placed_word.append(true)
			else:
				var direcction = [1,2,3,4]
				direcction.shuffle()
				for dir in direcction:
					match(dir):
						1: 
							if queue_word[-1] - 1 >= 0 and flat_grid[queue_word[-1] - 1] == "0" and queue_word[-1] - 1 % filword_size[1] != 1:
								flat_grid[queue_word[-1] - 1] = choosen_word[symbol]
								queue_word.append(queue_word[-1] - 1)
								placed_symbol = true
								placed_word.append(true)
								break
						2:
							if queue_word[-1] - 1 >= 0 and flat_grid[queue_word[-1] - filword_size[1]] == "0" :
								flat_grid[queue_word[-1] - filword_size[1]] = choosen_word[symbol]
								queue_word.append(queue_word[-1] - filword_size[1])
								placed_symbol = true
								placed_word.append(true)
								break
						3:
							if queue_word[-1] + 1 < sum_of_cells and flat_grid[queue_word[-1] + 1] == "0" and queue_word[-1] + 1 % filword_size[1] != 0 :
								flat_grid[queue_word[-1] + 1] = choosen_word[symbol]
								queue_word.append(queue_word[-1] + 1)
								placed_symbol = true
								placed_word.append(true)
								break
						4:
							if queue_word[-1] + filword_size[1] < sum_of_cells and flat_grid[queue_word[-1] + filword_size[1]] == "0":
								flat_grid[queue_word[-1] + filword_size[1]] = choosen_word[symbol]
								queue_word.append(queue_word[-1] + filword_size[1])
								placed_symbol = true
								placed_word.append(true)
								break
					print(queue_word)
				placed_symbol = false
		print(placed_word.size())
		print(choosen_word.length())
		if placed_word.size() != choosen_word.length():
			words_find.erase(choosen_word)
		placed_word = []
		start_word = false
	
	for trash_symbol in range(sum_of_cells):
		if flat_grid[trash_symbol] == "0":
			flat_grid[trash_symbol] = plumb[randi_range(0,plumb.length()-1)]
	words_find.sort()
	return flat_grid
