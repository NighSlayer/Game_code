extends Node2D


func _ready():
	MainHeroCharacter.main_hero_visible()
	AudioServer.set_bus_volume_db(0, Globaldata.volume_ratio_master)
	AudioServer.set_bus_volume_db(1, Globaldata.volume_ratio_music)
	AudioServer.set_bus_volume_db(2, Globaldata.volume_ratio_sfx)
	$Music.play()
	if Globaldata.settings_scene:
		$Start_buttons/PanelContainer/HBoxContainer/Start_game.set_visible(false)
		$Start_buttons/PanelContainer/HBoxContainer/Load_game.set_visible(false)
		$Start_buttons/PanelContainer/HBoxContainer/Settings.set_visible(false)
		$Start_buttons/PanelContainer/HBoxContainer/Back.set_visible(true)
		$Start_buttons/PanelContainer/HBoxContainer/Quit.set_visible(false)
		$Settings_control.set_visible(true)

func _on_quit_pressed():
	get_tree().quit()
	


func _on_start_game_pressed():
	get_tree().change_scene_to_file("res://scen//choose_difficult.tscn")


func _on_settings_pressed():
	$Start_buttons/PanelContainer/HBoxContainer/Control.set_visible(false)
	$Start_buttons/PanelContainer/HBoxContainer/Start_game.set_visible(false)
	$Start_buttons/PanelContainer/HBoxContainer/Load_game.set_visible(false)
	$Start_buttons/PanelContainer/HBoxContainer/Settings.set_visible(false)
	$Start_buttons/PanelContainer/HBoxContainer/Back.set_visible(true)
	$Start_buttons/PanelContainer/HBoxContainer/Quit.set_visible(false)
	$Settings_control.set_visible(true)

func _on_back_pressed():
	if Globaldata.settings_scene:
		get_node(".").queue_free()
		$music_controller.stop_play_music()
		#MusicController.place_play_music(100)
		$music_controller.stop_play_place_music(true)
	else:
		$Start_buttons/PanelContainer/HBoxContainer/Control.set_visible(true)
		$Start_buttons/PanelContainer/HBoxContainer/Start_game.set_visible(true)
		$Start_buttons/PanelContainer/HBoxContainer/Load_game.set_visible(true)
		$Start_buttons/PanelContainer/HBoxContainer/Settings.set_visible(true)
		$Start_buttons/PanelContainer/HBoxContainer/Back.set_visible(false)
		$Start_buttons/PanelContainer/HBoxContainer/Quit.set_visible(true)
		$Settings_control.set_visible(false)




func _on_h_slider_value_changed(value):
	var linear_volume_ratio_master = linear_to_db(value)
	AudioServer.set_bus_volume_db(0,linear_volume_ratio_master)
	Globaldata.volume_ratio_master = linear_volume_ratio_master
	


func _on_music_value_changed(value):
	var linear_volume_ratio_music = linear_to_db(value)
	AudioServer.set_bus_volume_db(1,linear_volume_ratio_music)
	Globaldata.volume_ratio_music = linear_volume_ratio_music


func _on_sfx_value_changed(value):
	var linear_volume_ratio_sfx = linear_to_db(value)
	AudioServer.set_bus_volume_db(2,linear_to_db(value))
	Globaldata.volume_ratio_sfx = linear_volume_ratio_sfx


func _on_game_button_pressed() -> void:
	get_tree().change_scene_to_file("res://scen/balance_scen.tscn")
	pass # Replace with function body.
