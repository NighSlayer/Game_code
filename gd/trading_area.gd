extends Node2D

func _ready():
	pass

func _on_enter_of_city_pressed():
	get_tree().change_scene_to_file("res://scen/enter_of_city.tscn")
	MusicController.play_steps("res://GameData/snd/Game/Шаги.mp3")


func _on_slave_auction_pressed():
	MusicController.play_steps("res://GameData/snd/Game/Шаги.mp3")
	MusicController.open_door_music()
	get_tree().change_scene_to_file("res://scen/slave_auction.tscn")
	

func _on_home_pressed():
	MusicController.play_steps("res://GameData/snd/Game/Шаги.mp3")
	MusicController.open_door_music()
	get_tree().change_scene_to_file("res://scen/home.tscn")


func _on_red_street_light_pressed():
	get_tree().change_scene_to_file("res://scen/red_light_district.tscn")
	MusicController.play_steps("res://GameData/snd/Game/Шаги.mp3")


func _on_tailor_pressed():
	get_tree().change_scene_to_file("res://scen/tailor.tscn")
	MusicController.play_steps("res://GameData/snd/Game/Шаги.mp3")


func _on_settings_pressed():
	MusicController.stop_play_place_music(true)
	Globaldata.settings_scene = true
	get_tree().root.add_child(preload("res://scen/main_menu.tscn").instantiate())



func _on_my_shop_pressed():
	get_tree().change_scene_to_file("res://scen/my_shop.tscn")
