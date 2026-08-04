extends Node2D

func text_reputation_set(reputation,obj):
	if reputation >= 0 and reputation < 10:
		obj.set_text("Ненависть")
	if reputation >= 10 and reputation < 20:
		obj.set_text("Враждебность")
	if reputation >= 20 and reputation < 30:
		obj.set_text("Подозрительность")
	if reputation >= 30 and reputation < 40:
		obj.set_text("Осторожность")
	if reputation >= 40 and reputation < 50:
		obj.set_text("Формальное")
	if reputation >= 50 and reputation < 60:
		obj.set_text("Умеренное")
	if reputation >= 60 and reputation < 70:
		obj.set_text("Дружественное")
	if reputation >= 70 and reputation < 80:
		obj.set_text("Высокое")
	if reputation >= 80 and reputation < 90:
		obj.set_text("Союзническое")
	if reputation >= 90:
		obj.set_text("Безуслованое")

func text_captured_scorched_earth(capture,obj):
	if capture >= 0 and capture < 10:
		obj.set_text("Документы")
	if capture >= 10 and capture < 20:
		obj.set_text("Разведка")
	if capture >= 20 and capture < 30:
		obj.set_text("Первое укрытие")
	if capture >= 30 and capture < 40:
		obj.set_text("Основное жилище")
	if capture >= 40 and capture < 50:
		obj.set_text("Защита территории")
	if capture >= 50 and capture < 60:
		obj.set_text("Инфраструктура")
	if capture >= 60 and capture < 70:
		obj.set_text("Сбор людей")
	if capture >= 70 and capture < 80:
		obj.set_text("Удобства для жизни")
	if capture >= 80 and capture < 90:
		obj.set_text("Финальный этап")
	if capture >= 90:
		obj.set_text("Закончен")

func _ready():
	
	# Настройка сцены
	$Stats.set_visible(true)
	$Reputation.set_visible(false)
	
	
	$Control/Name_main_hero.set_text($Global_scene.hero.name_hero)
	$Control/Emblem.set_texture(load("res://GameData/img/Game/Character/Hand_emblems/" + str($Global_scene.hero.emblem_main_hero) + ".png"))
	$VBoxContainer/Show_stats.set_visible(false)
	
	# Основные статы
	$Global_scene.hero.check_main_hero_health($/root/Stats_main_hero/Stats/GridContainer/Main_stats_text/Health_text)
	$Global_scene.hero.check_main_hero_endurance($/root/Stats_main_hero/Stats/GridContainer/Main_stats_text/Endurance_text)
	$Global_scene.hero.check_main_hero_charisma($/root/Stats_main_hero/Stats/GridContainer/Main_stats_text/Charisma_text)
	$Global_scene.hero.check_main_hero_beauty($/root/Stats_main_hero/Stats/GridContainer/Main_stats_text/Beauty_text)
	$Global_scene.hero.check_main_hero_libido($/root/Stats_main_hero/Stats/GridContainer/Main_stats_text/Libido_text)
	$Global_scene.hero.check_main_hero_mark($/root/Stats_main_hero/Stats/GridContainer/Main_stats_text/Mark_text)
	$Global_scene.hero.check_main_hero_reputation($/root/Stats_main_hero/Stats/GridContainer/Main_stats_text/Reputation_text)
	$Global_scene.hero.check_main_hero_quality_of_life($/root/Stats_main_hero/Stats/GridContainer/Main_stats_text/Quality_of_life_text)
	$Global_scene.hero.check_main_hero_hygiene($/root/Stats_main_hero/Stats/GridContainer/Main_stats_text/Hygiene_text)
	$Global_scene.hero.check_main_hero_mood($/root/Stats_main_hero/Stats/GridContainer/Main_stats_text/Mood_text)
	# Навыки
	# Обычные
	$Global_scene.hero.check_main_hero_mentor($/root/Stats_main_hero/Stats/GridContainer/Skills_text/Mentor_text)
	$Global_scene.hero.check_main_hero_steward($/root/Stats_main_hero/Stats/GridContainer/Skills_text/Steward_text)
	$Global_scene.hero.check_main_hero_art_director($/root/Stats_main_hero/Stats/GridContainer/Skills_text/Art_director_text)
	$Global_scene.hero.check_main_hero_medic($/root/Stats_main_hero/Stats/GridContainer/Skills_text/Medic_text)
	$Global_scene.hero.check_main_hero_combat_traning($/root/Stats_main_hero/Stats/GridContainer/Skills_text/Fighter_text)
	$Global_scene.hero.check_main_hero_magician($/root/Stats_main_hero/Stats/GridContainer/Skills_text/Magician_text)
	$Global_scene.hero.check_main_hero_dominance($/root/Stats_main_hero/Stats/GridContainer/Skills_text/Dominance_text)
	$Global_scene.hero.check_main_hero_spanking($/root/Stats_main_hero/Stats/GridContainer/Skills_text/Spanking_text)
	$Global_scene.hero.check_main_hero_tortue($/root/Stats_main_hero/Stats/GridContainer/Skills_text/Tortue_text)
	$Global_scene.hero.check_main_hero_binding($/root/Stats_main_hero/Stats/GridContainer/Skills_text/Binding_text)
	# Секс
	$Stats/GridContainer/Skills_text/Petting_picture.set_texture($Global_scene.hero.main_hero_skills($Global_scene.hero.sexual.petting))
	$Stats/GridContainer/Skills_text/Oral_sex_picture.set_texture($Global_scene.hero.main_hero_skills($Global_scene.hero.sexual.oral_sex))
	$Stats/GridContainer/Skills_text/Penetration_picture.set_texture($Global_scene.hero.main_hero_skills($Global_scene.hero.sexual.penetration))
	$Stats/GridContainer/Skills_text/Fetishism_picture.set_texture($Global_scene.hero.main_hero_skills($Global_scene.hero.sexual.fetishism))



func _on_back_pressed():
	$music_controller.click_button()
	get_node(".").queue_free()
	$music_controller.stop_play_place_music(true)
	$main_hero_character.main_hero_visible(true)


func _on_show_stats_pressed():
	$music_controller.click_button()
	$Stats.set_visible(true)
	$Reputation.set_visible(false)
	$VBoxContainer/Show_stats.set_visible(false)
	$VBoxContainer/Show_reputation.set_visible(true)


func _on_show_reputation_pressed():
	$music_controller.click_button()
	$Stats.set_visible(false)
	$Reputation.set_visible(true)
	$VBoxContainer/Show_reputation.set_visible(false)
	$VBoxContainer/Show_stats.set_visible(true)
	# Репутация у фракций
	$Reputation/GridContainer/Reputations_group/Reputations_group_progress_bar/Rich_progress_bar.value = $Global_scene.reputations_fractions[0]
	text_reputation_set($Global_scene.reputations_fractions[0],$Reputation/GridContainer/Reputations_group/Reputations_group_progress_bar/Rich_progress_bar/Label)
	$Reputation/GridContainer/Reputations_group/Reputations_group_progress_bar/Guards_progress_bar.value = $Global_scene.reputations_fractions[1]
	text_reputation_set($Global_scene.reputations_fractions[1],$Reputation/GridContainer/Reputations_group/Reputations_group_progress_bar/Guards_progress_bar/Label)
	$Reputation/GridContainer/Reputations_group/Reputations_group_progress_bar/Merchants_progress_bar.value = $Global_scene.reputations_fractions[2]
	text_reputation_set($Global_scene.reputations_fractions[2],$Reputation/GridContainer/Reputations_group/Reputations_group_progress_bar/Merchants_progress_bar/Label)
	$Reputation/GridContainer/Reputations_group/Reputations_group_progress_bar/Beggars_progress_bar.value = $Global_scene.reputations_fractions[3]
	text_reputation_set($Global_scene.reputations_fractions[3],$Reputation/GridContainer/Reputations_group/Reputations_group_progress_bar/Beggars_progress_bar/Label)
	$Reputation/GridContainer/Reputations_group/Reputations_group_progress_bar/Bandits_progress_bar.value = $Global_scene.reputations_fractions[4]
	text_reputation_set($Global_scene.reputations_fractions[4],$Reputation/GridContainer/Reputations_group/Reputations_group_progress_bar/Bandits_progress_bar/Label)
	
	
	# Битва за районы
	if $Global_scene.reputations_fractions[0] < $Global_scene.reputations_fractions[1]:
		$Reputation/GridContainer/Group_influence/District_progress_bar/Elite_district.value = (float($Global_scene.reputations_fractions[0])/float($Global_scene.reputations_fractions[1])) * 100
	else:
		$Reputation/GridContainer/Group_influence/District_progress_bar/Elite_district.value = (float($Global_scene.reputations_fractions[1])/float($Global_scene.reputations_fractions[0])) * 100
	if $Global_scene.reputations_fractions[0] < $Global_scene.reputations_fractions[2]:
		$Reputation/GridContainer/Group_influence/District_progress_bar/Rich_district.value = (float($Global_scene.reputations_fractions[0])/float($Global_scene.reputations_fractions[2])) * 100
	else:
		$Reputation/GridContainer/Group_influence/District_progress_bar/Rich_district.value = (float($Global_scene.reputations_fractions[2])/float($Global_scene.reputations_fractions[0])) * 100
	if $Global_scene.reputations_fractions[2] < $Global_scene.reputations_fractions[1]:
		$Reputation/GridContainer/Group_influence/District_progress_bar/Merchant_district.value = (float($Global_scene.reputations_fractions[2])/float($Global_scene.reputations_fractions[1])) * 100
	else:
		$Reputation/GridContainer/Group_influence/District_progress_bar/Merchant_district.value = (float($Global_scene.reputations_fractions[1])/float($Global_scene.reputations_fractions[2])) * 100
	if $Global_scene.reputations_fractions[2] < $Global_scene.reputations_fractions[3]:
		$Reputation/GridContainer/Group_influence/District_progress_bar/Buisness_district.value = (float($Global_scene.reputations_fractions[2])/float($Global_scene.reputations_fractions[3])) * 100
	else:
		$Reputation/GridContainer/Group_influence/District_progress_bar/Buisness_district.value = (float($Global_scene.reputations_fractions[3])/float($Global_scene.reputations_fractions[2])) * 100
	if $Global_scene.reputations_fractions[3] < $Global_scene.reputations_fractions[1]:
		$Reputation/GridContainer/Group_influence/District_progress_bar/Poor_district.value = (float($Global_scene.reputations_fractions[3])/float($Global_scene.reputations_fractions[1])) * 100
	else:
		$Reputation/GridContainer/Group_influence/District_progress_bar/Poor_district.value = (float($Global_scene.reputations_fractions[1])/float($Global_scene.reputations_fractions[3])) * 100
	if $Global_scene.reputations_fractions[3] < $Global_scene.reputations_fractions[4]:
		$Reputation/GridContainer/Group_influence/District_progress_bar/Slum_district.value = (float($Global_scene.reputations_fractions[3])/float($Global_scene.reputations_fractions[4])) * 100
	else:
		$Reputation/GridContainer/Group_influence/District_progress_bar/Slum_district.value = (float($Global_scene.reputations_fractions[4])/float($Global_scene.reputations_fractions[3])) * 100
	if $Global_scene.reputations_fractions[4] < $Global_scene.reputations_fractions[1]:
		$Reputation/GridContainer/Group_influence/District_progress_bar/Suburb_district.value = (float($Global_scene.reputations_fractions[4])/float($Global_scene.reputations_fractions[1])) * 100
	else:
		$Reputation/GridContainer/Group_influence/District_progress_bar/Suburb_district.value = (float($Global_scene.reputations_fractions[1])/float($Global_scene.reputations_fractions[4])) * 100
	if $Global_scene.reputations_fractions[5] > 0:
		text_captured_scorched_earth($Global_scene.reputations_fractions[5],$Reputation/GridContainer/Group_influence/District_progress_bar/Scorched_earth/Label)
		$Reputation/GridContainer/Group_influence/District_progress_bar/Scorched_earth.value = (float($Global_scene.reputations_fractions[5]))



	

	
	
	
