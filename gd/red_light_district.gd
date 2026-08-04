extends Node2D

func _ready():
	MusicController.place_music = "res://GameData/snd/Game/Red light street/Background.mp3"
	MusicController.place_play_music(0)


func _on_to_triding_area_pressed():
	get_tree().change_scene_to_file("res://scen/trading_area.tscn")
	MusicController.play_steps("res://GameData/snd/Game/Шаги.mp3")


func _on_to_enter_city_pressed():
	get_tree().change_scene_to_file("res://scen/enter_of_city.tscn")
	MusicController.play_steps("res://GameData/snd/Game/Шаги.mp3")


func _on_enter_the_brothel_pressed():
	get_tree().change_scene_to_file("res://scen/brothel.tscn")
	MusicController.play_steps("res://GameData/snd/Game/Шаги.mp3")
	MusicController.open_door_music()


func _on_settings_pressed():
	MusicController.stop_play_place_music(true)
	Globaldata.settings_scene = true
	get_tree().root.add_child(preload("res://scen/main_menu.tscn").instantiate())
