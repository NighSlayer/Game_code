extends Node

var rng = RandomNumberGenerator.new()

var cursor = 0
var hero
var clothes
var debt = 1000
var clan_debt = ""
var training = false


func _init():
	rng.randomize()
	hero = class_main_character.new()

func _ready():
	clothes = class_clothes.new()
	
	# Имена персонажей
	var file = FileAccess.open("res://GameData/json/Names_characters.json", FileAccess.READ)
	var names = JSON.parse_string(file.get_as_text())
	file.close()
	name_head_bang_black_mud = names[generate_number(0,49)]
	name_head_bang_iron_pillar = names[generate_number(0,49)]
	name_head_bang_golden_paradise = names[generate_number(0,49)]
	
	# debug
	all_clothes = [[clothes.generate_part("Голова"),clothes.generate_part("Голова")],[clothes.generate_part("В ушах"),clothes.generate_part("В ушах")],[clothes.generate_part("На шее"),clothes.generate_part("На шее")],[clothes.generate_part("На теле"),clothes.generate_part("На теле")],[clothes.generate_part("На руках"),clothes.generate_part("На руках")],[clothes.generate_part("На ногах"),clothes.generate_part("На ногах")],[clothes.generate_part("Стопы"),clothes.generate_part("Стопы")],[clothes.generate_part("Кольца"),clothes.generate_part("Кольца")],[clothes.generate_part("Игрушки"),clothes.generate_part("Игрушки")]]
	#add_child(preload("res://scen/music_controller.tscn").instantiate())
	#add_child(preload("res://scen/main_menu.tscn").instantiate())
	#add_child(preload("res://scen/main_hero_character.tscn").instantiate())
	

func save_game():
	var text_to_save = {}
	for i in range(all_slaves.size()):
		text_to_save["Рабыня " + str(i+1)] = all_slaves[i].save_slave()
	text_to_save["Параметры бара"] = {}
	var json_string = JSON.stringify(text_to_save,"\t")
	var file = FileAccess.open("res://GameData/Save/save_game.json", FileAccess.WRITE)
	file.store_string(json_string)
	file.close()
	#print(data_to_send)
	#print("Герой сохранён как:", "res://GameData/Save/save_game.json")

func now_pressed_button(button):
	if Input.is_mouse_button_pressed(MouseButton.MOUSE_BUTTON_LEFT):
		match button:
			1:
				Input.set_custom_mouse_cursor(load("res://GameData/img/Game/Interface/Cursors/Курсор выкупа нажатая.png"), Input.CURSOR_ARROW , Vector2(0, 0))
			2:
				Input.set_custom_mouse_cursor(load("res://GameData/img/Game/Interface/Cursors/Курсор в подвал нажатая.png"), Input.CURSOR_ARROW , Vector2(0, 0))
			3:
				Input.set_custom_mouse_cursor(load("res://GameData/img/Game/Interface/Cursors/Курсор из подвала нажатая.png"), Input.CURSOR_DRAG , Vector2(0, 0))
	else:
		match button:
			1:
				Input.set_custom_mouse_cursor(load("res://GameData/img/Game/Interface/Cursors/Курсор выкупа.png"), Input.CURSOR_ARROW , Vector2(0, 0))
			2:
				Input.set_custom_mouse_cursor(load("res://GameData/img/Game/Interface/Cursors/Курор в подвал.png"), Input.CURSOR_ARROW , Vector2(0, 0))
			3:
				Input.set_custom_mouse_cursor(load("res://GameData/img/Game/Interface/Cursors/Курсор из подвала.png"), Input.CURSOR_DRAG , Vector2(0, 0))

func generate_number(left, right):
	return rng.randi_range(left, right)

func _process(_delta):
	if cursor == 0:
		if Input.is_mouse_button_pressed(MouseButton.MOUSE_BUTTON_LEFT):
			Input.set_custom_mouse_cursor(load("res://GameData/img/Game/Interface/Cursors/Курсор нажатая.png"), Input.CURSOR_ARROW , Vector2(0, 0))
		else:
			Input.set_custom_mouse_cursor(load("res://GameData/img/Game/Interface/Cursors/Курсор.png"), Input.CURSOR_ARROW , Vector2(0, 0))
	else:
		now_pressed_button(cursor)
	
	if Input.is_action_just_pressed("Debug"):
		if not get_tree().root.has_node("/root/Debug_menu"):
			#print(get_tree().root.has_node("/root/Debug_menu"))
			var menu = preload("res://scen/debug_menu.tscn").instantiate()
			get_tree().root.add_child(menu)
			menu.name = "Debug_menu"
		else:
			get_tree().root.get_node("/root/Debug_menu").set_visible(!get_tree().root.get_node("/root/Debug_menu").is_visible())
		pass


func next_day_time():
	solve_energy_hero()
	for solve_count_work in all_slaves:
		solve_count_work.count_time_work()
	if day_time_interval > 31:
		day_time_interval = 1
		get_node("/root/MainHeroCharacter").update_time(day_time_interval)
	else:
		day_time_interval += 1
		get_node("/root/MainHeroCharacter").update_time(day_time_interval)

func solve_energy_hero():
	if energy_hero_use >= 4:
		energy_hero_use = 1
		get_node("/root/MainHeroCharacter").update_main_hero_energy()
	else:
		energy_hero_use += 1
		get_node("/root/MainHeroCharacter").update_main_hero_energy()

func add_slave(slave : class_slave):
	all_slaves.append(slave)
	
func remove_slave(number : int):
	all_slaves.remove_at(number)

func solve_debt(pay):
	debt -=pay
	if debt <=0:
		debt = null
		clan_debt = null

# Настройка игры
var money = 10000000
var slaves_saled = 0
var now_scene
var home_scene = "res://scen/slum_disrtict.tscn"
var difficult_ratio = 1
var all_clothes = [[],[],[],[],[],[],[],[],[]]
var max_cloths_in_wardrobe = 18
var day_time_interval = 1
var energy_hero_use = 0
var energy_all_hero = 18
var god


# Репутация
var reputations_fractions = [15, 25, 35, 45, 55, 0]
# Настройка мгазина
#var shop_open = false
#var days_shop_worked = 1
#var shop_have_vegetables = 0
#var shop_have_flour_and_cereals = 0
#var shop_have_cheese = 0
#var shop_have_butter = 0
#var shop_have_eggs = 0
#var shop_have_milk = 0
#var shop_have_cream = 0
#var shop_have_meat_frash = 0
#var shop_have_human_meat = 0
## Стоимость товаров у поставщика
#var supplier_margin_shop_vegetables = [4,7]
#var supplier_margin_shop_flour_and_cereals = [2,5]
#var supplier_margin_shop_cheese = [11,14]
#var supplier_margin_shop_butter = [5,8]
#var supplier_margin_shop_eggs = [3,6]
#var supplier_margin_shop_milk = [2,5]
#var supplier_margin_shop_cream = [3,6]
#var supplier_margin_shop_meat_frash = [3,6]
#var supplier_margin_shop_human_meat = [11,14]

# Сцена настройки у главного меню
var settings_scene = false

# Настройка громкости в начале игры
var volume_ratio_master = 0.2
var volume_ratio_music = 0
var volume_ratio_sfx = 1

# Настройка рабов
# Рабы в комнате
var all_slaves = []
var max_slaves = 5
var auctions_ends = false
# Рабы в подвале
var basement_slaves = []
var max_basement_slaves = 5
var using_class_slave = preload("res://gd/Custom classes/Class_slave.gd")

# Имена персонажей
var name_head_bang_black_mud = ""
var name_head_bang_iron_pillar = ""
var name_head_bang_golden_paradise = ""
