extends CanvasLayer
 

func _ready():
	update_main_hero_money()


func main_hero_visible():
	visible = not visible

func update_main_hero_money():
	$Info_panel/HBoxContainer/GridContainer/Money.set_text(str(Globaldata.money))

func time_change_visible():
	$Info_time_and_place.visible = not $Info_time_and_place.visible


func update_main_hero_energy():
	match Globaldata.energy_hero_use:
		1:
			$Info_panel/HBoxContainer/GridContainer/Energy.set_texture(load("res://GameData/img/Game/Interface/Energy/4 Энергии.png"))
		2:
			$Info_panel/HBoxContainer/GridContainer/Energy.set_texture(load("res://GameData/img/Game/Interface/Energy/3 Энергии.png"))
		3:
			$Info_panel/HBoxContainer/GridContainer/Energy.set_texture(load("res://GameData/img/Game/Interface/Energy/2 Энергии.png"))
		4:
			$Info_panel/HBoxContainer/GridContainer/Energy.set_texture(load("res://GameData/img/Game/Interface/Energy/1 Энергия.png"))

func update_time(time_shift):
	var solve_time = (time_shift - 1) * 45
	var solve_hour = solve_time / 60
	var solve_minutes = solve_time - solve_hour * 60
	$Info_time_and_place/VBoxContainer/Time.set_text("%02d:%02d" % [solve_hour, solve_minutes])
	#match time_shift:
		#1:
			#$Info_time_and_place/VBoxContainer/Time.set_text("00:00 до 3:00")
		#2:
			#$Info_time_and_place/VBoxContainer/Time.set_text("3:00 до 6:00")
		#3:
			#$Info_time_and_place/VBoxContainer/Time.set_text("6:00 до 9:00")
		#4:
			#$Info_time_and_place/VBoxContainer/Time.set_text("9:00 до 12:00")
		#5:
			#$Info_time_and_place/VBoxContainer/Time.set_text("12:00 до 15:00")
		#6:
			#$Info_time_and_place/VBoxContainer/Time.set_text("15:00 до 18:00")
		#7:
			#$Info_time_and_place/VBoxContainer/Time.set_text("18:00 до 21:00")
		#8:
			#$Info_time_and_place/VBoxContainer/Time.set_text("21:00 до 24:00")

func info_place_set_text(info_name_place_text):
	$Info_time_and_place/VBoxContainer/Place.set_text(info_name_place_text)


func _on_main_hero_pressed():
	main_hero_visible()
	$music_controller.pause_all_music(true)
	get_tree().root.add_child(preload("res://scen/stats_main_hero.tscn").instantiate())
