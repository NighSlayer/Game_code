extends Node2D

var temporarily_buttons = []
var choosen_work

func add_button(disp_slave,counter,first_text,first_parametr,second_text,second_parametr,third_text,third_parametr):
	var button = Button.new()
	button.name = "Slave" + str(counter)
	button.set_custom_minimum_size(Vector2(384,150))
	
	var texturerect = TextureRect.new()
	texturerect.set_texture(load("res://GameData/img/Game/Interface/Задний фон для клавишь.jpg"))
	texturerect.set_expand_mode(1)
	texturerect.set_anchors_preset(15)
	button.add_child(texturerect)
	
	var hboxcontainer = HBoxContainer.new()
	hboxcontainer.name = "HBoxContainer"
	hboxcontainer.set_size(Vector2(384,150))
	button.add_child(hboxcontainer)
	
	texturerect = TextureRect.new()
	texturerect.set_texture(load(disp_slave.img.full))
	texturerect.set_expand_mode(1)
	texturerect.set_custom_minimum_size(Vector2(150,100))
	texturerect.set_stretch_mode(6)
	hboxcontainer.add_child(texturerect)
	
	var vboxcontainer = VBoxContainer.new()
	vboxcontainer.name = "VBoxContainer"
	vboxcontainer.set_alignment(1)
	hboxcontainer.add_child(vboxcontainer)
	
	
	var label = Label.new()
	label.name = "Slave_name"
	label.set_text(disp_slave.slave_name)
	label.add_theme_font_override("font",load("res://GameData/Fonts/Текст параметров.ttf"))
	label.add_theme_font_size_override("font_size", 20)
	vboxcontainer.add_child(label)
	
	hboxcontainer = HBoxContainer.new()
	hboxcontainer.name = "HBoxContainer"
	vboxcontainer.add_child(hboxcontainer)
	
	label = Label.new()
	label.name = "Skill1"
	label.set_text(first_text)
	label.add_theme_font_override("font",load("res://GameData/Fonts/Текст параметров.ttf"))
	label.add_theme_font_size_override("font_size", 20)
	hboxcontainer.add_child(label)
	
	
	texturerect = TextureRect.new()
	texturerect.name = "Picture_skill1"
	texturerect.set_texture(disp_slave.skills_to_picture(first_parametr))
	texturerect.set_expand_mode(1)
	texturerect.set_custom_minimum_size(Vector2(100,0))
	hboxcontainer.add_child(texturerect)
	
	hboxcontainer = HBoxContainer.new()
	hboxcontainer.name = "HBoxContainer2"
	vboxcontainer.add_child(hboxcontainer)
	
	label = Label.new()
	label.name = "Skill2"
	label.set_text(second_text)
	label.add_theme_font_override("font",load("res://GameData/Fonts/Текст параметров.ttf"))
	label.add_theme_font_size_override("font_size", 20)
	hboxcontainer.add_child(label)
	
	
	texturerect = TextureRect.new()
	texturerect.name = "Picture_skill2"
	texturerect.set_texture(disp_slave.skills_to_picture(second_parametr))
	texturerect.set_expand_mode(1)
	texturerect.set_custom_minimum_size(Vector2(100,0))
	hboxcontainer.add_child(texturerect)
	
	hboxcontainer = HBoxContainer.new()
	hboxcontainer.name = "HBoxContainer3"
	vboxcontainer.add_child(hboxcontainer)
	
	label = Label.new()
	label.name = "Skill3"
	label.set_text(third_text)
	label.add_theme_font_override("font",load("res://GameData/Fonts/Текст параметров.ttf"))
	label.add_theme_font_size_override("font_size", 20)
	hboxcontainer.add_child(label)



	texturerect = TextureRect.new()
	texturerect.name = "Picture_skill3"
	texturerect.set_texture(disp_slave.skills_to_picture(third_parametr))
	texturerect.set_expand_mode(1)
	texturerect.set_custom_minimum_size(Vector2(100,0))
	hboxcontainer.add_child(texturerect)
	
	button.pressed.connect(_on_button_slave_pressed.bind(disp_slave,button))
	return button

func return_text_dialog():
	if choosen_work == "Уборка кузни":
		$Dialog.set_text("Рабыня взяла грабли и пошла убираться")
	if choosen_work == "Помочь как подмастерье":
		$Dialog.set_text("С неволей она пошла выполнять работу")
	if choosen_work == "Привлекать посетителей":
		$Dialog.set_text("Переодевшись в вульгарную одежду рабыня вышла раздавать листовки")
	if choosen_work == "Кормить животных":
		$Dialog.set_text("Взяв ведро с кормом рабыня пошла кормить животных")

func return_sound_work():
	if choosen_work == "Уборка кузни":
		var dir:Array = DirAccess.get_files_at("res://GameData/snd/Game/Places/Suburb_district/Публичная звероферма/Работа/Уборка стойла/")
		var choose = dir.pick_random()
		while choose.ends_with(".import"):
			choose = dir.pick_random()
		return load("res://GameData/snd/Game/Places/Suburb_district/Публичная звероферма/Работа/Уборка стойла/" + choose)
	if choosen_work == "Помочь как подмастерье":
		var dir:Array = DirAccess.get_files_at("res://GameData/snd/Game/Places/Suburb_district/Публичная звероферма/Работа/Ублажение скота/")
		var choose = dir.pick_random()
		while choose.ends_with(".import"):
			choose = dir.pick_random()
		return load("res://GameData/snd/Game/Places/Suburb_district/Публичная звероферма/Работа/Ублажение скота/" + choose)
	if choosen_work == "Привлекать посетителей":
		var dir:Array = DirAccess.get_files_at("res://GameData/snd/Game/Places/Suburb_district/Публичная звероферма/Работа/Привлечение людей/")
		var choose = dir.pick_random()
		while choose.ends_with(".import"):
			choose = dir.pick_random()
		return load("res://GameData/snd/Game/Places/Suburb_district/Публичная звероферма/Работа/Привлечение людей/" + choose)
	if choosen_work == "Кормить животных":
		var dir:Array = DirAccess.get_files_at("res://GameData/snd/Game/Places/Suburb_district/Публичная звероферма/Работа/Кормёжка скота/")
		var choose = dir.pick_random()
		while choose.ends_with(".import"):
			choose = dir.pick_random()
		return load("res://GameData/snd/Game/Places/Suburb_district/Публичная звероферма/Работа/Кормёжка скота/" + choose)

func return_picture_work():
	$Rect_of_work.set_visible(true)
	MainHeroCharacter.main_hero_visible()
	if choosen_work == "Уборка кузни":
		var dir:Array = DirAccess.get_files_at("res://GameData/img/Game/Places/Suburb_district/Публичная звероферма/Работа/Уборка хлева/")
		var choose = dir.pick_random()
		while choose.ends_with(".import"):
			choose = dir.pick_random()
		return load("res://GameData/img/Game/Places/Suburb_district/Публичная звероферма/Работа/Уборка хлева/" + choose)
	if choosen_work == "Помочь как подмастерье":
		match randi_range(1,3):
			1:
				var dir:Array = DirAccess.get_files_at("res://GameData/img/Game/Shared pictures/Жеребец")
				var choose = dir.pick_random()
				while choose.ends_with(".import"):
					choose = dir.pick_random()
				return load("res://GameData/img/Game/Shared pictures/Жеребец/" + choose)
			2:
				var dir:Array = DirAccess.get_files_at("res://GameData/img/Game/Shared pictures/Кобель")
				var choose = dir.pick_random()
				while choose.ends_with(".import"):
					choose = dir.pick_random()
				return load("res://GameData/img/Game/Shared pictures/Кобель/" + choose)
			3:
				var dir:Array = DirAccess.get_files_at("res://GameData/img/Game/Shared pictures/Хряк")
				var choose = dir.pick_random()
				while choose.ends_with(".import"):
					choose = dir.pick_random()
				return load("res://GameData/img/Game/Shared pictures/Хряк/" + choose)
	if choosen_work == "Привлекать посетителей":
		var dir:Array = DirAccess.get_files_at("res://GameData/img/Game/Places/Suburb_district/Публичная звероферма/Работа/Привлечение посетителей/")
		var choose = dir.pick_random()
		while choose.ends_with(".import"):
			choose = dir.pick_random()
		return load("res://GameData/img/Game/Places/Suburb_district/Публичная звероферма/Работа/Привлечение посетителей/" + choose)
	if choosen_work == "Кормить животных":
		var dir:Array = DirAccess.get_files_at("res://GameData/img/Game/Places/Suburb_district/Публичная звероферма/Работа/Кормёжка животных/")
		var choose = dir.pick_random()
		while choose.ends_with(".import"):
			choose = dir.pick_random()
		return load("res://GameData/img/Game/Places/Suburb_district/Публичная звероферма/Работа/Кормёжка животных/" + choose)

func update_choose_slave(disp_slave,counter,first_text,first_parametr,second_text,second_parametr,third_text,third_parametr):
	get_node("Choose_slave/VBoxContainer/Slave" + str(counter) + "/HBoxContainer/VBoxContainer/HBoxContainer/Skill1").set_text(first_text)
	get_node("Choose_slave/VBoxContainer/Slave" + str(counter) + "/HBoxContainer/VBoxContainer/HBoxContainer/Picture_skill1").set_texture(disp_slave.skills_to_picture(first_parametr))
	if second_parametr != null and second_text != null:
		get_node("Choose_slave/VBoxContainer/Slave" + str(counter) + "/HBoxContainer/VBoxContainer/HBoxContainer2").set_visible(true)
		get_node("Choose_slave/VBoxContainer/Slave" + str(counter) + "/HBoxContainer/VBoxContainer/HBoxContainer2/Skill2").set_text(second_text)
		get_node("Choose_slave/VBoxContainer/Slave" + str(counter) + "/HBoxContainer/VBoxContainer/HBoxContainer2/Picture_skill2").set_texture(disp_slave.skills_to_picture(second_parametr))
	else:
		get_node("Choose_slave/VBoxContainer/Slave" + str(counter) + "/HBoxContainer/VBoxContainer/HBoxContainer2").set_visible(false)
	if third_parametr != null and third_text != null:
		get_node("Choose_slave/VBoxContainer/Slave" + str(counter) + "/HBoxContainer/VBoxContainer/HBoxContainer3").set_visible(true)
		get_node("Choose_slave/VBoxContainer/Slave" + str(counter) + "/HBoxContainer/VBoxContainer/HBoxContainer3/Skill3").set_text(third_text)
		get_node("Choose_slave/VBoxContainer/Slave" + str(counter) + "/HBoxContainer/VBoxContainer/HBoxContainer3/Picture_skill3").set_texture(disp_slave.skills_to_picture(third_parametr))
	else:
		get_node("Choose_slave/VBoxContainer/Slave" + str(counter) + "/HBoxContainer/VBoxContainer/HBoxContainer3").set_visible(false)
	pass
	if disp_slave.time_work != 0:
			get_node("Choose_slave/VBoxContainer/Slave" + str(counter)).set_visible(false)

func _on_button_slave_pressed(active_slave,now_pressed):
	# Добавить зависимотсь от типа работы выплаты и время работы
	if choosen_work == "Уборка кузни":
		active_slave.time_work = 2
		Globaldata.money += int(Globaldata.difficult_ratio * active_slave.common.housekeeping * 2)
		MainHeroCharacter.update_main_hero_money()
	if choosen_work == "Помочь как подмастерье":
		active_slave.anatomy.virgin = false
		active_slave.time_work = 2
		Globaldata.money += int(Globaldata.difficult_ratio * active_slave.appearance.strength * active_slave.appearance.agility * 5)
		MainHeroCharacter.update_main_hero_money()
	if choosen_work == "Привлекать посетителей":
		active_slave.time_work = 2
		Globaldata.money += int(Globaldata.difficult_ratio * active_slave.common.etiquette_and_rehetoric * 4)
		MainHeroCharacter.update_main_hero_money()
	if choosen_work == "Кормить животных":
		active_slave.time_work = 2
		Globaldata.money += int(Globaldata.difficult_ratio * active_slave.common.farming * 1.5)
		MainHeroCharacter.update_main_hero_money()
	return_text_dialog()
	$Work_sound.set_stream(return_sound_work())
	$Work_sound.play()
	$Rect_of_work/Picture_work.set_texture(return_picture_work())

func _ready():
	$Embient.play()
	Globaldata.all_slaves.append(class_slave.new())
	for i in range(Globaldata.all_slaves.size()):
		temporarily_buttons.append(add_button(Globaldata.all_slaves[i],i,"Кобель",Globaldata.all_slaves[i].sexual.doggy,"Хряк",Globaldata.all_slaves[i].sexual.pig,"Жеребец",Globaldata.all_slaves[i].sexual.horse))
		$Choose_slave/VBoxContainer.add_child(temporarily_buttons[i])
		if Globaldata.all_slaves[i].time_work != 0:
			get_node("Choose_slave/VBoxContainer/Slave" + str(i)).set_visible(false)
	


func _on_work_pressed():
	$Actions.set_visible(false)
	$Work.set_visible(true)


func _on_give_slave_pressed():
	pass # Replace with function body.


func _on_question_pressed():
	pass # Replace with function body.


func _on_buy_equipment_pressed():
	$Actions.set_visible(false)
	$Buy_Equipment.set_visible(true)


func _on_exit_pressed():
	get_tree().change_scene_to_file("res://scen/suburb_district.tscn")


func _on_clear_blacksmith_pressed():
	$Work.set_visible(false)
	$Choose_slave.set_visible(true)
	choosen_work = "Уборка кузни"
	for i in range(Globaldata.all_slaves.size()):
		update_choose_slave(Globaldata.all_slaves[i],i,"Уборка",Globaldata.all_slaves[i].common.housekeeping,null,null,null,null)



func _on_help_apprentice_pressed():
	$Work.set_visible(false)
	$Choose_slave.set_visible(true)
	choosen_work = "Помочь как подмастерье"
	for i in range(Globaldata.all_slaves.size()):
		update_choose_slave(Globaldata.all_slaves[i],i,"Сила",Globaldata.all_slaves[i].appearance.strength,"Ловкость",Globaldata.all_slaves[i].appearance.agility,null,null)


func _on_attract_visitors_pressed():
	$Work.set_visible(false)
	$Choose_slave.set_visible(true)
	choosen_work = "Привлекать посетителей"
	for i in range(Globaldata.all_slaves.size()):
		update_choose_slave(Globaldata.all_slaves[i],i,"Общение",Globaldata.all_slaves[i].common.etiquette_and_rehetoric,null,null,null,null)


func _on_back_work_pressed():
	$Work.set_visible(false)
	$Actions.set_visible(true)


func _on_back_buy_equipment_pressed():
	$Buy_Equipment.set_visible(false)
	$Actions.set_visible(true)


func _on_next_pressed():
	$Rect_of_work.set_visible(false)
	$Choose_slave.set_visible(false)
	MainHeroCharacter.main_hero_visible()
	$Actions.set_visible(true)
	$Work_sound.stop()


func _on_back_choose_slave_pressed():
	$Choose_slave.set_visible(false)
	$Work.set_visible(true)
