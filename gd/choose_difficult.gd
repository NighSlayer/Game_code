extends Node2D

var emblem_numb = 1
var character_picture = 1
var gender = "man"
var points = 106
var action = ""

func _ready():
	
	$Ambient.play()
	$Points.set_text("Количество нераспределённых очков:" + str(points))
	Globaldata.hero.check_main_hero_endurance($Parametrs/HBoxContainer/Main_parametrs/Endurance/Label)
	Globaldata.hero.check_main_hero_charisma($Parametrs/HBoxContainer/Main_parametrs/Charisma/Label)
	Globaldata.hero.check_main_hero_beauty($Parametrs/HBoxContainer/Main_parametrs/Beauty/Label)
	Globaldata.hero.check_main_hero_libido($Parametrs/HBoxContainer/Main_parametrs/Libido/Label)
	Globaldata.hero.check_main_hero_mentor($Parametrs/HBoxContainer/Main_parametrs/Mentor/Label)
	Globaldata.hero.check_main_hero_steward($Parametrs/HBoxContainer/Main_parametrs/Steward/Label)
	Globaldata.hero.check_main_hero_art_director($Parametrs/HBoxContainer/Main_parametrs/Art_director/Label)
	Globaldata.hero.check_main_hero_medic($Parametrs/HBoxContainer/Main_parametrs/Medic/Label)
	Globaldata.hero.check_main_hero_combat_traning($Parametrs/HBoxContainer/Main_parametrs/Combat_training/Label)
	Globaldata.hero.check_main_hero_magician($Parametrs/HBoxContainer/Main_parametrs/Magician/Label)
	Globaldata.hero.check_main_hero_dominance($Parametrs/HBoxContainer/Skills_parametrs/Dominance/Label)
	$Parametrs/HBoxContainer/Skills_parametrs/Petting/TextureRect.set_texture(Globaldata.hero.main_hero_skills(Globaldata.hero.sexual.petting))
	$Parametrs/HBoxContainer/Skills_parametrs/Oral_sex/TextureRect.set_texture(Globaldata.hero.main_hero_skills(Globaldata.hero.sexual.oral_sex))
	$Parametrs/HBoxContainer/Skills_parametrs/Penetration/TextureRect.set_texture(Globaldata.hero.main_hero_skills(Globaldata.hero.sexual.penetration))
	$Parametrs/HBoxContainer/Skills_parametrs/Fetishism/TextureRect.set_texture(Globaldata.hero.main_hero_skills(Globaldata.hero.sexual.fetishism))
	Globaldata.hero.check_main_hero_tortue($Parametrs/HBoxContainer/Skills_parametrs/Tortue/Label)
	Globaldata.hero.check_main_hero_spanking($Parametrs/HBoxContainer/Skills_parametrs/Spanking/Label)
	Globaldata.hero.check_main_hero_binding($Parametrs/HBoxContainer/Skills_parametrs/Binding/Label)

func update_points():
	$Points.set_text("Количество нераспределённых очков:" + str(points))

func _on_back_pressed():
	$Sound_buttons.play()
	action = "back"
	

func _on_start_pressed():
	if !$Sound_buttons.is_playing():
		$Sound_buttons.play()
	action = "start"
	Globaldata.god = class_slave.new()
	

func _on_sound_buttons_finished():
	if action == "start":
		if has_node("/root/Debug_menu"):
			if get_node("/root/Debug_menu").skip:
				get_tree().change_scene_to_file("res://scen/home.tscn")
			else:
				get_tree().change_scene_to_file("res://scen/god's_place.tscn")
		else:
			get_tree().change_scene_to_file("res://scen/god's_place.tscn")
	elif action == "back":
		get_tree().change_scene_to_file("res://scen//main_menu.tscn")


func _on_name_text_changed(new_text):
	$Hand_design/Emblem/VBoxContainer/Label.set_text(new_text)
	Globaldata.hero.name_hero = new_text


func _on_name_text_submitted():
	$Parametrs/HBoxContainer/Main_parametrs/Name.release_focus()



func _on_hard_toggled(_toggle_on):
	Globaldata.difficult_ratio = 0.5


func _on_normal_toggled(_toggle_on):
	Globaldata.difficult_ratio = 1


func _on_easy_toggled(_toggle_on):
	Globaldata.difficult_ratio = 1.5


func _on_man_toggled(_toggle_on):
	character_picture = 1
	gender = "man"
	$Character_design/VBoxContainer/Character_picture.set_texture(load("res://GameData/img/Game/Character/Characters_variants/Man/" + str(character_picture) + ".jpg"))


func _on_woman_toggled(_toggle_on):
	character_picture = 1
	gender = "woman"
	$Character_design/VBoxContainer/Character_picture.set_texture(load("res://GameData/img/Game/Character/Characters_variants/Woman/" + str(character_picture) + ".jpg"))


func _on_left_pressed():
	if gender == "woman":
		if character_picture == 1:
			character_picture = 26
		else:
			character_picture -= 1
		$Character_design/VBoxContainer/Character_picture.set_texture(load("res://GameData/img/Game/Character/Characters_variants/Woman/" + str(character_picture) + ".jpg"))
	if gender == "man":
		if character_picture == 1:
			character_picture = 17
		else:
			character_picture -= 1
		$Character_design/VBoxContainer/Character_picture.set_texture(load("res://GameData/img/Game/Character/Characters_variants/Man/" + str(character_picture) + ".jpg"))

func _on_right_pressed():
	if gender == "woman":
		if character_picture == 26:
			character_picture = 1
		else:
			character_picture += 1
		$Character_design/VBoxContainer/Character_picture.set_texture(load("res://GameData/img/Game/Character/Characters_variants/Woman/" + str(character_picture) + ".jpg"))
	if gender == "man":
		if character_picture == 17:
			character_picture = 1
		else:
			character_picture += 1
		$Character_design/VBoxContainer/Character_picture.set_texture(load("res://GameData/img/Game/Character/Characters_variants/Man/" + str(character_picture) + ".jpg"))


func _on_increase_endurance_pressed():
	if Globaldata.hero.main_stats.endurance == 6:
		Globaldata.hero.main_stats.endurance = 6
	else:
		if points > 0:
			points -= 1
			update_points()
			Globaldata.hero.main_stats.endurance += 1
			Globaldata.hero.check_main_hero_endurance($Parametrs/HBoxContainer/Main_parametrs/Endurance/Label)


func _on_decrease_endurance_pressed():
	if Globaldata.hero.main_stats.endurance == 1:
		Globaldata.hero.main_stats.endurance = 1
	else:
		points += 1
		update_points()
		Globaldata.hero.main_stats.endurance -= 1
		Globaldata.hero.check_main_hero_endurance($Parametrs/HBoxContainer/Main_parametrs/Endurance/Label)


func _on_increase_charisma_pressed():
	if Globaldata.hero.main_stats.charismatic == 6:
		Globaldata.hero.main_stats.charismatic = 6
	else:
		if points > 0:
			points -= 1
			update_points()
			Globaldata.hero.main_stats.charismatic += 1
			Globaldata.hero.check_main_hero_charisma($Parametrs/HBoxContainer/Main_parametrs/Charisma/Label)


func _on_decrease_charisma_pressed():
	if Globaldata.hero.main_stats.charismatic == 1:
		Globaldata.hero.main_stats.charismatic = 1
	else:
		points += 1
		update_points()
		Globaldata.hero.main_stats.charismatic -= 1
		Globaldata.hero.check_main_hero_charisma($Parametrs/HBoxContainer/Main_parametrs/Charisma/Label)


func _on_increase_beauty_pressed():
	if Globaldata.hero.main_stats.beauty == 6:
		Globaldata.hero.main_stats.beauty = 6
	else:
		if points > 0:
			points -= 1
			update_points()
			Globaldata.hero.main_stats.beauty += 1
			Globaldata.hero.check_main_hero_beauty($Parametrs/HBoxContainer/Main_parametrs/Beauty/Label)


func _on_decrease_beauty_pressed():
	if Globaldata.hero.main_stats.beauty == 1:
		Globaldata.hero.main_stats.beauty = 1
	else:
		points += 1
		update_points()
		Globaldata.hero.main_stats.beauty -= 1
		Globaldata.hero.check_main_hero_beauty($Parametrs/HBoxContainer/Main_parametrs/Beauty/Label)


func _on_increase_libido_pressed():
	if Globaldata.hero.main_stats.libido == 6:
		Globaldata.hero.main_stats.libido = 6
	else:
		if points > 0:
			points -= 1
			update_points()
			Globaldata.hero.main_stats.libido += 1
			Globaldata.hero.check_main_hero_libido($Parametrs/HBoxContainer/Main_parametrs/Libido/Label)


func _on_decrease_libido_pressed():
	if Globaldata.hero.main_stats.libido == 1:
		Globaldata.hero.main_stats.libido = 1
	else:
		points += 1
		update_points()
		Globaldata.hero.main_stats.libido -= 1
		Globaldata.hero.check_main_hero_libido($Parametrs/HBoxContainer/Main_parametrs/Libido/Label)


func _on_increase_mentor_pressed():
	if Globaldata.hero.common.mentor == 6:
		Globaldata.hero.common.mentor = 6
	else:
		if points > 0:
			points -= 1
			update_points()
			Globaldata.hero.common.mentor += 1
			Globaldata.hero.check_main_hero_mentor($Parametrs/HBoxContainer/Main_parametrs/Mentor/Label)


func _on_decrease_mentor_pressed():
	if Globaldata.hero.common.mentor == 1:
		Globaldata.hero.common.mentor = 1
	else:
		points += 1
		update_points()
		Globaldata.hero.common.mentor -= 1
		Globaldata.hero.check_main_hero_mentor($Parametrs/HBoxContainer/Main_parametrs/Mentor/Label)


func _on_increase_steward_pressed():
	if Globaldata.hero.common.steward == 6:
		Globaldata.hero.common.steward = 6
	else:
		if points > 0:
			points -= 1
			update_points()
			Globaldata.hero.common.steward += 1
			Globaldata.hero.check_main_hero_steward($Parametrs/HBoxContainer/Main_parametrs/Steward/Label)


func _on_decrease_steward_pressed():
	if Globaldata.hero.common.steward == 1:
		Globaldata.hero.common.steward = 1
	else:
		points += 1
		update_points()
		Globaldata.hero.common.steward -= 1
		Globaldata.hero.check_main_hero_steward($Parametrs/HBoxContainer/Main_parametrs/Steward/Label)


func _on_increase_art_director_pressed():
	if Globaldata.hero.common.art_director == 6:
		Globaldata.hero.common.art_director = 6
	else:
		if points > 0:
			points -= 1
			update_points()
			Globaldata.hero.common.art_director += 1
			Globaldata.hero.check_main_hero_art_director($Parametrs/HBoxContainer/Main_parametrs/Art_director/Label)


func _on_decrease_art_director_pressed():
	if Globaldata.hero.common.art_director == 1:
		Globaldata.hero.common.art_director = 1
	else:
		points += 1
		update_points()
		Globaldata.hero.common.art_director -= 1
		Globaldata.hero.check_main_hero_art_director($Parametrs/HBoxContainer/Main_parametrs/Art_director/Label)


func _on_increase_medic_pressed():
	if Globaldata.hero.common.medic == 6:
		Globaldata.hero.common.medic = 6
	else:
		if points > 0:
			points -= 1
			update_points()
			Globaldata.hero.common.medic += 1
			Globaldata.hero.check_main_hero_medic($Parametrs/HBoxContainer/Main_parametrs/Medic/Label)


func _on_decrease_medic_pressed():
	if Globaldata.hero.common.medic == 1:
		Globaldata.hero.common.medic = 1
	else:
		points += 1
		update_points()
		Globaldata.hero.common.medic -= 1
		Globaldata.hero.check_main_hero_medic($Parametrs/HBoxContainer/Main_parametrs/Medic/Label)


func _on_increase_combat_training_pressed():
	if Globaldata.hero.common.combat_traning == 6:
		Globaldata.hero.common.combat_traning = 6
	else:
		if points > 0:
			points -= 1
			update_points()
			Globaldata.hero.common.combat_traning += 1
			Globaldata.hero.check_main_hero_combat_traning($Parametrs/HBoxContainer/Main_parametrs/Combat_training/Label)


func _on_decrease_combat_training_pressed():
	if Globaldata.hero.common.combat_traning == 1:
		Globaldata.hero.common.combat_traning = 1
	else:
		points += 1
		update_points()
		Globaldata.hero.common.combat_traning -= 1
		Globaldata.hero.check_main_hero_combat_traning($Parametrs/HBoxContainer/Main_parametrs/Combat_training/Label)


func _on_increase_magician_pressed():
	if Globaldata.hero.common.magician == 6:
		Globaldata.hero.common.magician = 6
	else:
		if points > 0:
			points -= 1
			update_points()
			Globaldata.hero.common.magician += 1
			Globaldata.hero.check_main_hero_magician($Parametrs/HBoxContainer/Main_parametrs/Magician/Label)


func _on_decrease_magician_pressed():
	if Globaldata.hero.common.magician == 1:
		Globaldata.hero.common.magician = 1
	else:
		points += 1
		update_points()
		Globaldata.hero.common.magician -= 1
		Globaldata.hero.check_main_hero_magician($Parametrs/HBoxContainer/Main_parametrs/Magician/Label)


func _on_increase_dominance_pressed():
	if Globaldata.hero.main_stats.dominance == 6:
		Globaldata.hero.main_stats.dominance = 6
	else:
		if points > 0:
			points -= 1
			update_points()
			Globaldata.hero.main_stats.dominance += 1
			Globaldata.hero.check_main_hero_dominance($Parametrs/HBoxContainer/Skills_parametrs/Dominance/Label)


func _on_decrease_dominance_pressed():
	if Globaldata.hero.main_stats.dominance == 1:
		Globaldata.hero.main_stats.dominance = 1
	else:
		points += 1
		update_points()
		Globaldata.hero.main_stats.dominance -= 1
		Globaldata.hero.check_main_hero_dominance($Parametrs/HBoxContainer/Skills_parametrs/Dominance/Label)


func _on_increase_petting_pressed():
	if Globaldata.hero.sexual.petting == 10:
		Globaldata.hero.sexual.petting = 10
	else:
		if points > 0:
			points -= 1
			update_points()
			Globaldata.hero.sexual.petting += 1
			$Parametrs/HBoxContainer/Skills_parametrs/Petting/TextureRect.set_texture(Globaldata.hero.main_hero_skills(Globaldata.hero.sexual.petting))


func _on_decrease_petting_pressed():
	if Globaldata.hero.sexual.petting == 1:
		Globaldata.hero.sexual.petting = 1
	else:
		points += 1
		update_points()
		Globaldata.hero.sexual.petting -= 1
		$Parametrs/HBoxContainer/Skills_parametrs/Petting/TextureRect.set_texture(Globaldata.hero.main_hero_skills(Globaldata.hero.sexual.petting))


func _on_increase_oral_sex_pressed():
	if Globaldata.hero.sexual.oral_sex == 10:
		Globaldata.hero.sexual.oral_sex = 10
	else:
		if points > 0:
			points -= 1
			update_points()
			Globaldata.hero.sexual.oral_sex += 1
			$Parametrs/HBoxContainer/Skills_parametrs/Oral_sex/TextureRect.set_texture(Globaldata.hero.main_hero_skills(Globaldata.hero.sexual.oral_sex))


func _on_decrease_oral_sex_pressed():
	if Globaldata.hero.sexual.oral_sex == 1:
		Globaldata.hero.sexual.oral_sex = 1
	else:
		points += 1
		update_points()
		Globaldata.hero.sexual.oral_sex -= 1
		$Parametrs/HBoxContainer/Skills_parametrs/Oral_sex/TextureRect.set_texture(Globaldata.hero.main_hero_skills(Globaldata.hero.sexual.oral_sex))


func _on_increase_penetration_pressed():
	if Globaldata.hero.sexual.penetration == 10:
		Globaldata.hero.sexual.penetration = 10
	else:
		if points > 0:
			points -= 1
			update_points()
			Globaldata.hero.sexual.penetration += 1
			$Parametrs/HBoxContainer/Skills_parametrs/Penetration/TextureRect.set_texture(Globaldata.hero.main_hero_skills(Globaldata.hero.sexual.penetration))


func _on_decrease_penetration_pressed():
	if Globaldata.hero.sexual.penetration == 1:
		Globaldata.hero.sexual.penetration = 1
	else:
		points += 1
		update_points()
		Globaldata.hero.sexual.penetration -= 1
		$Parametrs/HBoxContainer/Skills_parametrs/Penetration/TextureRect.set_texture(Globaldata.hero.main_hero_skills(Globaldata.hero.sexual.penetration))


func _on_increase_fetishism_pressed():
	if Globaldata.hero.sexual.fetishism == 10:
		Globaldata.hero.sexual.fetishism = 10
	else:
		if points > 0:
			points -= 1
			update_points()
			Globaldata.hero.sexual.fetishism += 1
			$Parametrs/HBoxContainer/Skills_parametrs/Fetishism/TextureRect.set_texture(Globaldata.hero.main_hero_skills(Globaldata.hero.sexual.fetishism))


func _on_decrease_fetishism_pressed():
	if Globaldata.hero.sexual.fetishism == 1:
		Globaldata.hero.sexual.fetishism = 1
	else:
		points += 1
		update_points()
		Globaldata.hero.sexual.fetishism -= 1
		$Parametrs/HBoxContainer/Skills_parametrs/Fetishism/TextureRect.set_texture(Globaldata.hero.main_hero_skills(Globaldata.hero.sexual.fetishism))


func _on_increase_tortue_pressed():
	if Globaldata.hero.common.tortue == 6:
		Globaldata.hero.common.tortue = 6
	else:
		if points > 0:
			points -= 1
			update_points()
			Globaldata.hero.common.tortue += 1
			Globaldata.hero.check_main_hero_tortue($Parametrs/HBoxContainer/Skills_parametrs/Tortue/Label)


func _on_decrease_tortue_pressed():
	if Globaldata.hero.common.tortue == 1:
		Globaldata.hero.common.tortue = 1
	else:
		points += 1
		update_points()
		Globaldata.hero.common.tortue -= 1
		Globaldata.hero.check_main_hero_tortue($Parametrs/HBoxContainer/Skills_parametrs/Tortue/Label)


func _on_increase_spanking_pressed():
	if Globaldata.hero.common.spanking == 6:
		Globaldata.hero.common.spanking = 6
	else:
		if points > 0:
			points -= 1
			update_points()
			Globaldata.hero.common.spanking += 1
			Globaldata.hero.check_main_hero_spanking($Parametrs/HBoxContainer/Skills_parametrs/Spanking/Label)


func _on_decrease_spanking_pressed():
	if Globaldata.hero.common.spanking == 1:
		Globaldata.hero.common.spanking = 1
	else:
		points += 1
		update_points()
		Globaldata.hero.common.spanking -= 1
		Globaldata.hero.check_main_hero_spanking($Parametrs/HBoxContainer/Skills_parametrs/Spanking/Label)


func _on_increase_binding_pressed():
	if Globaldata.hero.common.binding == 6:
		Globaldata.hero.common.binding = 6
	else:
		if points > 0:
			points -= 1
			update_points()
			Globaldata.hero.common.binding += 1
			Globaldata.hero.check_main_hero_binding($Parametrs/HBoxContainer/Skills_parametrs/Binding/Label)


func _on_decrease_binding_pressed():
	if Globaldata.hero.common.binding == 1:
		Globaldata.hero.common.binding = 1
	else:
		points += 1
		update_points()
		Globaldata.hero.common.binding -= 1
		Globaldata.hero.check_main_hero_binding($Parametrs/HBoxContainer/Skills_parametrs/Binding/Label)


func _on_previous_pressed():
	if Globaldata.hero.emblem_main_hero == 1:
		Globaldata.hero.emblem_main_hero = 2
	else:
		Globaldata.hero.emblem_main_hero -= 1
	$Hand_design/Emblem/VBoxContainer/TextureRect.set_texture(load("res://GameData/img/Game/Character/Hand_emblems/" + str(Globaldata.hero.emblem_main_hero) + ".png"))


func _on_next_pressed():
	if Globaldata.hero.emblem_main_hero == 2:
		Globaldata.hero.emblem_main_hero = 1
	else:
		Globaldata.hero.emblem_main_hero += 1
	$Hand_design/Emblem/VBoxContainer/TextureRect.set_texture(load("res://GameData/img/Game/Character/Hand_emblems/" + str(Globaldata.hero.emblem_main_hero) + ".png"))
