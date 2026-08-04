extends Node2D

func _ready():
	Globaldata.next_day_time()
	MainHeroCharacter.info_place_set_text("Бедный район")

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
