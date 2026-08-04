extends Node2D

func _ready():
	#MusicController._on_door_finished()
	MusicController.place_music = "res://GameData/snd/Game/Places/Home/Песенка страхов мультик ничуть нестрашно.mp3"
	


func _on_exit_pressed():
	get_tree().change_scene_to_file(Globaldata.home_scene)
	MusicController.open_door_music()
	MusicController.play_steps("res://GameData/snd/Game/Шаги.mp3")
	#MusicController.stop_play_place_music(true)
	

func _on_check_status_pressed():
	get_tree().change_scene_to_file("res://scen/slave_check.tscn")
	MusicController.play_steps("res://GameData/snd/Game/Places/Home/Шаги дома.mp3")
	
	

func _on_settings_pressed():
	MusicController.stop_play_place_music(true)
	Globaldata.settings_scene = true
	get_tree().root.add_child(preload("res://scen/main_menu.tscn").instantiate())


func _on_check_clothes_pressed():
	get_tree().change_scene_to_file("res://scen/check_clothes.tscn")
	MusicController.play_steps("res://GameData/snd/Game/Home/Шаги дома.mp3")


func _on_sleep_pressed():
	$Sleep_picture.set_visible(true)
	for persona in Globaldata.all_slaves:
		for dialog in Globaldata.all_slaves:
			if persona == dialog:
				continue
			if persona.can_talk:
				
				if not persona.relationships.has(dialog):
					persona.relationships[dialog] = 0.0
					
				if persona.religiosity.belief_power == dialog.religiosity.belief_power:
					persona.relationships[dialog] += 1
				elif persona.religiosity.belief_power == 0 or dialog.religiosity.belief_power == 0:
					persona.relationships[dialog] += 0
				else:
					persona.relationships[dialog] -= 1
				
				if (persona.worldview.view_power > 0 and dialog.worldview.view_power > 0) or (persona.worldview.view_power < 0 and dialog.worldview.view_power < 0):
					persona.relationships[dialog] += abs(persona.worldview.view_power + dialog.worldview.view_power)
				else:
					persona.relationships[dialog] += (abs(persona.worldview.view_power) + abs(dialog.worldview.view_power)) * -1
			else:
				if not persona.relationships.has(dialog):
					persona.relationships[dialog] = 0.0
					
				if persona.religiosity.belief_power == dialog.religiosity.belief_power:
					persona.relationships[dialog] += 0.5
				elif persona.religiosity.belief_power == 0 or dialog.religiosity.belief_power == 0:
					persona.relationships[dialog] += 0
				else:
					persona.relationships[dialog] -= 0.5
				
				
				if (persona.worldview.view_power > 0 and dialog.worldview.view_power > 0) or (persona.worldview.view_power < 0 and dialog.worldview.view_power < 0):
					persona.relationships[dialog] += abs(persona.worldview.view_power + dialog.worldview.view_power)/2
				else:
					persona.relationships[dialog] += (abs(persona.worldview.view_power) + abs(dialog.worldview.view_power))/2 * -1
			if persona.relationships[dialog] > 100:
				persona.relationships[dialog] = 100
			elif persona.relationships[dialog] < -100:
				persona.relationships[dialog] = -100
		#print(persona.relationships)
	Globaldata.slaves_saled = 0


func _on_next_pressed():
	$Sleep_picture.set_visible(false)

func _on_basement_pressed():
	get_tree().change_scene_to_file("res://scen/basement.tscn")
