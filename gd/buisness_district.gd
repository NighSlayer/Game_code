extends Node2D

func _ready():
	for i in range(len(Globaldata.hero.place_buisness_district)):
		match i:
			1:
				if Globaldata.hero.place_buisness_district[1] == 0:
					$Places_in_the_district/VBoxContainer/Enter_pub.set_text("Неизвестно")
				else:
					$Places_in_the_district/VBoxContainer/Enter_pub.set_text("Паб")
			2:
				if Globaldata.hero.place_buisness_district[i] == 0:
					$Places_in_the_district/VBoxContainer/Enter_guild_slave_owners.set_text("Неизвестно")
				else:
					$Places_in_the_district/VBoxContainer/Enter_guild_slave_owners.set_text("Гилдия работорговцев")
			3:
				if Globaldata.hero.place_buisness_district[i] == 0:
					$Places_in_the_district/VBoxContainer/Enter_real_estate_offices.set_text("Неизвестно")
				else:
					$Places_in_the_district/VBoxContainer/Enter_real_estate_offices.set_text("Риэлторский  офис")
	
	
	
	Globaldata.next_day_time()
	MainHeroCharacter.info_place_set_text("Деловой район")

func _on_go_to_elite_district_pressed():
	MusicController.play_steps("res://GameData/snd/Game/Шаги.mp3")
	get_tree().change_scene_to_file("res://scen/elite_district.tscn")


func _on_go_to_rich_district_pressed():
	MusicController.play_steps("res://GameData/snd/Game/Шаги.mp3")
	get_tree().change_scene_to_file("res://scen/rich_district.tscn")


func _on_go_to_merchant_district_pressed():
	MusicController.play_steps("res://GameData/snd/Game/Шаги.mp3")
	get_tree().change_scene_to_file("res://scen/merchant_district.tscn")


func _on_go_to_poor_district_pressed():
	MusicController.play_steps("res://GameData/snd/Game/Шаги.mp3")
	get_tree().change_scene_to_file("res://scen/poor_district.tscn")


func _on_go_to_slum_district_pressed():
	MusicController.play_steps("res://GameData/snd/Game/Шаги.mp3")
	get_tree().change_scene_to_file("res://scen/slum_disrtict.tscn")


func _on_go_to_suburb_district_pressed():
	MusicController.play_steps("res://GameData/snd/Game/Шаги.mp3")
	get_tree().change_scene_to_file("res://scen/suburb_district.tscn")


func _on_place_info_pressed():
	match $Info.is_visible():
		true:
			$Info.set_visible(false)
		false:
			$Info.set_visible(true)
