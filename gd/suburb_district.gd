extends Node2D

func _ready():
	for i in range(len(Globaldata.hero.place_suburb_district)):
		match i:
			1:
				if Globaldata.hero.place_suburb_district[1] == 0:
					$Places_in_the_district/VBoxContainer/Enter_public_animal_farm.set_text("Неизвестно")
				else:
					$Places_in_the_district/VBoxContainer/Enter_public_animal_farm.set_text("Публичная звероферма")
			2:
				if Globaldata.hero.place_suburb_district[i] == 0:
					$Places_in_the_district/VBoxContainer/Enter_black_smith_shop.set_text("Неизвестно")
				else:
					$Places_in_the_district/VBoxContainer/Enter_black_smith_shop.set_text("Кузня")

	
	
	Globaldata.next_day_time()
	MainHeroCharacter.info_place_set_text("Пригород")

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


func _on_go_to_slum_district_pressed():
	MusicController.play_steps("res://GameData/snd/Game/Шаги.mp3")
	get_tree().change_scene_to_file("res://scen/slum_disrtict.tscn")


func _on_place_info_pressed():
	match $Info.is_visible():
		true:
			$Info.set_visible(false)
		false:
			$Info.set_visible(true)


func _on_enter_public_animal_farm_pressed():
	get_tree().change_scene_to_file("res://scen/animal_farm.tscn")


func _on_enter_black_smith_shop_pressed():
	get_tree().change_scene_to_file("res://scen/blacksmith.tscn")
