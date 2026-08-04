extends Node2D

#var call_over_slave = ""
var call_slave = class_slave
var slave_range = 6

func add_button(counter):
	var button = Button.new()
	button.name = "Slave" + str(counter)
	button.set_text(Globaldata.all_slaves[counter].slave_name)
	button.set_custom_minimum_size(Vector2(0,60))
	button.add_theme_font_size_override("font_size",30)
	button.add_theme_font_override("font",load("res://GameData/Fonts/Подпись клавишь.ttf"))
	button.add_theme_stylebox_override("normal",StyleBoxEmpty.new())
	button.add_theme_stylebox_override("pressed",StyleBoxEmpty.new())
	button.add_theme_stylebox_override("hover",StyleBoxEmpty.new())
	button.add_theme_stylebox_override("focus",StyleBoxEmpty.new())
	
	var texturerect = TextureRect.new()
	texturerect.set_texture(load("res://GameData/img/Game/Interface/Задний фон для клавишь.jpg"))
	texturerect.set_expand_mode(1 as TextureRect.ExpandMode)
	texturerect.set_size(Vector2(392,60))
	texturerect.show_behind_parent = true
	button.add_child(texturerect)
	
	button.pressed.connect(_on_button_slave_pressed.bind(Globaldata.all_slaves[counter]))
	return button

func _on_button_slave_pressed(slave_pressed):
	$Status_slave.set_visible(true)
	$Status_slave/PanelContainer/VBoxContainer/Slave_name.set_text(slave_pressed.slave_name)
	$Full_slave.set_texture(load(slave_pressed.img.full))
	$Full_slave.set_visible(true)
	$Show_parametr.set_visible(false)
	$Show_parametr/Show_pictures.set_pressed(false)
	call_slave = slave_pressed
	

func _process(_delta: float) -> void:
	if Input.is_action_just_released("Ускорение"):
		_on_next_dialog_phrase_pressed()

func _ready():
	$Status_slave.set_visible(false)
	$Show_parametr.set_visible(false)
	$Full_slave.set_visible(false)
	$Show_parametr/Pictures.set_visible(false)
	$Show_parametr/Choose_clothes.set_visible(false)
	
	
	MusicController.place_music = "res://GameData/snd/Game/Home/Песенка страхов мультик ничуть нестрашно.mp3"
	#Globaldata.all_slaves.append(class_slave.new())
	
	if get_node_or_null("Slaves/ScrollContainer/VBoxContainer/VBoxContainer"):
		$Slaves/ScrollContainer/VBoxContainer/VBoxContainer.free()
		var vboxcontainer = VBoxContainer.new()
		vboxcontainer.add_theme_constant_override("separation",25)
		vboxcontainer.set_h_size_flags(3)
		vboxcontainer.set_name("VBoxContainer")
		$Slaves/ScrollContainer/VBoxContainer.add_child(vboxcontainer)
	var temporarily_buttons = []
	for i in range(len(Globaldata.all_slaves)):
		temporarily_buttons.append(add_button(i))
		$Slaves/ScrollContainer/VBoxContainer/VBoxContainer.add_child(temporarily_buttons[i])


func _on_back_pressed():
	if Globaldata.training:
		get_tree().change_scene_to_file("res://scen/balance_scen.tscn")
	else:
		get_tree().change_scene_to_file("res://scen/home.tscn")
		MusicController.play_steps("res://GameData/snd/Game/Places/Home/Шаги дома.mp3")
		slave_range = 6
	

func _condition_ready():
	
	var vboxcontainer = VBoxContainer.new()
	vboxcontainer.set_name("VBoxContainer")
	vboxcontainer.add_theme_constant_override("separation", 10)
	$Show_parametr/VBoxContainer.add_child(vboxcontainer)
	
	for slave_conditions in range(11):
		
		var label = Label.new()
		match(slave_conditions):
			0:
				label.set_name("Submission")
				label.set_text("Покорность: " + str(call_slave.condition.submission))
				label.add_theme_color_override("font_color",Color(0,0,0))
				label.add_theme_font_size_override("font_size",30)
				label.add_theme_font_override("font",load("res://GameData/Fonts/Подпись клавишь.ttf"))
				vboxcontainer.add_child(label)
			1:
				label.set_name("Pain")
				label.set_text("Боль: " + str(call_slave.condition.pain))
				label.add_theme_color_override("font_color",Color(0,0,0))
				label.add_theme_font_size_override("font_size",30)
				label.add_theme_font_override("font",load("res://GameData/Fonts/Подпись клавишь.ttf"))
				vboxcontainer.add_child(label)
			2:
				label.set_name("Excitement")
				label.set_text("Возбуждение: " + str(call_slave.condition.excitement))
				label.add_theme_color_override("font_color",Color(0,0,0))
				label.add_theme_font_size_override("font_size",30)
				label.add_theme_font_override("font",load("res://GameData/Fonts/Подпись клавишь.ttf"))
				vboxcontainer.add_child(label)
			3:
				label.set_name("Fear")
				label.set_text("Страх: " + str(call_slave.condition.fear))
				label.add_theme_color_override("font_color",Color(0,0,0))
				label.add_theme_font_size_override("font_size",30)
				label.add_theme_font_override("font",load("res://GameData/Fonts/Подпись клавишь.ttf"))
				vboxcontainer.add_child(label)
			4:
				label.set_name("Despair")
				label.set_text("Отчаяние: " + str(call_slave.condition.despair))
				label.add_theme_color_override("font_color",Color(0,0,0))
				label.add_theme_font_size_override("font_size",30)
				label.add_theme_font_override("font",load("res://GameData/Fonts/Подпись клавишь.ttf"))
				vboxcontainer.add_child(label)
			5:
				label.set_name("Awareness")
				label.set_text("Осознание: " + str(call_slave.condition.awareness))
				label.add_theme_color_override("font_color",Color(0,0,0))
				label.add_theme_font_size_override("font_size",30)
				label.add_theme_font_override("font",load("res://GameData/Fonts/Подпись клавишь.ttf"))
				vboxcontainer.add_child(label)
			6:
				label.set_name("Habit")
				label.set_text("Привычка: " + str(call_slave.condition.habit))
				label.add_theme_color_override("font_color",Color(0,0,0))
				label.add_theme_font_size_override("font_size",30)
				label.add_theme_font_override("font",load("res://GameData/Fonts/Подпись клавишь.ttf"))
				vboxcontainer.add_child(label)
			7:
				label.set_name("Pamperedness")
				label.set_text("Избалованность: " + str(call_slave.condition.pamperedness))
				label.add_theme_color_override("font_color",Color(0,0,0))
				label.add_theme_font_size_override("font_size",30)
				label.add_theme_font_override("font",load("res://GameData/Fonts/Подпись клавишь.ttf"))
				vboxcontainer.add_child(label)
			8:
				label.set_name("Loyalty")
				label.set_text("Преданность: " + str(call_slave.condition.loyalty))
				label.add_theme_color_override("font_color",Color(0,0,0))
				label.add_theme_font_size_override("font_size",30)
				label.add_theme_font_override("font",load("res://GameData/Fonts/Подпись клавишь.ttf"))
				vboxcontainer.add_child(label)
			9:
				label.set_name("Love")
				label.set_text("Влюблённость: " + str(call_slave.condition.love))
				label.add_theme_color_override("font_color",Color(0,0,0))
				label.add_theme_font_size_override("font_size",30)
				label.add_theme_font_override("font",load("res://GameData/Fonts/Подпись клавишь.ttf"))
				vboxcontainer.add_child(label)
			10:
				label.set_name("Embarrassment")
				label.set_text("Смущённость: " + str(call_slave.condition.embarrassment))
				label.add_theme_color_override("font_color",Color(0,0,0))
				label.add_theme_font_size_override("font_size",30)
				label.add_theme_font_override("font",load("res://GameData/Fonts/Подпись клавишь.ttf"))
				vboxcontainer.add_child(label)
			11:
				label.set_name("Jealousy")
				label.set_text("Ревность: " + str(call_slave.condition.jealousy))
				label.add_theme_color_override("font_color",Color(0,0,0))
				label.add_theme_font_size_override("font_size",30)
				label.add_theme_font_override("font",load("res://GameData/Fonts/Подпись клавишь.ttf"))
				vboxcontainer.add_child(label)
		pass


func _on_button_condition_pressed() -> void:
	if $Show_parametr/VBoxContainer.get_node_or_null("VBoxContainer") != null:
		$Show_parametr/VBoxContainer/VBoxContainer.free()
	$Show_parametr/VBoxContainer/Name_parametr.set_text("Состояние")
	call_slave.update_submission()
	_condition_ready()
	$Show_parametr.set_visible(true)
	$Show_parametr/Show_pictures.set_visible(false)

func _apperance_ready():
	$Show_parametr/VBoxContainer/Name_parametr.set_text("Внешний вид")
	
	var vboxcontainer = VBoxContainer.new()
	vboxcontainer.set_name("VBoxContainer")
	vboxcontainer.add_theme_constant_override("separation", 10)
	$Show_parametr/VBoxContainer.add_child(vboxcontainer)
	
	var label = Label.new()
	label.set_name("Beauty")
	label.set_text("Красота: " + call_slave.int_appearance_to_string("Красота"))
	label.add_theme_font_size_override("font_size",30)
	label.add_theme_color_override("font_color",Color(0,0,0))
	vboxcontainer.add_child(label)
	
	label = Label.new()
	label.set_name("Endurance")
	label.set_text("Выносливость: " + call_slave.int_appearance_to_string("Выносливость"))
	label.add_theme_font_size_override("font_size",30)
	label.add_theme_color_override("font_color",Color(0,0,0))
	vboxcontainer.add_child(label)
	
	label = Label.new()
	label.set_name("Softness")
	label.set_text("Нежность: " + call_slave.int_appearance_to_string("Чуствительность"))
	label.add_theme_font_size_override("font_size",30)
	label.add_theme_color_override("font_color",Color(0,0,0))
	vboxcontainer.add_child(label)
	
	label = Label.new()
	label.set_name("Mindness")
	label.set_text("Ум: " + call_slave.int_appearance_to_string("Сообразительность"))
	label.add_theme_font_size_override("font_size",30)
	label.add_theme_color_override("font_color",Color(0,0,0))
	vboxcontainer.add_child(label)
	
	label = Label.new()
	label.set_name("Psysique")
	label.set_text("Телосложение: " + call_slave.int_appearance_to_string("Телосложение"))
	label.add_theme_font_size_override("font_size",30)
	label.add_theme_color_override("font_color",Color(0,0,0))
	vboxcontainer.add_child(label)
	
	label = Label.new()
	label.set_name("Style")
	label.set_text("Стиль: " + call_slave.int_appearance_to_string("Стиль"))
	label.add_theme_font_size_override("font_size",30)
	label.add_theme_color_override("font_color",Color(0,0,0))
	vboxcontainer.add_child(label)
	
	label = Label.new()
	label.set_name("Personality")
	label.set_text("Характер: " + call_slave.int_appearance_to_string("Характер"))
	label.add_theme_font_size_override("font_size",30)
	label.add_theme_color_override("font_color",Color(0,0,0))
	vboxcontainer.add_child(label)
	
	label = Label.new()
	label.set_name("Agility")
	label.set_text("Ловкость: " + call_slave.int_appearance_to_string("Ловкость"))
	label.add_theme_font_size_override("font_size",30)
	label.add_theme_color_override("font_color",Color(0,0,0))
	vboxcontainer.add_child(label)
	
	label = Label.new()
	label.set_name("Strength")
	label.set_text("Сила: " + call_slave.int_appearance_to_string("Сила"))
	label.add_theme_font_size_override("font_size",30)
	label.add_theme_color_override("font_color",Color(0,0,0))
	vboxcontainer.add_child(label)
	pass


func _on_button_apperance_pressed():
	if $Show_parametr/VBoxContainer.get_node_or_null("VBoxContainer") != null:
		$Show_parametr/VBoxContainer/VBoxContainer.free()
	_apperance_ready()
	$Show_parametr.set_visible(true)
	$Show_parametr/Pictures.set_visible(false)
	$Show_parametr/Show_pictures.set_visible(false)


func _on_close_status_appearance_pressed():
	$Check_slave_status/Status_appearance/Info_beauty.set_visible(false)
	$Check_slave_status/Status_appearance/Info_endurance.set_visible(false)
	$Check_slave_status/Status_appearance/Info_softness.set_visible(false)
	$Check_slave_status/Status_appearance/Info_mind.set_visible(false)
	$Check_slave_status/Status_appearance/Info_physique.set_visible(false)
	$Check_slave_status/Status_appearance/Info_style.set_visible(false)
	$Check_slave_status/Status_appearance/Info_personality.set_visible(false)
	$Check_slave_status/Status_appearance.set_visible(false)

func _anatomy_ready():
	
	var vboxcontainer = VBoxContainer.new()
	vboxcontainer.set_name("VBoxContainer")
	vboxcontainer.add_theme_constant_override("separation", 10)
	
	var label = Label.new()
	label.set_name("Boobs_size")
	label.set_text("Размер груди: " + call_slave.stats_to_string("Размер груди"))
	label.add_theme_font_size_override("font_size",30)
	label.add_theme_color_override("font_color",Color(0,0,0))
	vboxcontainer.add_child(label)
	
	label = Label.new()
	label.set_name("Lactation")
	label.set_text("Лактация: " + call_slave.stats_to_string("Лактация"))
	label.add_theme_font_size_override("font_size",30)
	label.add_theme_color_override("font_color",Color(0,0,0))
	vboxcontainer.add_child(label)
	
	label = Label.new()
	label.set_name("Boobs_piercing")
	label.set_text("Пирсинг груди: " + call_slave.stats_to_string("Пирсинг груди"))
	label.add_theme_font_size_override("font_size",30)
	label.add_theme_color_override("font_color",Color(0,0,0))
	vboxcontainer.add_child(label)
	
	label = Label.new()
	label.set_name("Boobs_modification")
	label.set_text("Модификация груди: " + call_slave.stats_to_string("Модификация груди"))
	label.add_theme_font_size_override("font_size",30)
	label.add_theme_color_override("font_color",Color(0,0,0))
	vboxcontainer.add_child(label)
	
	label = Label.new()
	label.set_name("Age")
	label.set_text("Возраст: " + call_slave.stats_to_string("Возраст"))
	label.add_theme_font_size_override("font_size",30)
	label.add_theme_color_override("font_color",Color(0,0,0))
	vboxcontainer.add_child(label)
	
	label = Label.new()
	label.set_name("Pussy")
	label.set_text("Влагалище: " + call_slave.stats_to_string("Влагалище"))
	label.add_theme_font_size_override("font_size",30)
	label.add_theme_color_override("font_color",Color(0,0,0))
	vboxcontainer.add_child(label)
	
	label = Label.new()
	label.set_name("Pussy_in")
	label.set_text("Матка: " + call_slave.stats_to_string("Матка"))
	label.add_theme_font_size_override("font_size",30)
	label.add_theme_color_override("font_color",Color(0,0,0))
	vboxcontainer.add_child(label)
	
	label = Label.new()
	label.set_name("Anus")
	label.set_text("Анус: " + call_slave.stats_to_string("Анус"))
	label.add_theme_font_size_override("font_size",30)
	label.add_theme_color_override("font_color",Color(0,0,0))
	vboxcontainer.add_child(label)
	
	label = Label.new()
	label.set_name("Pussy_piercing")
	label.set_text("Пирсинг влагалища: " + call_slave.stats_to_string("Пирсинг влагалища"))
	label.add_theme_font_size_override("font_size",30)
	label.add_theme_color_override("font_color",Color(0,0,0))
	vboxcontainer.add_child(label)
	
	label = Label.new()
	label.set_name("Pussy_modification")
	label.set_text("Модификация влагалища: " + call_slave.stats_to_string("Модификация влагалища"))
	label.add_theme_font_size_override("font_size",30)
	label.add_theme_color_override("font_color",Color(0,0,0))
	vboxcontainer.add_child(label)
	
	label = Label.new()
	label.set_name("Mark")
	label.set_text("Метка: " + call_slave.stats_to_string("Метка"))
	label.add_theme_font_size_override("font_size",30)
	label.add_theme_color_override("font_color",Color(0,0,0))
	vboxcontainer.add_child(label)
	
	
	$Show_parametr/VBoxContainer.add_child(vboxcontainer)


func _on_button_anatomy_pressed():
	if $Show_parametr/VBoxContainer.get_node_or_null("VBoxContainer") != null:
		$Show_parametr/VBoxContainer/VBoxContainer.free()
	_anatomy_ready()
	$Show_parametr/Show_pictures.set_pressed(false)
	$Show_parametr/Show_pictures.set_visible(true)
	$Show_parametr/Pictures.set_visible(false)
	$Show_parametr.set_visible(true)
	call_slave.update_pictures_anatomy()
	$Show_parametr/Pictures/VBoxContainer/Boobs.set_texture(load(call_slave.img.boobs))
	#$Show_parametr/Pictures/VBoxContainer/Anus.set_texture(load(call_slave.img.anus))
	$Show_parametr/Pictures/VBoxContainer/Pussy.set_texture(load(call_slave.img.pussy))
	$Show_parametr/Pictures/VBoxContainer/Pussy_in.set_texture(load(call_slave.img.pussy_in))


func _skills_ready():

	$Show_parametr/VBoxContainer/Name_parametr.set_text("Навыки")
	
	var vboxcontainer = VBoxContainer.new()
	vboxcontainer.set_name("VBoxContainer")
	vboxcontainer.add_theme_constant_override("separation", 10)
	$Show_parametr/VBoxContainer.add_child(vboxcontainer)
	
	var hboxcontainer = HBoxContainer.new()
	hboxcontainer.set_name("HBoxContainer")
	hboxcontainer.add_theme_constant_override("separation", 10)
	vboxcontainer.add_child(hboxcontainer)
	
	var label = Label.new()
	label.set_name("Housekeeping")
	label.set_text("Домоводство: ")
	label.add_theme_font_size_override("font_size",30)
	label.add_theme_color_override("font_color",Color(0,0,0))
	hboxcontainer.add_child(label)
	
	var texturerect = TextureRect.new()
	texturerect.set_texture(call_slave.skills_to_picture(call_slave.common.housekeeping))
	texturerect.set_expand_mode(3 as TextureRect.ExpandMode)
	texturerect.set_custom_minimum_size(Vector2(0,60))
	hboxcontainer.add_child(texturerect)
	
	hboxcontainer = HBoxContainer.new()
	hboxcontainer.set_name("HBoxContainer")
	hboxcontainer.add_theme_constant_override("separation", 10)
	vboxcontainer.add_child(hboxcontainer)
	
	label = Label.new()
	label.set_name("Cooking")
	label.set_text("Кулинария: ")
	label.add_theme_font_size_override("font_size",30)
	label.add_theme_color_override("font_color",Color(0,0,0))
	hboxcontainer.add_child(label)
	
	texturerect = TextureRect.new()
	texturerect.set_texture(call_slave.skills_to_picture(call_slave.common.cooking))
	texturerect.set_expand_mode(3 as TextureRect.ExpandMode)
	texturerect.set_custom_minimum_size(Vector2(0,60))
	hboxcontainer.add_child(texturerect)
	
	hboxcontainer = HBoxContainer.new()
	hboxcontainer.set_name("HBoxContainer")
	hboxcontainer.add_theme_constant_override("separation", 10)
	vboxcontainer.add_child(hboxcontainer)
	
	label = Label.new()
	label.set_name("medicine")
	label.set_text("Медицина: ")
	label.add_theme_font_size_override("font_size",30)
	label.add_theme_color_override("font_color",Color(0,0,0))
	hboxcontainer.add_child(label)
	
	texturerect = TextureRect.new()
	texturerect.set_texture(call_slave.skills_to_picture(call_slave.common.medicine))
	texturerect.set_expand_mode(3 as TextureRect.ExpandMode)
	texturerect.set_custom_minimum_size(Vector2(0,60))
	hboxcontainer.add_child(texturerect)
	
	hboxcontainer = HBoxContainer.new()
	hboxcontainer.set_name("HBoxContainer")
	hboxcontainer.add_theme_constant_override("separation", 10)
	vboxcontainer.add_child(hboxcontainer)
	
	label = Label.new()
	label.set_name("Paperwork")
	label.set_text("Делопроизводство: ")
	label.add_theme_font_size_override("font_size",30)
	label.add_theme_color_override("font_color",Color(0,0,0))
	hboxcontainer.add_child(label)
	
	texturerect = TextureRect.new()
	texturerect.set_texture(call_slave.skills_to_picture(call_slave.common.paperwork))
	texturerect.set_expand_mode(3 as TextureRect.ExpandMode)
	texturerect.set_custom_minimum_size(Vector2(0,60))
	hboxcontainer.add_child(texturerect)
	
	hboxcontainer = HBoxContainer.new()
	hboxcontainer.set_name("HBoxContainer")
	hboxcontainer.add_theme_constant_override("separation", 10)
	vboxcontainer.add_child(hboxcontainer)
	
	label = Label.new()
	label.set_name("Etiquette_and_rehetoric")
	label.set_text("Этикет и риторика: ")
	label.add_theme_font_size_override("font_size",30)
	label.add_theme_color_override("font_color",Color(0,0,0))
	hboxcontainer.add_child(label)
	
	texturerect = TextureRect.new()
	texturerect.set_texture(call_slave.skills_to_picture(call_slave.common.etiquette_and_rehetoric))
	texturerect.set_expand_mode(3 as TextureRect.ExpandMode)
	texturerect.set_custom_minimum_size(Vector2(0,60))
	hboxcontainer.add_child(texturerect)
	
	hboxcontainer = HBoxContainer.new()
	hboxcontainer.set_name("HBoxContainer")
	hboxcontainer.add_theme_constant_override("separation", 10)
	vboxcontainer.add_child(hboxcontainer)
	
	label = Label.new()
	label.set_name("Combat_traning")
	label.set_text("Боевая подготовка: ")
	label.add_theme_font_size_override("font_size",30)
	label.add_theme_color_override("font_color",Color(0,0,0))
	hboxcontainer.add_child(label)
	
	texturerect = TextureRect.new()
	texturerect.set_texture(call_slave.skills_to_picture(call_slave.common.combat_traning))
	texturerect.set_expand_mode(3 as TextureRect.ExpandMode)
	texturerect.set_custom_minimum_size(Vector2(0,60))
	hboxcontainer.add_child(texturerect)
	
	hboxcontainer = HBoxContainer.new()
	hboxcontainer.set_name("HBoxContainer")
	hboxcontainer.add_theme_constant_override("separation", 10)
	vboxcontainer.add_child(hboxcontainer)
	
	label = Label.new()
	label.set_name("Dancer")
	label.set_text("Танцовщица: ")
	label.add_theme_font_size_override("font_size",30)
	label.add_theme_color_override("font_color",Color(0,0,0))
	hboxcontainer.add_child(label)
	
	texturerect = TextureRect.new()
	texturerect.set_texture(call_slave.skills_to_picture(call_slave.common.dancer))
	texturerect.set_expand_mode(3 as TextureRect.ExpandMode)
	texturerect.set_custom_minimum_size(Vector2(0,60))
	hboxcontainer.add_child(texturerect)
	
	hboxcontainer = HBoxContainer.new()
	hboxcontainer.set_name("HBoxContainer")
	hboxcontainer.add_theme_constant_override("separation", 10)
	vboxcontainer.add_child(hboxcontainer)
	
	label = Label.new()
	label.set_name("Singer")
	label.set_text("Певица: ")
	label.add_theme_font_size_override("font_size",30)
	label.add_theme_color_override("font_color",Color(0,0,0))
	hboxcontainer.add_child(label)
	
	texturerect = TextureRect.new()
	texturerect.set_texture(call_slave.skills_to_picture(call_slave.common.singer))
	texturerect.set_expand_mode(3 as TextureRect.ExpandMode)
	texturerect.set_custom_minimum_size(Vector2(0,60))
	hboxcontainer.add_child(texturerect)
	
	hboxcontainer = HBoxContainer.new()
	hboxcontainer.set_name("HBoxContainer")
	hboxcontainer.add_theme_constant_override("separation", 10)
	vboxcontainer.add_child(hboxcontainer)
	
	label = Label.new()
	label.set_name("Musician")
	label.set_text("Музыкант: ")
	label.add_theme_font_size_override("font_size",30)
	label.add_theme_color_override("font_color",Color(0,0,0))
	hboxcontainer.add_child(label)
	
	texturerect = TextureRect.new()
	texturerect.set_texture(call_slave.skills_to_picture(call_slave.common.musician))
	texturerect.set_expand_mode(3 as TextureRect.ExpandMode)
	texturerect.set_custom_minimum_size(Vector2(0,60))
	hboxcontainer.add_child(texturerect)
	
	hboxcontainer = HBoxContainer.new()
	hboxcontainer.set_name("HBoxContainer")
	hboxcontainer.add_theme_constant_override("separation", 10)
	vboxcontainer.add_child(hboxcontainer)
	
	label = Label.new()
	label.set_name("Animal")
	label.set_text("Животное: ")
	label.add_theme_font_size_override("font_size",30)
	label.add_theme_color_override("font_color",Color(0,0,0))
	hboxcontainer.add_child(label)
	
	texturerect = TextureRect.new()
	texturerect.set_texture(call_slave.skills_to_picture(call_slave.common.animal))
	texturerect.set_expand_mode(3 as TextureRect.ExpandMode)
	texturerect.set_custom_minimum_size(Vector2(0,60))
	hboxcontainer.add_child(texturerect)
	
	hboxcontainer = HBoxContainer.new()
	hboxcontainer.set_name("HBoxContainer")
	hboxcontainer.add_theme_constant_override("separation", 10)
	vboxcontainer.add_child(hboxcontainer)
	
	label = Label.new()
	label.set_name("embroidery")
	label.set_text("Вышивание: ")
	label.add_theme_font_size_override("font_size",30)
	label.add_theme_color_override("font_color",Color(0,0,0))
	hboxcontainer.add_child(label)
	
	texturerect = TextureRect.new()
	texturerect.set_texture(call_slave.skills_to_picture(call_slave.common.embroidery))
	texturerect.set_expand_mode(3 as TextureRect.ExpandMode)
	texturerect.set_custom_minimum_size(Vector2(0,60))
	hboxcontainer.add_child(texturerect)
	
	hboxcontainer = HBoxContainer.new()
	hboxcontainer.set_name("HBoxContainer")
	hboxcontainer.add_theme_constant_override("separation", 10)
	vboxcontainer.add_child(hboxcontainer)
	
	label = Label.new()
	label.set_name("Farming")
	label.set_text("Фермерство: ")
	label.add_theme_font_size_override("font_size",30)
	label.add_theme_color_override("font_color",Color(0,0,0))
	hboxcontainer.add_child(label)
	
	texturerect = TextureRect.new()
	texturerect.set_texture(call_slave.skills_to_picture(call_slave.common.farming))
	texturerect.set_expand_mode(3 as TextureRect.ExpandMode)
	texturerect.set_custom_minimum_size(Vector2(0,60))
	hboxcontainer.add_child(texturerect)

func _on_button_skills_common_pressed() -> void:
	if $Show_parametr/VBoxContainer.get_node_or_null("VBoxContainer") != null:
		$Show_parametr/VBoxContainer/VBoxContainer.free()
	_skills_ready()
	$Show_parametr.set_visible(true)
	$Show_parametr/Pictures.set_visible(false)
	$Show_parametr/Show_pictures.set_visible(false)

func _sex_skills_ready():
	$Show_parametr/VBoxContainer/Name_parametr.set_text("Интимные навыки")
	
	
	var vboxcontainer = VBoxContainer.new()
	vboxcontainer.set_name("VBoxContainer")
	vboxcontainer.add_theme_constant_override("separation", 10)
	vboxcontainer.set_v_size_flags(3)
	$Show_parametr/VBoxContainer.add_child(vboxcontainer)
	
	var scrollcontainer = ScrollContainer.new()
	scrollcontainer.set_name("ScrollContainer")
	scrollcontainer.set_horizontal_scroll_mode(0 as ScrollContainer.ScrollMode)
	scrollcontainer.set_v_size_flags(3)
	vboxcontainer.add_child(scrollcontainer)
	
	vboxcontainer = VBoxContainer.new()
	vboxcontainer.set_name("VBoxContainer")
	vboxcontainer.add_theme_constant_override("separation", 10)
	scrollcontainer.add_child(vboxcontainer)
	
	
	var hboxcontainer = HBoxContainer.new()
	hboxcontainer.set_name("HBoxContainer")
	hboxcontainer.add_theme_constant_override("separation", 10)
	vboxcontainer.add_child(hboxcontainer)
	
	var button = Button.new()
	button.set_name("Petting")
	button.set_text("Петтинг: ")
	button.add_theme_font_size_override("font_size",30)
	button.add_theme_color_override("font_color",Color(0,0,0))
	button.set_toggle_mode(true)
	button.pressed.connect(_sub_menu_ready.bind(button))
	hboxcontainer.add_child(button)
	
	var texturerect = TextureRect.new()
	texturerect.set_texture(call_slave.skills_to_picture(call_slave.sex_skill_petting_average()))
	texturerect.set_expand_mode(3 as TextureRect.ExpandMode)
	texturerect.set_custom_minimum_size(Vector2(0,60))
	hboxcontainer.add_child(texturerect)
	
	hboxcontainer = HBoxContainer.new()
	hboxcontainer.set_name("HBoxContainer2")
	hboxcontainer.add_theme_constant_override("separation", 10)
	vboxcontainer.add_child(hboxcontainer)
	
	button = Button.new()
	button.set_name("Oral")
	button.set_text("Оральные ласки: ")
	button.add_theme_font_size_override("font_size",30)
	button.add_theme_color_override("font_color",Color(0,0,0))
	button.set_toggle_mode(true)
	button.pressed.connect(_sub_menu_ready.bind(button))
	hboxcontainer.add_child(button)
	
	texturerect = TextureRect.new()
	texturerect.set_texture(call_slave.skills_to_picture(call_slave.sex_skill_oral_sex_average()))
	texturerect.set_expand_mode(3 as TextureRect.ExpandMode)
	texturerect.set_custom_minimum_size(Vector2(0,60))
	hboxcontainer.add_child(texturerect)
	
	hboxcontainer = HBoxContainer.new()
	hboxcontainer.set_name("HBoxContainer3")
	hboxcontainer.add_theme_constant_override("separation", 10)
	vboxcontainer.add_child(hboxcontainer)
	
	button = Button.new()
	button.set_name("Penetration")
	button.set_text("Пенетрация: ")
	button.add_theme_font_size_override("font_size",30)
	button.add_theme_color_override("font_color",Color(0,0,0))
	button.set_toggle_mode(true)
	button.pressed.connect(_sub_menu_ready.bind(button))
	hboxcontainer.add_child(button)
	
	texturerect = TextureRect.new()
	texturerect.set_texture(call_slave.skills_to_picture(call_slave.sex_skill_penetration_average()))
	texturerect.set_expand_mode(3 as TextureRect.ExpandMode)
	texturerect.set_custom_minimum_size(Vector2(0,60))
	hboxcontainer.add_child(texturerect)
	
	hboxcontainer = HBoxContainer.new()
	hboxcontainer.set_name("HBoxContainer4")
	hboxcontainer.add_theme_constant_override("separation", 10)
	vboxcontainer.add_child(hboxcontainer)
	
	button = Button.new()
	button.set_name("Group_sex")
	button.set_text("Групповуха: ")
	button.add_theme_font_size_override("font_size",30)
	button.add_theme_color_override("font_color",Color(0,0,0))
	button.set_toggle_mode(true)
	button.pressed.connect(_sub_menu_ready.bind(button))
	hboxcontainer.add_child(button)
	
	texturerect = TextureRect.new()
	texturerect.set_texture(call_slave.skills_to_picture(call_slave.sex_skill_group_sex_average()))
	texturerect.set_expand_mode(3 as TextureRect.ExpandMode)
	texturerect.set_custom_minimum_size(Vector2(0,60))
	hboxcontainer.add_child(texturerect)
	
	hboxcontainer = HBoxContainer.new()
	hboxcontainer.set_name("HBoxContainer5")
	hboxcontainer.add_theme_constant_override("separation", 10)
	vboxcontainer.add_child(hboxcontainer)
	
	button = Button.new()
	button.set_name("Demonstration")
	button.set_text("Демонстрация: ")
	button.add_theme_font_size_override("font_size",30)
	button.add_theme_color_override("font_color",Color(0,0,0))
	button.set_toggle_mode(true)
	button.pressed.connect(_sub_menu_ready.bind(button))
	hboxcontainer.add_child(button)
	
	texturerect = TextureRect.new()
	texturerect.set_texture(call_slave.skills_to_picture(call_slave.sex_skill_demonstration_average()))
	texturerect.set_expand_mode(3 as TextureRect.ExpandMode)
	texturerect.set_custom_minimum_size(Vector2(0,60))
	hboxcontainer.add_child(texturerect)
	
	hboxcontainer = HBoxContainer.new()
	hboxcontainer.set_name("HBoxContainer6")
	hboxcontainer.add_theme_constant_override("separation", 10)
	vboxcontainer.add_child(hboxcontainer)
	
	button = Button.new()
	button.set_name("Fetishism")
	button.set_text("Фетишизм: ")
	button.add_theme_font_size_override("font_size",30)
	button.add_theme_color_override("font_color",Color(0,0,0))
	button.set_toggle_mode(true)
	button.pressed.connect(_sub_menu_ready.bind(button))
	hboxcontainer.add_child(button)
	
	texturerect = TextureRect.new()
	texturerect.set_texture(call_slave.skills_to_picture(call_slave.sex_skill_fetishism_average()))
	texturerect.set_expand_mode(3 as TextureRect.ExpandMode)
	texturerect.set_custom_minimum_size(Vector2(0,60))
	hboxcontainer.add_child(texturerect)
	
	hboxcontainer = HBoxContainer.new()
	hboxcontainer.set_name("HBoxContainer7")
	hboxcontainer.add_theme_constant_override("separation", 10)
	vboxcontainer.add_child(hboxcontainer)
	
	button = Button.new()
	button.set_name("Xenophilia")
	button.set_text("Ксенофилия: ")
	button.add_theme_font_size_override("font_size",30)
	button.add_theme_color_override("font_color",Color(0,0,0))
	button.set_toggle_mode(true)
	button.pressed.connect(_sub_menu_ready.bind(button))
	hboxcontainer.add_child(button)
	
	texturerect = TextureRect.new()
	texturerect.set_texture(call_slave.skills_to_picture(call_slave.sex_skill_xenophilia_average()))
	texturerect.set_expand_mode(3 as TextureRect.ExpandMode)
	texturerect.set_custom_minimum_size(Vector2(0,60))
	hboxcontainer.add_child(texturerect)


func _sub_menu_ready(activator_button):
	
	if !activator_button.is_pressed():
		activator_button.get_parent().get_parent().get_node(activator_button.get_name() + "_sub_stats").free()
	else:
		var subvboxcontainer = VBoxContainer.new()
		subvboxcontainer.set_name(activator_button.get_name() + "_sub_stats")
		subvboxcontainer.add_theme_constant_override("separation", 10)
		activator_button.get_parent().get_parent().add_child(subvboxcontainer)
		activator_button.get_parent().get_parent().move_child(activator_button.get_parent().get_parent().get_node(NodePath(subvboxcontainer.get_name())),activator_button.get_parent().get_index()+1)
		match(activator_button.get_name()):
			"Petting":
				var subhboxcontainer = HBoxContainer.new()
				subhboxcontainer.set_name("HBoxContainer")
				subhboxcontainer.add_theme_constant_override("separation", 10)
				subvboxcontainer.add_child(subhboxcontainer)
				
				var label = Label.new()
				label.set_name("Handjob")
				label.set_text("Работа руками: ")
				label.add_theme_font_size_override("font_size",30)
				label.add_theme_color_override("font_color",Color(0,0,0))
				subhboxcontainer.add_child(label)
				
				var texturerect = TextureRect.new()
				texturerect.set_texture(call_slave.skills_to_picture(call_slave.sexual.handjob))
				texturerect.set_expand_mode(3 as TextureRect.ExpandMode)
				texturerect.set_custom_minimum_size(Vector2(0,60))
				subhboxcontainer.add_child(texturerect)
				
				subhboxcontainer = HBoxContainer.new()
				subhboxcontainer.set_name("HBoxContainer")
				subhboxcontainer.add_theme_constant_override("separation", 10)
				subvboxcontainer.add_child(subhboxcontainer)
				
				label = Label.new()
				label.set_name("Footsjob")
				label.set_text("Работа ногами: ")
				label.add_theme_font_size_override("font_size",30)
				label.add_theme_color_override("font_color",Color(0,0,0))
				subhboxcontainer.add_child(label)
				
				texturerect = TextureRect.new()
				texturerect.set_texture(call_slave.skills_to_picture(call_slave.sexual.footsjob))
				texturerect.set_expand_mode(3 as TextureRect.ExpandMode)
				texturerect.set_custom_minimum_size(Vector2(0,60))
				subhboxcontainer.add_child(texturerect)
				
				subhboxcontainer = HBoxContainer.new()
				subhboxcontainer.set_name("HBoxContainer")
				subhboxcontainer.add_theme_constant_override("separation", 10)
				subvboxcontainer.add_child(subhboxcontainer)
				
				label = Label.new()
				label.set_name("Paizuri")
				label.set_text("Пайзури: ")
				label.add_theme_font_size_override("font_size",30)
				label.add_theme_color_override("font_color",Color(0,0,0))
				subhboxcontainer.add_child(label)
				
				texturerect = TextureRect.new()
				texturerect.set_texture(call_slave.skills_to_picture(call_slave.sexual.paizuri))
				texturerect.set_expand_mode(3 as TextureRect.ExpandMode)
				texturerect.set_custom_minimum_size(Vector2(0,60))
				subhboxcontainer.add_child(texturerect)
			"Oral":
				var subhboxcontainer = HBoxContainer.new()
				subhboxcontainer.set_name("HBoxContainer")
				subhboxcontainer.add_theme_constant_override("separation", 10)
				subvboxcontainer.add_child(subhboxcontainer)
				
				var label = Label.new()
				label.set_name("Blowjob")
				label.set_text("Минет: ")
				label.add_theme_font_size_override("font_size",30)
				label.add_theme_color_override("font_color",Color(0,0,0))
				subhboxcontainer.add_child(label)
				
				var texturerect = TextureRect.new()
				texturerect.set_texture(call_slave.skills_to_picture(call_slave.sexual.blowjob))
				texturerect.set_expand_mode(3 as TextureRect.ExpandMode)
				texturerect.set_custom_minimum_size(Vector2(0,60))
				subhboxcontainer.add_child(texturerect)
				
				subhboxcontainer = HBoxContainer.new()
				subhboxcontainer.set_name("HBoxContainer")
				subhboxcontainer.add_theme_constant_override("separation", 10)
				subvboxcontainer.add_child(subhboxcontainer)
				
				label = Label.new()
				label.set_name("Drink_sperm")
				label.set_text("Спермоглотание: ")
				label.add_theme_font_size_override("font_size",30)
				label.add_theme_color_override("font_color",Color(0,0,0))
				subhboxcontainer.add_child(label)
				
				texturerect = TextureRect.new()
				texturerect.set_texture(call_slave.skills_to_picture(call_slave.sexual.drink_sperm))
				texturerect.set_expand_mode(3 as TextureRect.ExpandMode)
				texturerect.set_custom_minimum_size(Vector2(0,60))
				subhboxcontainer.add_child(texturerect)
			"Penetration":
				var subhboxcontainer = HBoxContainer.new()
				subhboxcontainer.set_name("HBoxContainer")
				subhboxcontainer.add_theme_constant_override("separation", 10)
				subvboxcontainer.add_child(subhboxcontainer)
				
				var label = Label.new()
				label.set_name("Sex")
				label.set_text("Секс: ")
				label.add_theme_font_size_override("font_size",30)
				label.add_theme_color_override("font_color",Color(0,0,0))
				subhboxcontainer.add_child(label)
				
				var texturerect = TextureRect.new()
				texturerect.set_texture(call_slave.skills_to_picture(call_slave.sexual.sex))
				texturerect.set_expand_mode(3 as TextureRect.ExpandMode)
				texturerect.set_custom_minimum_size(Vector2(0,60))
				subhboxcontainer.add_child(texturerect)
				
				subhboxcontainer = HBoxContainer.new()
				subhboxcontainer.set_name("HBoxContainer")
				subhboxcontainer.add_theme_constant_override("separation", 10)
				subvboxcontainer.add_child(subhboxcontainer)
				
				label = Label.new()
				label.set_name("Anal_sex")
				label.set_text("Анальный секс: ")
				label.add_theme_font_size_override("font_size",30)
				label.add_theme_color_override("font_color",Color(0,0,0))
				subhboxcontainer.add_child(label)
				
				texturerect = TextureRect.new()
				texturerect.set_texture(call_slave.skills_to_picture(call_slave.sexual.anal_sex))
				texturerect.set_expand_mode(3 as TextureRect.ExpandMode)
				texturerect.set_custom_minimum_size(Vector2(0,60))
				subhboxcontainer.add_child(texturerect)
			"Group_sex":
				var subhboxcontainer = HBoxContainer.new()
				subhboxcontainer.set_name("HBoxContainer")
				subhboxcontainer.add_theme_constant_override("separation", 10)
				subvboxcontainer.add_child(subhboxcontainer)
				
				var label = Label.new()
				label.set_name("Group")
				label.set_text("Групповуха: ")
				label.add_theme_font_size_override("font_size",30)
				label.add_theme_color_override("font_color",Color(0,0,0))
				subhboxcontainer.add_child(label)
				
				var texturerect = TextureRect.new()
				texturerect.set_texture(call_slave.skills_to_picture(call_slave.sexual.group))
				texturerect.set_expand_mode(3 as TextureRect.ExpandMode)
				texturerect.set_custom_minimum_size(Vector2(0,60))
				subhboxcontainer.add_child(texturerect)
				
				subhboxcontainer = HBoxContainer.new()
				subhboxcontainer.set_name("HBoxContainer")
				subhboxcontainer.add_theme_constant_override("separation", 10)
				subvboxcontainer.add_child(subhboxcontainer)
				
				label = Label.new()
				label.set_name("Bukkake")
				label.set_text("Буккаке: ")
				label.add_theme_font_size_override("font_size",30)
				label.add_theme_color_override("font_color",Color(0,0,0))
				subhboxcontainer.add_child(label)
				
				texturerect = TextureRect.new()
				texturerect.set_texture(call_slave.skills_to_picture(call_slave.sexual.bukkake))
				texturerect.set_expand_mode(3 as TextureRect.ExpandMode)
				texturerect.set_custom_minimum_size(Vector2(0,60))
				subhboxcontainer.add_child(texturerect)
				
				subhboxcontainer = HBoxContainer.new()
				subhboxcontainer.set_name("HBoxContainer")
				subhboxcontainer.add_theme_constant_override("separation", 10)
				subvboxcontainer.add_child(subhboxcontainer)
				
				label = Label.new()
				label.set_name("lesbian_sex")
				label.set_text("Лесбисекс: ")
				label.add_theme_font_size_override("font_size",30)
				label.add_theme_color_override("font_color",Color(0,0,0))
				subhboxcontainer.add_child(label)
				
				texturerect = TextureRect.new()
				texturerect.set_texture(call_slave.skills_to_picture(call_slave.sexual.lesbian_sex))
				texturerect.set_expand_mode(3 as TextureRect.ExpandMode)
				texturerect.set_custom_minimum_size(Vector2(0,60))
				subhboxcontainer.add_child(texturerect)
			"Demonstration":
				var subhboxcontainer = HBoxContainer.new()
				subhboxcontainer.set_name("HBoxContainer")
				subhboxcontainer.add_theme_constant_override("separation", 10)
				subvboxcontainer.add_child(subhboxcontainer)
				
				var label = Label.new()
				label.set_name("Seduction")
				label.set_text("Соблазнение: ")
				label.add_theme_font_size_override("font_size",30)
				label.add_theme_color_override("font_color",Color(0,0,0))
				subhboxcontainer.add_child(label)
				
				var texturerect = TextureRect.new()
				texturerect.set_texture(call_slave.skills_to_picture(call_slave.sexual.seduction))
				texturerect.set_expand_mode(3 as TextureRect.ExpandMode)
				texturerect.set_custom_minimum_size(Vector2(0,60))
				subhboxcontainer.add_child(texturerect)
				
				subhboxcontainer = HBoxContainer.new()
				subhboxcontainer.set_name("HBoxContainer")
				subhboxcontainer.add_theme_constant_override("separation", 10)
				subvboxcontainer.add_child(subhboxcontainer)
				
				label = Label.new()
				label.set_name("Masturbate")
				label.set_text("Мастурбация: ")
				label.add_theme_font_size_override("font_size",30)
				label.add_theme_color_override("font_color",Color(0,0,0))
				subhboxcontainer.add_child(label)
				
				texturerect = TextureRect.new()
				texturerect.set_texture(call_slave.skills_to_picture(call_slave.sexual.masturbate))
				texturerect.set_expand_mode(3 as TextureRect.ExpandMode)
				texturerect.set_custom_minimum_size(Vector2(0,60))
				subhboxcontainer.add_child(texturerect)
			"Fetishism":
				var subhboxcontainer = HBoxContainer.new()
				subhboxcontainer.set_name("HBoxContainer")
				subhboxcontainer.add_theme_constant_override("separation", 10)
				subvboxcontainer.add_child(subhboxcontainer)
				
				var label = Label.new()
				label.set_name("Bdsm")
				label.set_text("БДСМ: ")
				label.add_theme_font_size_override("font_size",30)
				label.add_theme_color_override("font_color",Color(0,0,0))
				subhboxcontainer.add_child(label)
				
				var texturerect = TextureRect.new()
				texturerect.set_texture(call_slave.skills_to_picture(call_slave.sexual.bdsm))
				texturerect.set_expand_mode(3 as TextureRect.ExpandMode)
				texturerect.set_custom_minimum_size(Vector2(0,60))
				subhboxcontainer.add_child(texturerect)
				
				subhboxcontainer = HBoxContainer.new()
				subhboxcontainer.set_name("HBoxContainer")
				subhboxcontainer.add_theme_constant_override("separation", 10)
				subvboxcontainer.add_child(subhboxcontainer)
				
				label = Label.new()
				label.set_name("Fuck_in_boobs")
				label.set_text("Трах в соски: ")
				label.add_theme_font_size_override("font_size",30)
				label.add_theme_color_override("font_color",Color(0,0,0))
				subhboxcontainer.add_child(label)
				
				texturerect = TextureRect.new()
				texturerect.set_texture(call_slave.skills_to_picture(call_slave.sexual.fuck_in_boobs))
				texturerect.set_expand_mode(3 as TextureRect.ExpandMode)
				texturerect.set_custom_minimum_size(Vector2(0,60))
				subhboxcontainer.add_child(texturerect)
			"Xenophilia":
				var subhboxcontainer = HBoxContainer.new()
				subhboxcontainer.set_name("HBoxContainer")
				subhboxcontainer.add_theme_constant_override("separation", 10)
				subvboxcontainer.add_child(subhboxcontainer)
				
				var label = Label.new()
				label.set_name("Doggy")
				label.set_text("Кобель: ")
				label.add_theme_font_size_override("font_size",30)
				label.add_theme_color_override("font_color",Color(0,0,0))
				subhboxcontainer.add_child(label)
				
				var texturerect = TextureRect.new()
				texturerect.set_texture(call_slave.skills_to_picture(call_slave.sexual.doggy))
				texturerect.set_expand_mode(3 as TextureRect.ExpandMode)
				texturerect.set_custom_minimum_size(Vector2(0,60))
				subhboxcontainer.add_child(texturerect)
				
				subhboxcontainer = HBoxContainer.new()
				subhboxcontainer.set_name("HBoxContainer")
				subhboxcontainer.add_theme_constant_override("separation", 10)
				subvboxcontainer.add_child(subhboxcontainer)
				
				label = Label.new()
				label.set_name("Pig")
				label.set_text("Свинья: ")
				label.add_theme_font_size_override("font_size",30)
				label.add_theme_color_override("font_color",Color(0,0,0))
				subhboxcontainer.add_child(label)
				
				texturerect = TextureRect.new()
				texturerect.set_texture(call_slave.skills_to_picture(call_slave.sexual.pig))
				texturerect.set_expand_mode(3 as TextureRect.ExpandMode)
				texturerect.set_custom_minimum_size(Vector2(0,60))
				subhboxcontainer.add_child(texturerect)
				
				subhboxcontainer = HBoxContainer.new()
				subhboxcontainer.set_name("HBoxContainer")
				subhboxcontainer.add_theme_constant_override("separation", 10)
				subvboxcontainer.add_child(subhboxcontainer)
				
				label = Label.new()
				label.set_name("Arachnid")
				label.set_text("Арахнид: ")
				label.add_theme_font_size_override("font_size",30)
				label.add_theme_color_override("font_color",Color(0,0,0))
				subhboxcontainer.add_child(label)
				
				texturerect = TextureRect.new()
				texturerect.set_texture(call_slave.skills_to_picture(call_slave.sexual.arachnid))
				texturerect.set_expand_mode(3 as TextureRect.ExpandMode)
				texturerect.set_custom_minimum_size(Vector2(0,60))
				subhboxcontainer.add_child(texturerect)
				
				subhboxcontainer = HBoxContainer.new()
				subhboxcontainer.set_name("HBoxContainer")
				subhboxcontainer.add_theme_constant_override("separation", 10)
				subvboxcontainer.add_child(subhboxcontainer)
				
				label = Label.new()
				label.set_name("Horse")
				label.set_text("Жеребец: ")
				label.add_theme_font_size_override("font_size",30)
				label.add_theme_color_override("font_color",Color(0,0,0))
				subhboxcontainer.add_child(label)
				
				texturerect = TextureRect.new()
				texturerect.set_texture(call_slave.skills_to_picture(call_slave.sexual.horse))
				texturerect.set_expand_mode(3 as TextureRect.ExpandMode)
				texturerect.set_custom_minimum_size(Vector2(0,60))
				subhboxcontainer.add_child(texturerect)
				
				subhboxcontainer = HBoxContainer.new()
				subhboxcontainer.set_name("HBoxContainer")
				subhboxcontainer.add_theme_constant_override("separation", 10)
				subvboxcontainer.add_child(subhboxcontainer)
				
				label = Label.new()
				label.set_name("Tentacles")
				label.set_text("Тентакли: ")
				label.add_theme_font_size_override("font_size",30)
				label.add_theme_color_override("font_color",Color(0,0,0))
				subhboxcontainer.add_child(label)
				
				texturerect = TextureRect.new()
				texturerect.set_texture(call_slave.skills_to_picture(call_slave.sexual.tentacles))
				texturerect.set_expand_mode(3 as TextureRect.ExpandMode)
				texturerect.set_custom_minimum_size(Vector2(0,60))
				subhboxcontainer.add_child(texturerect)



func _on_button_skills_sex_pressed():
	if $Show_parametr/VBoxContainer.get_node_or_null("VBoxContainer") != null:
		$Show_parametr/VBoxContainer/VBoxContainer.free()
	_sex_skills_ready()
	$Show_parametr.set_visible(true)
	$Show_parametr/Pictures.set_visible(false)
	$Show_parametr/Show_pictures.set_visible(false)
	

func _wear_clothes(index_body_part,index_clothes):
	$Show_parametr/Choose_clothes.set_visible(false)
	if $Show_parametr/Choose_clothes/VBoxContainer.get_node_or_null("VBoxContainer") != null:
		$Show_parametr/Choose_clothes/VBoxContainer/VBoxContainer.free()
	
	call_slave.wear_slave(index_body_part,index_clothes)
	_clothes_ready()

func _choose_clothes(body_part):
	$Show_parametr/Choose_clothes.set_visible(true)
	var array_names_body_parts = ["Голова","В ушах","На шее","На теле","На руках","На ногах","Стопы","Кольцо","Игрушка"]
	$Show_parametr/Choose_clothes/VBoxContainer/Name_parametr.set_text(str(array_names_body_parts[body_part]))# Исправить назначение имени
	if $Show_parametr/Choose_clothes/VBoxContainer.get_node_or_null("VBoxContainer") != null:
		$Show_parametr/Choose_clothes/VBoxContainer/VBoxContainer.free()
	
	var subvboxcontainer = VBoxContainer.new()
	subvboxcontainer.set_name("VBoxContainer")
	subvboxcontainer.add_theme_constant_override("separation", 10)
	subvboxcontainer.set_v_size_flags(3)
	$Show_parametr/Choose_clothes/VBoxContainer.add_child(subvboxcontainer)
	
	var subscrollcontainer = ScrollContainer.new()
	subscrollcontainer.set_name("ScrollContainer")
	subscrollcontainer.set_horizontal_scroll_mode(0 as ScrollContainer.ScrollMode)
	subscrollcontainer.set_v_size_flags(3)
	subvboxcontainer.add_child(subscrollcontainer)
	
	subvboxcontainer = VBoxContainer.new()
	subvboxcontainer.set_name("VBoxContainer")
	subvboxcontainer.add_theme_constant_override("separation", 10)
	subvboxcontainer.set_h_size_flags(3)
	subscrollcontainer.add_child(subvboxcontainer)
	
	match body_part:
		0:
			if call_slave.clothes.head != "Ничего":
				var subbutton = Button.new()
				subbutton.set_name("Clothes")
				subbutton.set_text("Снять")
				subbutton.add_theme_font_size_override("font_size",30)
				subbutton.add_theme_color_override("font_color",Color(0,0,0))
				subbutton.pressed.connect(_wear_clothes.bind(body_part,-1))
				subvboxcontainer.add_child(subbutton)
		1:
			if call_slave.clothes.ears != "Ничего":
				var subbutton = Button.new()
				subbutton.set_name("Clothes")
				subbutton.set_text("Снять")
				subbutton.add_theme_font_size_override("font_size",30)
				subbutton.add_theme_color_override("font_color",Color(0,0,0))
				subbutton.pressed.connect(_wear_clothes.bind(body_part,-1))
				subvboxcontainer.add_child(subbutton)
		2:
			if call_slave.clothes.neck != "Ничего":
				var subbutton = Button.new()
				subbutton.set_name("Clothes")
				subbutton.set_text("Снять")
				subbutton.add_theme_font_size_override("font_size",30)
				subbutton.add_theme_color_override("font_color",Color(0,0,0))
				subbutton.pressed.connect(_wear_clothes.bind(body_part,-1))
				subvboxcontainer.add_child(subbutton)
		3:
			if call_slave.clothes.body != "Ничего":
				var subbutton = Button.new()
				subbutton.set_name("Clothes")
				subbutton.set_text("Снять")
				subbutton.add_theme_font_size_override("font_size",30)
				subbutton.add_theme_color_override("font_color",Color(0,0,0))
				subbutton.pressed.connect(_wear_clothes.bind(body_part,-1))
				subvboxcontainer.add_child(subbutton)
		4:
			if call_slave.clothes.hands != "Ничего":
				var subbutton = Button.new()
				subbutton.set_name("Clothes")
				subbutton.set_text("Снять")
				subbutton.add_theme_font_size_override("font_size",30)
				subbutton.add_theme_color_override("font_color",Color(0,0,0))
				subbutton.pressed.connect(_wear_clothes.bind(body_part,-1))
				subvboxcontainer.add_child(subbutton)
		5:
			if call_slave.clothes.legs != "Ничего":
				var subbutton = Button.new()
				subbutton.set_name("Clothes")
				subbutton.set_text("Снять")
				subbutton.add_theme_font_size_override("font_size",30)
				subbutton.add_theme_color_override("font_color",Color(0,0,0))
				subbutton.pressed.connect(_wear_clothes.bind(body_part,-1))
				subvboxcontainer.add_child(subbutton)
		6:
			if call_slave.clothes.foot != "Ничего":
				var subbutton = Button.new()
				subbutton.set_name("Clothes")
				subbutton.set_text("Снять")
				subbutton.add_theme_font_size_override("font_size",30)
				subbutton.add_theme_color_override("font_color",Color(0,0,0))
				subbutton.pressed.connect(_wear_clothes.bind(body_part,-1))
				subvboxcontainer.add_child(subbutton)
		7:
			if call_slave.clothes.ring != "Ничего":
				var subbutton = Button.new()
				subbutton.set_name("Clothes")
				subbutton.set_text("Снять")
				subbutton.add_theme_font_size_override("font_size",30)
				subbutton.add_theme_color_override("font_color",Color(0,0,0))
				subbutton.pressed.connect(_wear_clothes.bind(body_part,-1))
				subvboxcontainer.add_child(subbutton)
		8:
			if call_slave.clothes.toy != "Ничего":
				var subbutton = Button.new()
				subbutton.set_name("Clothes")
				subbutton.set_text("Снять")
				subbutton.add_theme_font_size_override("font_size",30)
				subbutton.add_theme_color_override("font_color",Color(0,0,0))
				subbutton.pressed.connect(_wear_clothes.bind(body_part,-1))
				subvboxcontainer.add_child(subbutton)
	
	
	
	for exist_clothes in range(len(Globaldata.all_clothes[body_part])):
		var subbutton = Button.new()
		subbutton.set_name("Clothes")
		subbutton.set_text(Globaldata.all_clothes[body_part][exist_clothes])
		subbutton.add_theme_font_size_override("font_size",30)
		subbutton.add_theme_color_override("font_color",Color(0,0,0))
		subbutton.pressed.connect(_wear_clothes.bind(body_part,exist_clothes))
		subvboxcontainer.add_child(subbutton)


func _clothes_ready():
	if $Show_parametr/VBoxContainer.get_node_or_null("VBoxContainer") != null:
		$Show_parametr/VBoxContainer/VBoxContainer.free()
	$Show_parametr/Choose_clothes.set_visible(false)
	$Show_parametr/VBoxContainer/Name_parametr.set_text("Одежда")
	
	var vboxcontainer = VBoxContainer.new()
	vboxcontainer.set_name("VBoxContainer")
	vboxcontainer.add_theme_constant_override("separation", 10)
	vboxcontainer.set_v_size_flags(3)
	$Show_parametr/VBoxContainer.add_child(vboxcontainer)
	
	var scrollcontainer = ScrollContainer.new()
	scrollcontainer.set_name("ScrollContainer")
	scrollcontainer.set_horizontal_scroll_mode(0 as ScrollContainer.ScrollMode)
	scrollcontainer.set_v_size_flags(3)
	vboxcontainer.add_child(scrollcontainer)
	
	vboxcontainer = VBoxContainer.new()
	vboxcontainer.set_name("VBoxContainer")
	vboxcontainer.add_theme_constant_override("separation", 10)
	scrollcontainer.add_child(vboxcontainer)
	
	var hboxcontainer = HBoxContainer.new()
	hboxcontainer.set_name("HBoxContainer")
	hboxcontainer.add_theme_constant_override("separation", 10)
	vboxcontainer.add_child(hboxcontainer)
	
	var label = Label.new()
	label.set_name("Head")
	label.set_text("Голова: ")
	label.add_theme_font_size_override("font_size",30)
	label.add_theme_color_override("font_color",Color(0,0,0))
	hboxcontainer.add_child(label)
	
	var button = Button.new()
	button.set_name("Clothes")
	button.set_text(call_slave.clothes.head)
	button.add_theme_font_size_override("font_size",30)
	button.add_theme_color_override("font_color",Color(0,0,0))
	button.pressed.connect(_choose_clothes.bind(0))
	hboxcontainer.add_child(button)
	
	
	hboxcontainer = HBoxContainer.new()
	hboxcontainer.set_name("HBoxContainer")
	hboxcontainer.add_theme_constant_override("separation", 10)
	vboxcontainer.add_child(hboxcontainer)
	
	label = Label.new()
	label.set_name("Ears")
	label.set_text("В ушах: ")
	label.add_theme_font_size_override("font_size",30)
	label.add_theme_color_override("font_color",Color(0,0,0))
	hboxcontainer.add_child(label)
	
	button = Button.new()
	button.set_name("Clothes")
	button.set_text(call_slave.clothes.ears)
	button.add_theme_font_size_override("font_size",30)
	button.add_theme_color_override("font_color",Color(0,0,0))
	button.pressed.connect(_choose_clothes.bind(1))
	hboxcontainer.add_child(button)
	
	hboxcontainer = HBoxContainer.new()
	hboxcontainer.set_name("HBoxContainer")
	hboxcontainer.add_theme_constant_override("separation", 10)
	vboxcontainer.add_child(hboxcontainer)
	
	label = Label.new()
	label.set_name("Tongue")
	label.set_text("В языке: ")
	label.add_theme_font_size_override("font_size",30)
	label.add_theme_color_override("font_color",Color(0,0,0))
	hboxcontainer.add_child(label)
	
	label = Label.new()
	label.set_name("Clothes")
	label.set_text(call_slave.clothes.tongue)
	label.add_theme_font_size_override("font_size",30)
	label.add_theme_color_override("font_color",Color(0,0,0))
	hboxcontainer.add_child(label)
	
	hboxcontainer = HBoxContainer.new()
	hboxcontainer.set_name("HBoxContainer")
	hboxcontainer.add_theme_constant_override("separation", 10)
	vboxcontainer.add_child(hboxcontainer)
	
	label = Label.new()
	label.set_name("Neck")
	label.set_text("На шее: ")
	label.add_theme_font_size_override("font_size",30)
	label.add_theme_color_override("font_color",Color(0,0,0))
	hboxcontainer.add_child(label)
	
	button = Button.new()
	button.set_name("Clothes")
	button.set_text(call_slave.clothes.neck)
	button.add_theme_font_size_override("font_size",30)
	button.add_theme_color_override("font_color",Color(0,0,0))
	button.pressed.connect(_choose_clothes.bind(2))
	hboxcontainer.add_child(button)
	
	hboxcontainer = HBoxContainer.new()
	hboxcontainer.set_name("HBoxContainer")
	hboxcontainer.add_theme_constant_override("separation", 10)
	vboxcontainer.add_child(hboxcontainer)
	
	label = Label.new()
	label.set_name("Body")
	label.set_text("На теле: ")
	label.add_theme_font_size_override("font_size",30)
	label.add_theme_color_override("font_color",Color(0,0,0))
	hboxcontainer.add_child(label)
	
	button = Button.new()
	button.set_name("Clothes")
	button.set_text(call_slave.clothes.body)
	button.add_theme_font_size_override("font_size",30)
	button.add_theme_color_override("font_color",Color(0,0,0))
	button.pressed.connect(_choose_clothes.bind(3))
	hboxcontainer.add_child(button)
	
	hboxcontainer = HBoxContainer.new()
	hboxcontainer.set_name("HBoxContainer")
	hboxcontainer.add_theme_constant_override("separation", 10)
	vboxcontainer.add_child(hboxcontainer)
	
	label = Label.new()
	label.set_name("Bellybutton")
	label.set_text("В пупке: ")
	label.add_theme_font_size_override("font_size",30)
	label.add_theme_color_override("font_color",Color(0,0,0))
	hboxcontainer.add_child(label)
	
	label = Label.new()
	label.set_name("Clothes")
	label.set_text(call_slave.clothes.bellybutton)
	label.add_theme_font_size_override("font_size",30)
	label.add_theme_color_override("font_color",Color(0,0,0))
	hboxcontainer.add_child(label)
	
	hboxcontainer = HBoxContainer.new()
	hboxcontainer.set_name("HBoxContainer")
	hboxcontainer.add_theme_constant_override("separation", 10)
	vboxcontainer.add_child(hboxcontainer)
	
	label = Label.new()
	label.set_name("Hands")
	label.set_text("На руках: ")
	label.add_theme_font_size_override("font_size",30)
	label.add_theme_color_override("font_color",Color(0,0,0))
	hboxcontainer.add_child(label)
	
	button = Button.new()
	button.set_name("Clothes")
	button.set_text(call_slave.clothes.hands)
	button.add_theme_font_size_override("font_size",30)
	button.add_theme_color_override("font_color",Color(0,0,0))
	button.pressed.connect(_choose_clothes.bind(4))
	hboxcontainer.add_child(button)
	
	hboxcontainer = HBoxContainer.new()
	hboxcontainer.set_name("HBoxContainer")
	hboxcontainer.add_theme_constant_override("separation", 10)
	vboxcontainer.add_child(hboxcontainer)
	
	label = Label.new()
	label.set_name("Nipples")
	label.set_text("В сосках: ")
	label.add_theme_font_size_override("font_size",30)
	label.add_theme_color_override("font_color",Color(0,0,0))
	hboxcontainer.add_child(label)
	
	label = Label.new()
	label.set_name("Clothes")
	label.set_text(call_slave.clothes.nipples)
	label.add_theme_font_size_override("font_size",30)
	label.add_theme_color_override("font_color",Color(0,0,0))
	hboxcontainer.add_child(label)
	
	hboxcontainer = HBoxContainer.new()
	hboxcontainer.set_name("HBoxContainer")
	hboxcontainer.add_theme_constant_override("separation", 10)
	vboxcontainer.add_child(hboxcontainer)
	
	label = Label.new()
	label.set_name("Legs")
	label.set_text("На ногах: ")
	label.add_theme_font_size_override("font_size",30)
	label.add_theme_color_override("font_color",Color(0,0,0))
	hboxcontainer.add_child(label)
	
	button = Button.new()
	button.set_name("Clothes")
	button.set_text(call_slave.clothes.legs)
	button.add_theme_font_size_override("font_size",30)
	button.add_theme_color_override("font_color",Color(0,0,0))
	button.pressed.connect(_choose_clothes.bind(5))
	hboxcontainer.add_child(button)
	
	hboxcontainer = HBoxContainer.new()
	hboxcontainer.set_name("HBoxContainer")
	hboxcontainer.add_theme_constant_override("separation", 10)
	vboxcontainer.add_child(hboxcontainer)
	
	label = Label.new()
	label.set_name("Foot")
	label.set_text("Стопы: ")
	label.add_theme_font_size_override("font_size",30)
	label.add_theme_color_override("font_color",Color(0,0,0))
	hboxcontainer.add_child(label)
	
	button = Button.new()
	button.set_name("Clothes")
	button.set_text(call_slave.clothes.foot)
	button.add_theme_font_size_override("font_size",30)
	button.add_theme_color_override("font_color",Color(0,0,0))
	button.pressed.connect(_choose_clothes.bind(6))
	hboxcontainer.add_child(button)
	
	hboxcontainer = HBoxContainer.new()
	hboxcontainer.set_name("HBoxContainer")
	hboxcontainer.add_theme_constant_override("separation", 10)
	vboxcontainer.add_child(hboxcontainer)
	
	label = Label.new()
	label.set_name("Clitor")
	label.set_text("В клиторе: ")
	label.add_theme_font_size_override("font_size",30)
	label.add_theme_color_override("font_color",Color(0,0,0))
	hboxcontainer.add_child(label)
	
	label = Label.new()
	label.set_name("Clothes")
	label.set_text(call_slave.clothes.clitoris)
	label.add_theme_font_size_override("font_size",30)
	label.add_theme_color_override("font_color",Color(0,0,0))
	hboxcontainer.add_child(label)
	
	hboxcontainer = HBoxContainer.new()
	hboxcontainer.set_name("HBoxContainer")
	hboxcontainer.add_theme_constant_override("separation", 10)
	vboxcontainer.add_child(hboxcontainer)
	
	label = Label.new()
	label.set_name("Left_ring")
	label.set_text("Кольцо: ")
	label.add_theme_font_size_override("font_size",30)
	label.add_theme_color_override("font_color",Color(0,0,0))
	hboxcontainer.add_child(label)
	
	button = Button.new()
	button.set_name("Clothes")
	button.set_text(call_slave.clothes.ring)
	button.add_theme_font_size_override("font_size",30)
	button.add_theme_color_override("font_color",Color(0,0,0))
	button.pressed.connect(_choose_clothes.bind(7))
	hboxcontainer.add_child(button)
	
	hboxcontainer = HBoxContainer.new()
	hboxcontainer.set_name("HBoxContainer")
	hboxcontainer.add_theme_constant_override("separation", 10)
	vboxcontainer.add_child(hboxcontainer)
	
	label = Label.new()
	label.set_name("Toy")
	label.set_text("Игрушка: ")
	label.add_theme_font_size_override("font_size",30)
	label.add_theme_color_override("font_color",Color(0,0,0))
	hboxcontainer.add_child(label)
	
	button = Button.new()
	button.set_name("Clothes")
	button.set_text(call_slave.clothes.toy)
	button.add_theme_font_size_override("font_size",30)
	button.add_theme_color_override("font_color",Color(0,0,0))
	button.pressed.connect(_choose_clothes.bind(8))
	hboxcontainer.add_child(button)


func _on_button_clothes_pressed():
	if $Show_parametr/VBoxContainer.get_node_or_null("VBoxContainer") != null:
		$Show_parametr/VBoxContainer/VBoxContainer.free()
	_clothes_ready()
	$Show_parametr.set_visible(true)
	$Show_parametr/Pictures.set_visible(false)
	$Show_parametr/Show_pictures.set_visible(false)
	

func _on_close_status_clothes_pressed():
	$Check_slave_status/Status_clothes.set_visible(false)
	$Check_slave_status/Status_appearance/Info_beauty.set_visible(false)
	$Check_slave_status/Status_appearance/Info_endurance.set_visible(false)
	$Check_slave_status/Status_appearance/Info_softness.set_visible(false)
	$Check_slave_status/Status_appearance/Info_mind.set_visible(false)
	$Check_slave_status/Status_appearance/Info_physique.set_visible(false)
	$Check_slave_status/Status_appearance/Info_style.set_visible(false)
	$Check_slave_status/Status_appearance/Info_personality.set_visible(false)


func _on_beauty_pressed():
	$Check_slave_status/Status_appearance/Status.set_visible(false)
	$Check_slave_status/Status_appearance/Info_beauty.set_visible(true)
	$Check_slave_status/Status_appearance/Info_endurance.set_visible(false)
	$Check_slave_status/Status_appearance/Info_softness.set_visible(false)
	$Check_slave_status/Status_appearance/Info_mind.set_visible(false)
	$Check_slave_status/Status_appearance/Info_physique.set_visible(false)
	$Check_slave_status/Status_appearance/Info_style.set_visible(false)
	$Check_slave_status/Status_appearance/Info_personality.set_visible(false)
	$Check_slave_status/Status_appearance/Back_status.set_visible(true)


func _on_endurance_pressed():
	$Check_slave_status/Status_appearance/Status.set_visible(false)
	$Check_slave_status/Status_appearance/Info_endurance.set_visible(true)
	$Check_slave_status/Status_appearance/Info_beauty.set_visible(false)
	$Check_slave_status/Status_appearance/Info_softness.set_visible(false)
	$Check_slave_status/Status_appearance/Info_mind.set_visible(false)
	$Check_slave_status/Status_appearance/Info_physique.set_visible(false)
	$Check_slave_status/Status_appearance/Info_style.set_visible(false)
	$Check_slave_status/Status_appearance/Info_personality.set_visible(false)
	$Check_slave_status/Status_appearance/Back_status.set_visible(true)


func _on_softness_pressed():
	$Check_slave_status/Status_appearance/Status.set_visible(false)
	$Check_slave_status/Status_appearance/Info_softness.set_visible(true)
	$Check_slave_status/Status_appearance/Info_endurance.set_visible(false)
	$Check_slave_status/Status_appearance/Info_beauty.set_visible(false)
	$Check_slave_status/Status_appearance/Info_mind.set_visible(false)
	$Check_slave_status/Status_appearance/Info_physique.set_visible(false)
	$Check_slave_status/Status_appearance/Info_style.set_visible(false)
	$Check_slave_status/Status_appearance/Info_personality.set_visible(false)
	$Check_slave_status/Status_appearance/Back_status.set_visible(true)


func _on_mind_pressed():
	$Check_slave_status/Status_appearance/Status.set_visible(false)
	$Check_slave_status/Status_appearance/Info_mind.set_visible(true)
	$Check_slave_status/Status_appearance/Info_softness.set_visible(false)
	$Check_slave_status/Status_appearance/Info_endurance.set_visible(false)
	$Check_slave_status/Status_appearance/Info_beauty.set_visible(false)
	$Check_slave_status/Status_appearance/Info_physique.set_visible(false)
	$Check_slave_status/Status_appearance/Info_style.set_visible(false)
	$Check_slave_status/Status_appearance/Info_personality.set_visible(false)
	$Check_slave_status/Status_appearance/Back_status.set_visible(true)


func _on_physique_pressed():
	$Check_slave_status/Status_appearance/Status.set_visible(false)
	$Check_slave_status/Status_appearance/Info_physique.set_visible(true)
	$Check_slave_status/Status_appearance/Info_mind.set_visible(false)
	$Check_slave_status/Status_appearance/Info_softness.set_visible(false)
	$Check_slave_status/Status_appearance/Info_endurance.set_visible(false)
	$Check_slave_status/Status_appearance/Info_beauty.set_visible(false)
	$Check_slave_status/Status_appearance/Info_style.set_visible(false)
	$Check_slave_status/Status_appearance/Info_personality.set_visible(false)
	$Check_slave_status/Status_appearance/Back_status.set_visible(true)


func _on_style_pressed():
	$Check_slave_status/Status_appearance/Status.set_visible(false)
	$Check_slave_status/Status_appearance/Info_style.set_visible(true)
	$Check_slave_status/Status_appearance/Info_physique.set_visible(false)
	$Check_slave_status/Status_appearance/Info_mind.set_visible(false)
	$Check_slave_status/Status_appearance/Info_softness.set_visible(false)
	$Check_slave_status/Status_appearance/Info_endurance.set_visible(false)
	$Check_slave_status/Status_appearance/Info_beauty.set_visible(false)
	$Check_slave_status/Status_appearance/Info_personality.set_visible(false)
	$Check_slave_status/Status_appearance/Back_status.set_visible(true)


func _on_personality_pressed():
	$Check_slave_status/Status_appearance/Status.set_visible(false)
	$Check_slave_status/Status_appearance/Info_personality.set_visible(true)
	$Check_slave_status/Status_appearance/Info_style.set_visible(false)
	$Check_slave_status/Status_appearance/Info_physique.set_visible(false)
	$Check_slave_status/Status_appearance/Info_mind.set_visible(false)
	$Check_slave_status/Status_appearance/Info_softness.set_visible(false)
	$Check_slave_status/Status_appearance/Info_endurance.set_visible(false)
	$Check_slave_status/Status_appearance/Info_beauty.set_visible(false)
	$Check_slave_status/Status_appearance/Back_status.set_visible(true)


	# Заготовка для создания отображения особенностей
	#var Features_check = Button.new()
	#Features_check.text = "Особенность 1"
	#Features_check.add_theme_font_size_override("font_size", 25)
	#Features_check.add_theme_stylebox_override("normal", StyleBoxEmpty.new())
	#Features_check.add_theme_stylebox_override("hover", StyleBoxEmpty.new())
	#Features_check.add_theme_stylebox_override("pressed", StyleBoxEmpty.new())
	#Features_check.add_theme_stylebox_override("focus", StyleBoxEmpty.new())
	#Features_check.connect("pressed",Callable(on_Features_check_pressed))
	#$Check_slave_status/Status_slave/PanelContainer/VBoxContainer.add_child(Features_check)
	#func on_Features_check_pressed():
	#pass


func _on_back_status_pressed():
	$Check_slave_status/Status_appearance/Status.set_visible(true)
	$Check_slave_status/Status_appearance/Info_beauty.set_visible(false)
	$Check_slave_status/Status_appearance/Info_endurance.set_visible(false)
	$Check_slave_status/Status_appearance/Info_softness.set_visible(false)
	$Check_slave_status/Status_appearance/Info_mind.set_visible(false)
	$Check_slave_status/Status_appearance/Info_physique.set_visible(false)
	$Check_slave_status/Status_appearance/Info_style.set_visible(false)
	$Check_slave_status/Status_appearance/Info_personality.set_visible(false)
	$Check_slave_status/Status_appearance/Back_status.set_visible(false)


func _on_petting_pressed():
	$Check_slave_status/Status_skill_sex/Petting.set_visible(true)
	$Check_slave_status/Status_skill_sex/PanelContainer.set_visible(false)
	$Check_slave_status/Status_skill_sex/Oral_sex.set_visible(false)
	$Check_slave_status/Status_skill_sex/Penetration.set_visible(false)
	$Check_slave_status/Status_skill_sex/Group_sex.set_visible(false)
	$Check_slave_status/Status_skill_sex/Demostration.set_visible(false)
	$Check_slave_status/Status_skill_sex/Lesbian_sex.set_visible(false)
	$Check_slave_status/Status_skill_sex/Fetishism.set_visible(false)
	$Check_slave_status/Status_skill_sex/Xenophilia.set_visible(false)
	
	
	
	
	$Check_slave_status/Status_appearance.set_visible(false)
	$Check_slave_status/Status_anatomy.set_visible(false)
	$Check_slave_status/Status_skill_common.set_visible(false)
	$Check_slave_status/Status_clothes.set_visible(false)
	
	
	#Globaldata.all_slaves[call_number_slave].int_skills_to_string($Check_slave_status/Status_skill_sex/Petting/Petting/HBoxContainer/VBoxContainer2/Handjob_info,Globaldata.all_slaves[call_number_slave].status_handjob_slave)
	#Globaldata.all_slaves[call_number_slave].int_skills_to_string($Check_slave_status/Status_skill_sex/Petting/Petting/HBoxContainer/VBoxContainer2/Footsjob_info,Globaldata.all_slaves[call_number_slave].status_footsjob_slave)
	#Globaldata.all_slaves[call_number_slave].int_skills_to_string($Check_slave_status/Status_skill_sex/Petting/Petting/HBoxContainer/VBoxContainer2/Squeezing_info,Globaldata.all_slaves[call_number_slave].status_squeezing_slave)
	#Globaldata.all_slaves[call_number_slave].int_skills_to_string($Check_slave_status/Status_skill_sex/Petting/Petting/HBoxContainer/VBoxContainer2/Payzuri,Globaldata.all_slaves[call_number_slave].status_paizuri_slave)


func _on_oral_sex_pressed():
	$Check_slave_status/Status_skill_sex/Oral_sex.set_visible(true)
	$Check_slave_status/Status_skill_sex/PanelContainer.set_visible(false)
	$Check_slave_status/Status_skill_sex/Petting.set_visible(false)
	$Check_slave_status/Status_skill_sex/Penetration.set_visible(false)
	$Check_slave_status/Status_skill_sex/Group_sex.set_visible(false)
	$Check_slave_status/Status_skill_sex/Demostration.set_visible(false)
	$Check_slave_status/Status_skill_sex/Lesbian_sex.set_visible(false)
	$Check_slave_status/Status_skill_sex/Fetishism.set_visible(false)
	$Check_slave_status/Status_skill_sex/Xenophilia.set_visible(false)
	
	
	
	
	$Check_slave_status/Status_appearance.set_visible(false)
	$Check_slave_status/Status_anatomy.set_visible(false)
	$Check_slave_status/Status_skill_common.set_visible(false)
	$Check_slave_status/Status_clothes.set_visible(false)
	
	
	#Globaldata.all_slaves[call_number_slave].int_skills_to_string($Check_slave_status/Status_skill_sex/Oral_sex/Oral_sex/HBoxContainer/VBoxContainer2/Kissing_info,Globaldata.all_slaves[call_number_slave].status_kissing_slave)
	#Globaldata.all_slaves[call_number_slave].int_skills_to_string($Check_slave_status/Status_skill_sex/Oral_sex/Oral_sex/HBoxContainer/VBoxContainer2/Licking_info,Globaldata.all_slaves[call_number_slave].status_licking_slave)
	#Globaldata.all_slaves[call_number_slave].int_skills_to_string($Check_slave_status/Status_skill_sex/Oral_sex/Oral_sex/HBoxContainer/VBoxContainer2/Blowjob_info,Globaldata.all_slaves[call_number_slave].status_blowjob_slave)
	#Globaldata.all_slaves[call_number_slave].int_skills_to_string($Check_slave_status/Status_skill_sex/Oral_sex/Oral_sex/HBoxContainer/VBoxContainer2/Irrumation_info,Globaldata.all_slaves[call_number_slave].status_irrumation_slave)
	#Globaldata.all_slaves[call_number_slave].int_skills_to_string($Check_slave_status/Status_skill_sex/Oral_sex/Oral_sex/HBoxContainer/VBoxContainer2/Ass_licking_info,Globaldata.all_slaves[call_number_slave].status_ass_licking_slave)


func _on_penetration_pressed():
	$Check_slave_status/Status_skill_sex/Penetration.set_visible(true)
	$Check_slave_status/Status_skill_sex/Petting.set_visible(false)
	$Check_slave_status/Status_skill_sex/Oral_sex.set_visible(false)
	$Check_slave_status/Status_skill_sex/PanelContainer.set_visible(false)
	
	
	$Check_slave_status/Status_skill_sex/Group_sex.set_visible(false)
	$Check_slave_status/Status_skill_sex/Demostration.set_visible(false)
	$Check_slave_status/Status_skill_sex/Lesbian_sex.set_visible(false)
	$Check_slave_status/Status_skill_sex/Fetishism.set_visible(false)
	$Check_slave_status/Status_skill_sex/Xenophilia.set_visible(false)
	
	
	$Check_slave_status/Status_appearance.set_visible(false)
	$Check_slave_status/Status_anatomy.set_visible(false)
	$Check_slave_status/Status_skill_common.set_visible(false)
	$Check_slave_status/Status_clothes.set_visible(false)
	
	
	#Globaldata.all_slaves[call_number_slave].int_skills_to_string($Check_slave_status/Status_skill_sex/Penetration/Penetration/HBoxContainer/VBoxContainer2/Sex_info,Globaldata.all_slaves[call_number_slave].status_sex_slave)
	#Globaldata.all_slaves[call_number_slave].int_skills_to_string($Check_slave_status/Status_skill_sex/Penetration/Penetration/HBoxContainer/VBoxContainer2/Anal_sex_info,Globaldata.all_slaves[call_number_slave].status_anal_sex_slave)
	#Globaldata.all_slaves[call_number_slave].int_skills_to_string($Check_slave_status/Status_skill_sex/Penetration/Penetration/HBoxContainer/VBoxContainer2/Fisting_info,Globaldata.all_slaves[call_number_slave].status_fisting_slave)
	#Globaldata.all_slaves[call_number_slave].int_skills_to_string($Check_slave_status/Status_skill_sex/Penetration/Penetration/HBoxContainer/VBoxContainer2/Anal_fisting_info,Globaldata.all_slaves[call_number_slave].status_anal_fisting_slave)


func _on_group_sex_pressed():
	$Check_slave_status/Status_skill_sex/Group_sex.set_visible(true)
	$Check_slave_status/Status_skill_sex/Penetration.set_visible(false)
	$Check_slave_status/Status_skill_sex/Petting.set_visible(false)
	$Check_slave_status/Status_skill_sex/Oral_sex.set_visible(false)
	$Check_slave_status/Status_skill_sex/PanelContainer.set_visible(false)
	
	
	
	$Check_slave_status/Status_skill_sex/Demostration.set_visible(false)
	$Check_slave_status/Status_skill_sex/Lesbian_sex.set_visible(false)
	$Check_slave_status/Status_skill_sex/Fetishism.set_visible(false)
	$Check_slave_status/Status_skill_sex/Xenophilia.set_visible(false)
	
	
	$Check_slave_status/Status_appearance.set_visible(false)
	$Check_slave_status/Status_anatomy.set_visible(false)
	$Check_slave_status/Status_skill_common.set_visible(false)
	$Check_slave_status/Status_clothes.set_visible(false)
	
	
	#Globaldata.all_slaves[call_number_slave].int_skills_to_string($Check_slave_status/Status_skill_sex/Group_sex/Group_sex/HBoxContainer/VBoxContainer2/Mmw_info,Globaldata.all_slaves[call_number_slave].status_mmw_slave)
	#Globaldata.all_slaves[call_number_slave].int_skills_to_string($Check_slave_status/Status_skill_sex/Group_sex/Group_sex/HBoxContainer/VBoxContainer2/Two_mans_info,Globaldata.all_slaves[call_number_slave].status_two_mans_slave)
	#Globaldata.all_slaves[call_number_slave].int_skills_to_string($Check_slave_status/Status_skill_sex/Group_sex/Group_sex/HBoxContainer/VBoxContainer2/Three_mans_info2,Globaldata.all_slaves[call_number_slave].status_three_mans_slave)
	#Globaldata.all_slaves[call_number_slave].int_skills_to_string($Check_slave_status/Status_skill_sex/Group_sex/Group_sex/HBoxContainer/VBoxContainer2/Five_mans_info,Globaldata.all_slaves[call_number_slave].status_five_mans_slave)
	#Globaldata.all_slaves[call_number_slave].int_skills_to_string($Check_slave_status/Status_skill_sex/Group_sex/Group_sex/HBoxContainer/VBoxContainer2/Bukkake_info,Globaldata.all_slaves[call_number_slave].status_bukkake_slave)
	



func _on_demostration_pressed():
	$Check_slave_status/Status_skill_sex/Demostration.set_visible(true)
	$Check_slave_status/Status_skill_sex/Group_sex.set_visible(false)
	$Check_slave_status/Status_skill_sex/Penetration.set_visible(false)
	$Check_slave_status/Status_skill_sex/Petting.set_visible(false)
	$Check_slave_status/Status_skill_sex/Oral_sex.set_visible(false)
	$Check_slave_status/Status_skill_sex/PanelContainer.set_visible(false)
	
	
	
	$Check_slave_status/Status_skill_sex/Lesbian_sex.set_visible(false)
	$Check_slave_status/Status_skill_sex/Fetishism.set_visible(false)
	$Check_slave_status/Status_skill_sex/Xenophilia.set_visible(false)

	
	
	$Check_slave_status/Status_appearance.set_visible(false)
	$Check_slave_status/Status_anatomy.set_visible(false)
	$Check_slave_status/Status_skill_common.set_visible(false)
	$Check_slave_status/Status_clothes.set_visible(false)
	
	
	#Globaldata.all_slaves[call_number_slave].int_skills_to_string($Check_slave_status/Status_skill_sex/Demostration/Demostration/HBoxContainer/VBoxContainer2/Seduction_info,Globaldata.all_slaves[call_number_slave].status_seduction_slave)
	#Globaldata.all_slaves[call_number_slave].int_skills_to_string($Check_slave_status/Status_skill_sex/Demostration/Demostration/HBoxContainer/VBoxContainer2/Masturbate_info,Globaldata.all_slaves[call_number_slave].status_masturbate_slave)
	#Globaldata.all_slaves[call_number_slave].int_skills_to_string($Check_slave_status/Status_skill_sex/Demostration/Demostration/HBoxContainer/VBoxContainer2/Dildo_info,Globaldata.all_slaves[call_number_slave].status_dildo_slave)
	#Globaldata.all_slaves[call_number_slave].int_skills_to_string($Check_slave_status/Status_skill_sex/Demostration/Demostration/HBoxContainer/VBoxContainer2/Exbitionism_info,Globaldata.all_slaves[call_number_slave].status_exbitionism_slave)
	#Globaldata.all_slaves[call_number_slave].int_skills_to_string($Check_slave_status/Status_skill_sex/Demostration/Demostration/HBoxContainer/VBoxContainer2/Humiliation_info,Globaldata.all_slaves[call_number_slave].status_humiliation_slave)
	
	


func _on_lesbian_sex_pressed():
	$Check_slave_status/Status_skill_sex/Lesbian_sex.set_visible(true)
	$Check_slave_status/Status_skill_sex/Demostration.set_visible(false)
	$Check_slave_status/Status_skill_sex/Group_sex.set_visible(false)
	$Check_slave_status/Status_skill_sex/Penetration.set_visible(false)
	$Check_slave_status/Status_skill_sex/Petting.set_visible(false)
	$Check_slave_status/Status_skill_sex/Oral_sex.set_visible(false)
	$Check_slave_status/Status_skill_sex/PanelContainer.set_visible(false)
	
	
	$Check_slave_status/Status_skill_sex/Fetishism.set_visible(false)
	$Check_slave_status/Status_skill_sex/Xenophilia.set_visible(false)

	
	
	$Check_slave_status/Status_appearance.set_visible(false)
	$Check_slave_status/Status_anatomy.set_visible(false)
	$Check_slave_status/Status_skill_common.set_visible(false)
	$Check_slave_status/Status_clothes.set_visible(false)
	
	
	#Globaldata.all_slaves[call_number_slave].int_skills_to_string($Check_slave_status/Status_skill_sex/Lesbian_sex/Lesbian_sex/HBoxContainer/VBoxContainer2/Caresses_info,Globaldata.all_slaves[call_number_slave].status_caresses_slave)
	#Globaldata.all_slaves[call_number_slave].int_skills_to_string($Check_slave_status/Status_skill_sex/Lesbian_sex/Lesbian_sex/HBoxContainer/VBoxContainer2/Kuni_info,Globaldata.all_slaves[call_number_slave].status_kuni_slave)
	#Globaldata.all_slaves[call_number_slave].int_skills_to_string($Check_slave_status/Status_skill_sex/Lesbian_sex/Lesbian_sex/HBoxContainer/VBoxContainer2/Lesbian_sex_info,Globaldata.all_slaves[call_number_slave].status_lesbian_sex_slave)
	


func _on_fetishism_pressed():
	$Check_slave_status/Status_skill_sex/Fetishism.set_visible(true)
	$Check_slave_status/Status_skill_sex/Lesbian_sex.set_visible(false)
	$Check_slave_status/Status_skill_sex/Demostration.set_visible(false)
	$Check_slave_status/Status_skill_sex/Group_sex.set_visible(false)
	$Check_slave_status/Status_skill_sex/Penetration.set_visible(false)
	$Check_slave_status/Status_skill_sex/Petting.set_visible(false)
	$Check_slave_status/Status_skill_sex/Oral_sex.set_visible(false)
	$Check_slave_status/Status_skill_sex/PanelContainer.set_visible(false)
	
	$Check_slave_status/Status_skill_sex/Xenophilia.set_visible(false)
	
	$Check_slave_status/Status_appearance.set_visible(false)
	$Check_slave_status/Status_anatomy.set_visible(false)
	$Check_slave_status/Status_skill_common.set_visible(false)
	$Check_slave_status/Status_clothes.set_visible(false)
	
	
	#Globaldata.all_slaves[call_number_slave].int_skills_to_string($Check_slave_status/Status_skill_sex/Fetishism/Fetishism/HBoxContainer/VBoxContainer2/Enema_info,Globaldata.all_slaves[call_number_slave].status_enema_slave)
	#Globaldata.all_slaves[call_number_slave].int_skills_to_string($Check_slave_status/Status_skill_sex/Fetishism/Fetishism/HBoxContainer/VBoxContainer2/Masochism_info,Globaldata.all_slaves[call_number_slave].status_masochism_slave)
	#Globaldata.all_slaves[call_number_slave].int_skills_to_string($Check_slave_status/Status_skill_sex/Fetishism/Fetishism/HBoxContainer/VBoxContainer2/Self_torture_info,Globaldata.all_slaves[call_number_slave].status_self_torture_slave)
	#Globaldata.all_slaves[call_number_slave].int_skills_to_string($Check_slave_status/Status_skill_sex/Fetishism/Fetishism/HBoxContainer/VBoxContainer2/Urinophilia_info,Globaldata.all_slaves[call_number_slave].status_urinophilia_slave)
	#Globaldata.all_slaves[call_number_slave].int_skills_to_string($Check_slave_status/Status_skill_sex/Fetishism/Fetishism/HBoxContainer/VBoxContainer2/Coprophilia_info,Globaldata.all_slaves[call_number_slave].status_coprophilia_slave)
	#Globaldata.all_slaves[call_number_slave].int_skills_to_string($Check_slave_status/Status_skill_sex/Fetishism/Fetishism/HBoxContainer/VBoxContainer2/Fuck_in_boobs_info,Globaldata.all_slaves[call_number_slave].status_fuck_in_boobs_slave)
	


func _on_xenophilia_pressed():
	$Check_slave_status/Status_skill_sex/Xenophilia.set_visible(true)
	$Check_slave_status/Status_skill_sex/Fetishism.set_visible(false)
	$Check_slave_status/Status_skill_sex/Lesbian_sex.set_visible(false)
	$Check_slave_status/Status_skill_sex/Demostration.set_visible(false)
	$Check_slave_status/Status_skill_sex/Group_sex.set_visible(false)
	$Check_slave_status/Status_skill_sex/Penetration.set_visible(false)
	$Check_slave_status/Status_skill_sex/Petting.set_visible(false)
	$Check_slave_status/Status_skill_sex/Oral_sex.set_visible(false)
	$Check_slave_status/Status_skill_sex/PanelContainer.set_visible(false)

	$Check_slave_status/Status_appearance.set_visible(false)
	$Check_slave_status/Status_anatomy.set_visible(false)
	$Check_slave_status/Status_skill_common.set_visible(false)
	$Check_slave_status/Status_clothes.set_visible(false)
	
	
	#Globaldata.all_slaves[call_number_slave].int_skills_to_string($Check_slave_status/Status_skill_sex/Xenophilia/Xenophilia/HBoxContainer/VBoxContainer2/Doggy_info,Globaldata.all_slaves[call_number_slave].status_doggy_slave)
	#Globaldata.all_slaves[call_number_slave].int_skills_to_string($Check_slave_status/Status_skill_sex/Xenophilia/Xenophilia/HBoxContainer/VBoxContainer2/Pig_info,Globaldata.all_slaves[call_number_slave].status_pig_slave)
	#Globaldata.all_slaves[call_number_slave].int_skills_to_string($Check_slave_status/Status_skill_sex/Xenophilia/Xenophilia/HBoxContainer/VBoxContainer2/Arachnid_info,Globaldata.all_slaves[call_number_slave].status_arachnid_slave)
	#Globaldata.all_slaves[call_number_slave].int_skills_to_string($Check_slave_status/Status_skill_sex/Xenophilia/Xenophilia/HBoxContainer/VBoxContainer2/Horse_info,Globaldata.all_slaves[call_number_slave].status_horse_slave)
	#Globaldata.all_slaves[call_number_slave].int_skills_to_string($Check_slave_status/Status_skill_sex/Xenophilia/Xenophilia/HBoxContainer/VBoxContainer2/Tentacles_info,Globaldata.all_slaves[call_number_slave].status_tentacles_slave)
	
	


func _on_back_petting_pressed():
	$Check_slave_status/Status_skill_sex/PanelContainer.set_visible(true)
	$Check_slave_status/Status_skill_sex/Petting.set_visible(false)


func _on_back_oral_sex_pressed():
	$Check_slave_status/Status_skill_sex/PanelContainer.set_visible(true)
	$Check_slave_status/Status_skill_sex/Oral_sex.set_visible(false)


func _on_back_penetration_pressed():
	$Check_slave_status/Status_skill_sex/PanelContainer.set_visible(true)
	$Check_slave_status/Status_skill_sex/Penetration.set_visible(false)


func _on_back_group_sex_pressed():
	$Check_slave_status/Status_skill_sex/PanelContainer.set_visible(true)
	$Check_slave_status/Status_skill_sex/Group_sex.set_visible(false)


func _on_back_demonstration_pressed():
	$Check_slave_status/Status_skill_sex/PanelContainer.set_visible(true)
	$Check_slave_status/Status_skill_sex/Demostration.set_visible(false)


func _on_back_lesbian_sex_pressed():
	$Check_slave_status/Status_skill_sex/PanelContainer.set_visible(true)
	$Check_slave_status/Status_skill_sex/Lesbian_sex.set_visible(false)


func _on_back_fetishism_pressed():
	$Check_slave_status/Status_skill_sex/PanelContainer.set_visible(true)
	$Check_slave_status/Status_skill_sex/Fetishism.set_visible(false)


func _on_back_xenophilia_pressed():
	$Check_slave_status/Status_skill_sex/PanelContainer.set_visible(true)
	$Check_slave_status/Status_skill_sex/Xenophilia.set_visible(false)



func _on_button_send_basement_pressed():
	if Globaldata.basement_slaves.size() < Globaldata.max_basement_slaves:
		Globaldata.basement_slaves.append(call_slave)
		Globaldata.all_slaves.remove_at(Globaldata.all_slaves.find(call_slave))
		_ready()
	else:
		$AcceptDialog.set_visible(true)


func _on_close_status_anatomy_pressed():
	$Check_slave_status/Status_anatomy.set_visible(false)


func _on_settings_pressed():
	MusicController.stop_play_place_music(true)
	get_tree().root.add_child(preload("res://scen/main_menu.tscn").instantiate())


func _on_accept_dialog_confirmed():
	$AcceptDialog.set_visible(false)


func _on_button_send_basement_mouse_entered():
	Globaldata.cursor = 2


func _on_button_send_basement_mouse_exited():
	Globaldata.cursor = 0


func _on_show_pictures_pressed() -> void:
	if $Show_parametr/Show_pictures.is_pressed():
		$Show_parametr/Pictures.set_visible(true)
	else:
		$Show_parametr/Pictures.set_visible(false)


func _on_hide_parametr_pressed() -> void:
	$Show_parametr.set_visible(false)


func relationships_ready():
	var vboxcontainer = VBoxContainer.new()
	vboxcontainer.set_name("VBoxContainer")
	$Show_parametr/VBoxContainer.add_child(vboxcontainer)
	
	for i in call_slave.relationships:
		var panelcontainer = PanelContainer.new()
		panelcontainer.set_name("PanelContainer" + str(i))
		$Show_parametr/VBoxContainer/VBoxContainer.add_child(panelcontainer)
		
		var hboxcontainer = HBoxContainer.new()
		hboxcontainer.set_name("HBoxContainer")
		$Show_parametr/VBoxContainer/VBoxContainer.get_node("PanelContainer" + str(i)).add_child(hboxcontainer)
		
		var texturerect = TextureRect.new()
		texturerect.set_name("TextureRect")
		texturerect.set_texture(load(i.img.full))
		texturerect.set_expand_mode(5 as TextureRect.ExpandMode)
		texturerect.set_custom_minimum_size(Vector2(150,100))
		texturerect.set_stretch_mode(0 as TextureRect.StretchMode)
		$Show_parametr/VBoxContainer/VBoxContainer.get_node("PanelContainer" + str(i)).get_node("HBoxContainer").add_child(texturerect)
		
		vboxcontainer = VBoxContainer.new()
		vboxcontainer.set_name("VBoxContainer")
		$Show_parametr/VBoxContainer/VBoxContainer.get_node("PanelContainer" + str(i)).get_node("HBoxContainer").add_child(vboxcontainer)
		
		var label = Label.new()
		label.set_name("Name_slave")
		label.set_text(i.slave_name) 
		$Show_parametr/VBoxContainer/VBoxContainer.get_node("PanelContainer" + str(i)).get_node("HBoxContainer").get_node("VBoxContainer").add_child(label)
		
		label = Label.new()
		label.set_name("Relationship")
		label.set_text(call_slave.relationships_to_text(call_slave.relationships[i]))
		$Show_parametr/VBoxContainer/VBoxContainer.get_node("PanelContainer" + str(i)).get_node("HBoxContainer").get_node("VBoxContainer").add_child(label)
	

func _on_button_relationships_pressed() -> void:
	if $Show_parametr/VBoxContainer.get_node_or_null("VBoxContainer") != null:
		$Show_parametr/VBoxContainer/VBoxContainer.free()
	$Show_parametr/VBoxContainer/Name_parametr.set_text("Отношения")
	relationships_ready()
	$Show_parametr.set_visible(true)
	$Show_parametr/Pictures.set_visible(false)
	$Show_parametr/Show_pictures.set_visible(false)

func actions_ready():
	var vboxcontainer = VBoxContainer.new()
	vboxcontainer.set_name("VBoxContainer")
	$Show_parametr/VBoxContainer.add_child(vboxcontainer)
	
	var gamebutton = GameButton.new()
	gamebutton.set_name("Beat")
	gamebutton.set_text("Избить")
	gamebutton.pressed.connect(_on_beat_button_pressed)
	vboxcontainer.add_child(gamebutton)
	
	gamebutton = GameButton.new()
	gamebutton.set_name("Praise")
	gamebutton.set_text("Похвалить")
	gamebutton.pressed.connect(_on_praise_button_pressed)
	vboxcontainer.add_child(gamebutton)
	
	gamebutton = GameButton.new()
	gamebutton.set_name("Rape")
	gamebutton.set_text("Изнасиловать")
	gamebutton.pressed.connect(_on_rape_button_pressed)
	vboxcontainer.add_child(gamebutton)
	
	gamebutton = GameButton.new()
	gamebutton.set_name("Talk")
	gamebutton.set_text("Поговорить")
	gamebutton.pressed.connect(_on_talk_button_pressed)
	vboxcontainer.add_child(gamebutton)

func _on_actions_pressed() -> void:
	if $Show_parametr/VBoxContainer.get_node_or_null("VBoxContainer") != null:
		$Show_parametr/VBoxContainer/VBoxContainer.free()
	$Show_parametr/VBoxContainer/Name_parametr.set_text("Действия")
	actions_ready()
	$Show_parametr.set_visible(true)
	$Show_parametr/Pictures.set_visible(false)
	$Show_parametr/Show_pictures.set_visible(false)
	pass # Replace with function body.

func _on_beat_button_pressed():
	call_slave.condition.pain += 1
	$Dialog_scene.visible = not $Dialog_scene.visible
	dialog_window("Избить")
	

func _on_praise_button_pressed():
	call_slave.condition.pamperedness += 1
	$Dialog_scene.visible = not $Dialog_scene.visible
	dialog_window("Похвалить")
	

func _on_rape_button_pressed():
	$Dialog_scene.set_texture(load("res://GameData/img/Game/Girls/Actions/Sex/Sex1.png"))
	$Dialog_scene.visible = not $Dialog_scene.visible
	dialog_window("Изнасиловать")
	pass

func _on_talk_button_pressed():
	if $Show_parametr/VBoxContainer.get_node_or_null("VBoxContainer") != null:
		$Show_parametr/VBoxContainer/VBoxContainer.free()
	$Show_parametr/VBoxContainer/Name_parametr.set_text("Поговорить")
	
	var vboxcontainer = VBoxContainer.new()
	vboxcontainer.set_name("VBoxContainer")
	$Show_parametr/VBoxContainer.add_child(vboxcontainer)
	
	var gamebutton = GameButton.new()
	gamebutton.set_name("Slave_social_status")
	gamebutton.set_text("Указать рабыне её положение")
	gamebutton.pressed.connect(_on_slave_social_status_button_pressed)
	vboxcontainer.add_child(gamebutton)
	pass

func _on_slave_social_status_button_pressed():
	
	pass

func dialog_window(action):
	match(action):
		"Избить":
			$Dialog_scene/Dialog_window/Dialog_text.set_text("Вы избили рабыню")
		"Похвалить":
			$Dialog_scene/Dialog_window/Dialog_text.set_text("Вы Похвалили рабыню")
		"Изнасиловать":
			$Dialog_scene/Dialog_window/Dialog_text.set_text("Вы изнаслиовали рабыню")





func _on_next_dialog_phrase_pressed() -> void:
	if $Dialog_scene.is_visible():
		$Dialog_scene.visible = not $Dialog_scene.visible
	$Dialog_scene.set_texture(null)
	
