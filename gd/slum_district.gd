extends Node2D

var info = 0

func _ready():
	MusicController.return_name_place_music().stop()
	for i in range(len(Globaldata.hero.place_know)):
		match(i):
			1:
				if Globaldata.hero.place_know[0] != 1:
					$Walk_on_city/VBoxContainer/Go_to_buisness_district.set_text("Неизвестно")
			2:
				if Globaldata.hero.place_know[1] != 1:
					$Walk_on_city/VBoxContainer/Go_to_buisness_district.set_text("Неизвестно")
			3:
				if Globaldata.hero.place_know[2] != 1:
					$Walk_on_city/VBoxContainer/Go_to_buisness_district.set_text("Неизвестно")
			4:
				if Globaldata.hero.place_know[3] != 1:
					$Walk_on_city/VBoxContainer/Go_to_buisness_district.set_text("Неизвестно")
			5:
				if Globaldata.hero.place_know[4] != 1:
					$Walk_on_city/VBoxContainer/Go_to_buisness_district.set_text("Неизвестно")
			6:
				if !Globaldata.hero.place_know[5] != 1:
					$Walk_on_city/VBoxContainer/Go_to_buisness_district.set_text("Неизвестно")
	
	Globaldata.next_day_time()
	MainHeroCharacter.info_place_set_text("Трущобы")
	

func _on_traiding_area_pressed():
	get_tree().change_scene_to_file("res://scen/trading_area.tscn")
	MusicController.play_steps("res://GameData/snd/Game/Шаги.mp3")



func _on_home_pressed():
	MusicController.play_steps("res://GameData/snd/Game/Шаги.mp3")
	MusicController.open_door_music()
	get_tree().change_scene_to_file("res://scen/home.tscn")


func _on_red_light_street_pressed():
	get_tree().change_scene_to_file("res://scen/red_light_district.tscn")
	MusicController.play_steps("res://GameData/snd/Game/Шаги.mp3")



func _on_settings_pressed():
	MusicController.stop_play_place_music(true)
	Globaldata.settings_scene = true
	get_tree().root.add_child(preload("res://scen/main_menu.tscn").instantiate())


func _on_go_to_elite_district_pressed():
	MusicController.play_steps("res://GameData/snd/Game/Шаги.mp3")
	get_tree().change_scene_to_file("res://scen/elite_district.tscn")


func _on_go_to_rich_district_pressed():
	MusicController.play_steps("res://GameData/snd/Game/Шаги.mp3")
	get_tree().change_scene_to_file("res://scen/rich_district.tscn")


func _on_go_to_merchant_district_pressed():
	MusicController.play_steps("res://GameData/snd/Game/Шаги.mp3")
	get_tree().change_scene_to_file("res://scen/merchant_district.tscn")


func _on_go_to_buisness_district_pressed():
	MusicController.play_steps("res://GameData/snd/Game/Шаги.mp3")
	get_tree().change_scene_to_file("res://scen/buisness_district.tscn")


func _on_go_to_poor_district_pressed():
	MusicController.play_steps("res://GameData/snd/Game/Шаги.mp3")
	get_tree().change_scene_to_file("res://scen/poor_district.tscn")


func _on_go_to_suburb_district_pressed():
	MusicController.play_steps("res://GameData/snd/Game/Шаги.mp3")
	get_tree().change_scene_to_file("res://scen/suburb_district.tscn")


func _on_place_info_pressed():
	match $Info.is_visible():
		true:
			$Info.set_visible(false)
		false:
			$Info.set_visible(true)
