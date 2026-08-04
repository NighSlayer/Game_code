extends Node2D


func _ready():
	$Body_part_clothes.set_visible(false)
	pass

func _on_back_pressed():
	get_tree().change_scene_to_file("res://scen/home.tscn")
	MusicController.play_steps("res://GameData/snd/Game/Home/Шаги дома.mp3")




func _on_check_body_part_pressed(index_clothes_check) -> void:
	$Body_part_clothes.set_visible(true)
	
	if $Body_part_clothes/PanelContainer/ScrollContainer.get_node_or_null("VBoxContainer") != null:
		$Body_part_clothes/PanelContainer/ScrollContainer/VBoxContainer.free()
	
	var vboxcontainer = VBoxContainer.new()
	vboxcontainer.set_name("VBoxContainer")
	vboxcontainer.add_theme_constant_override("separation", 10)
	vboxcontainer.set_alignment(1 as BoxContainer.AlignmentMode)
	vboxcontainer.set_h_size_flags(3)
	vboxcontainer.set_v_size_flags(3)
	$Body_part_clothes/PanelContainer/ScrollContainer.add_child(vboxcontainer)
	
	match index_clothes_check:
		0:
			for now_clothes in range(len(Globaldata.all_clothes[index_clothes_check])):
				var label = Label.new()
				label.set_name("Clothes_" + str(now_clothes))
				label.set_text(Globaldata.all_clothes[index_clothes_check][now_clothes])
				label.add_theme_font_size_override("font_size",30)
				label.add_theme_font_override("font",load("res://GameData/Fonts/Подпись клавишь.ttf"))
				label.add_theme_color_override("font_color",Color(0,0,0))
				label.set_horizontal_alignment(1 as HorizontalAlignment)
				var stylebox = StyleBoxTexture.new()
				stylebox.set_texture(load("res://GameData/img/Game/Interface/Светлый задний фон для клавишь.jpg"))
				label.add_theme_stylebox_override("normal",stylebox)
				vboxcontainer.add_child(label)
		1:
			for now_clothes in range(len(Globaldata.all_clothes[index_clothes_check])):
				var label = Label.new()
				label.set_name("Clothes_" + str(now_clothes))
				label.set_text(Globaldata.all_clothes[index_clothes_check][now_clothes])
				label.add_theme_font_size_override("font_size",30)
				label.add_theme_font_override("font",load("res://GameData/Fonts/Подпись клавишь.ttf"))
				label.add_theme_color_override("font_color",Color(0,0,0))
				label.set_horizontal_alignment(1 as HorizontalAlignment)
				var stylebox = StyleBoxTexture.new()
				stylebox.set_texture(load("res://GameData/img/Game/Interface/Светлый задний фон для клавишь.jpg"))
				label.add_theme_stylebox_override("normal",stylebox)
				vboxcontainer.add_child(label)
		2:
			for now_clothes in range(len(Globaldata.all_clothes[index_clothes_check])):
				var label = Label.new()
				label.set_name("Clothes_" + str(now_clothes))
				label.set_text(Globaldata.all_clothes[index_clothes_check][now_clothes])
				label.add_theme_font_size_override("font_size",30)
				label.add_theme_font_override("font",load("res://GameData/Fonts/Подпись клавишь.ttf"))
				label.add_theme_color_override("font_color",Color(0,0,0))
				label.set_horizontal_alignment(1 as HorizontalAlignment)
				var stylebox = StyleBoxTexture.new()
				stylebox.set_texture(load("res://GameData/img/Game/Interface/Светлый задний фон для клавишь.jpg"))
				label.add_theme_stylebox_override("normal",stylebox)
				vboxcontainer.add_child(label)
		3:
			for now_clothes in range(len(Globaldata.all_clothes[index_clothes_check])):
				var label = Label.new()
				label.set_name("Clothes_" + str(now_clothes))
				label.set_text(Globaldata.all_clothes[index_clothes_check][now_clothes])
				label.add_theme_font_size_override("font_size",30)
				label.add_theme_font_override("font",load("res://GameData/Fonts/Подпись клавишь.ttf"))
				label.add_theme_color_override("font_color",Color(0,0,0))
				label.set_horizontal_alignment(1 as HorizontalAlignment)
				var stylebox = StyleBoxTexture.new()
				stylebox.set_texture(load("res://GameData/img/Game/Interface/Светлый задний фон для клавишь.jpg"))
				label.add_theme_stylebox_override("normal",stylebox)
				vboxcontainer.add_child(label)
		4:
			for now_clothes in range(len(Globaldata.all_clothes[index_clothes_check])):
				var label = Label.new()
				label.set_name("Clothes_" + str(now_clothes))
				label.set_text(Globaldata.all_clothes[index_clothes_check][now_clothes])
				label.add_theme_font_size_override("font_size",30)
				label.add_theme_font_override("font",load("res://GameData/Fonts/Подпись клавишь.ttf"))
				label.add_theme_color_override("font_color",Color(0,0,0))
				label.set_horizontal_alignment(1 as HorizontalAlignment)
				var stylebox = StyleBoxTexture.new()
				stylebox.set_texture(load("res://GameData/img/Game/Interface/Светлый задний фон для клавишь.jpg"))
				label.add_theme_stylebox_override("normal",stylebox)
				vboxcontainer.add_child(label)
		5:
			for now_clothes in range(len(Globaldata.all_clothes[index_clothes_check])):
				var label = Label.new()
				label.set_name("Clothes_" + str(now_clothes))
				label.set_text(Globaldata.all_clothes[index_clothes_check][now_clothes])
				label.add_theme_font_size_override("font_size",30)
				label.add_theme_font_override("font",load("res://GameData/Fonts/Подпись клавишь.ttf"))
				label.add_theme_color_override("font_color",Color(0,0,0))
				label.set_horizontal_alignment(1 as HorizontalAlignment)
				var stylebox = StyleBoxTexture.new()
				stylebox.set_texture(load("res://GameData/img/Game/Interface/Светлый задний фон для клавишь.jpg"))
				label.add_theme_stylebox_override("normal",stylebox)
				vboxcontainer.add_child(label)
		6:
			for now_clothes in range(len(Globaldata.all_clothes[index_clothes_check])):
				var label = Label.new()
				label.set_name("Clothes_" + str(now_clothes))
				label.set_text(Globaldata.all_clothes[index_clothes_check][now_clothes])
				label.add_theme_font_size_override("font_size",30)
				label.add_theme_font_override("font",load("res://GameData/Fonts/Подпись клавишь.ttf"))
				label.add_theme_color_override("font_color",Color(0,0,0))
				label.set_horizontal_alignment(1 as HorizontalAlignment)
				var stylebox = StyleBoxTexture.new()
				stylebox.set_texture(load("res://GameData/img/Game/Interface/Светлый задний фон для клавишь.jpg"))
				label.add_theme_stylebox_override("normal",stylebox)
				vboxcontainer.add_child(label)
		7:
			for now_clothes in range(len(Globaldata.all_clothes[index_clothes_check])):
				var label = Label.new()
				label.set_name("Clothes_" + str(now_clothes))
				label.set_text(Globaldata.all_clothes[index_clothes_check][now_clothes])
				label.add_theme_font_size_override("font_size",30)
				label.add_theme_font_override("font",load("res://GameData/Fonts/Подпись клавишь.ttf"))
				label.add_theme_color_override("font_color",Color(0,0,0))
				label.set_horizontal_alignment(1 as HorizontalAlignment)
				var stylebox = StyleBoxTexture.new()
				stylebox.set_texture(load("res://GameData/img/Game/Interface/Светлый задний фон для клавишь.jpg"))
				label.add_theme_stylebox_override("normal",stylebox)
				vboxcontainer.add_child(label)
		8:
			for now_clothes in range(len(Globaldata.all_clothes[index_clothes_check])):
				var label = Label.new()
				label.set_name("Clothes_" + str(now_clothes))
				label.set_text(Globaldata.all_clothes[index_clothes_check][now_clothes])
				label.add_theme_font_size_override("font_size",30)
				label.add_theme_font_override("font",load("res://GameData/Fonts/Подпись клавишь.ttf"))
				label.add_theme_color_override("font_color",Color(0,0,0))
				label.set_horizontal_alignment(1 as HorizontalAlignment)
				var stylebox = StyleBoxTexture.new()
				stylebox.set_texture(load("res://GameData/img/Game/Interface/Светлый задний фон для клавишь.jpg"))
				label.add_theme_stylebox_override("normal",stylebox)
				vboxcontainer.add_child(label)
