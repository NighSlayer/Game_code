extends Node2D

var call_number_slave



func _on_slave_free_pressed():
	$Get_out_slave.set_visible(true)
	$Main_menu_basement.set_visible(false)
	
	if Globaldata.basement_slaves.size() > 0:
		for i in range(0,5):
			if i < Globaldata.basement_slaves.size():
				get_node("Get_out_slave/PanelContainer/VBoxContainer/Slave_" + str(i+1)).set_visible(true)
				get_node("Get_out_slave/PanelContainer/VBoxContainer/Slave_" + str(i+1)).set_text(Globaldata.basement_slaves[i].slave_name)
			else:
				get_node("Get_out_slave/PanelContainer/VBoxContainer/Slave_" + str(i+1)).set_visible(false)
	else:
		$Get_out_slave/PanelContainer/VBoxContainer/Slave_1.set_visible(false)
		$Get_out_slave/PanelContainer/VBoxContainer/Slave_2.set_visible(false)
		$Get_out_slave/PanelContainer/VBoxContainer/Slave_3.set_visible(false)
		$Get_out_slave/PanelContainer/VBoxContainer/Slave_4.set_visible(false)
		$Get_out_slave/PanelContainer/VBoxContainer/Slave_5.set_visible(false)




func _on_back_get_out_slave_pressed():
	$Get_out_slave.set_visible(false)
	$Main_menu_basement.set_visible(true)


func _on_back_home_pressed():
	get_tree().change_scene_to_file("res://scen/home.tscn")


func _on_slave_1_pressed():
	$Status_slave.set_visible(true)
	$Slave.set_texture(load(Globaldata.basement_slaves[0].path_to_slave))
	call_number_slave = 0
	#Globaldata.all_slaves.append(Globaldata.basement_slaves[0])
	#Globaldata.basement_slaves.remove_at(0)
	#_on_slave_free_pressed()
	


func _on_slave_2_pressed():
	call_number_slave = 1
	$Status_slave.set_visible(true)
	$Slave.set_texture(load(Globaldata.basement_slaves[1].path_to_slave))


func _on_slave_3_pressed():
	call_number_slave = 2
	$Status_slave.set_visible(true)
	$Slave.set_texture(load(Globaldata.basement_slaves[2].path_to_slave))

func _on_slave_4_pressed():
	call_number_slave = 3
	$Status_slave.set_visible(true)
	$Slave.set_texture(load(Globaldata.basement_slaves[3].path_to_slave))


func _on_slave_5_pressed():
	call_number_slave = 4
	$Status_slave.set_visible(true)
	$Slave.set_texture(load(Globaldata.basement_slaves[4].path_to_slave))


func _on_button_apperance_pressed():
	$Status_appearance.set_visible(true)
	$Status_anatomy.set_visible(false)
	$Status_skill_common.set_visible(false)
	$Status_skill_sex.set_visible(false)
	$Status_clothes.set_visible(false)
	$Status_appearance/Back_status.set_visible(false)
	
	
	
	Globaldata.basement_slaves[call_number_slave].int_apperance_to_string($Status_appearance/Status/HBoxContainer/VBoxContainer2/Button,call_number_slave,"Красота")
	Globaldata.basement_slaves[call_number_slave].int_apperance_to_string($Status_appearance/Status/HBoxContainer/VBoxContainer2/Button2,call_number_slave,"Выносливость")
	Globaldata.basement_slaves[call_number_slave].int_apperance_to_string($Status_appearance/Status/HBoxContainer/VBoxContainer2/Button3,call_number_slave,"Чуствительность")
	Globaldata.basement_slaves[call_number_slave].int_apperance_to_string($Status_appearance/Status/HBoxContainer/VBoxContainer2/Button4,call_number_slave,"Сообразительность")
	Globaldata.basement_slaves[call_number_slave].int_apperance_to_string($Status_appearance/Status/HBoxContainer/VBoxContainer2/Button5,call_number_slave,"Телосложение")
	Globaldata.basement_slaves[call_number_slave].int_apperance_to_string($Status_appearance/Status/HBoxContainer/VBoxContainer2/Button6,call_number_slave,"Стиль")
	Globaldata.basement_slaves[call_number_slave].int_apperance_to_string($Status_appearance/Status/HBoxContainer/VBoxContainer2/Button7,call_number_slave,"Характер")
	
	
	
	$Status_appearance/Status.set_visible(true)
	$Status_appearance/Info_beauty.set_visible(false)
	$Status_appearance/Info_endurance.set_visible(false)
	$Status_appearance/Info_softness.set_visible(false)
	$Status_appearance/Info_mind.set_visible(false)
	$Status_appearance/Info_physique.set_visible(false)
	$Status_appearance/Info_style.set_visible(false)
	$Status_appearance/Info_personality.set_visible(false)


func _on_button_anatomy_pressed():
	Globaldata.basement_slaves[call_number_slave].int_anatomy_to_string($Status_anatomy/PanelContainer/HBoxContainer/VBoxContainer2/Label,call_number_slave,"Размер груди")
	Globaldata.basement_slaves[call_number_slave].int_anatomy_to_string($Status_anatomy/PanelContainer/HBoxContainer/VBoxContainer2/Label2,call_number_slave,"Лактация")
	Globaldata.basement_slaves[call_number_slave].int_anatomy_to_string($Status_anatomy/PanelContainer/HBoxContainer/VBoxContainer2/Label3,call_number_slave,"Пирсинг груди")
	Globaldata.basement_slaves[call_number_slave].int_anatomy_to_string($Status_anatomy/PanelContainer/HBoxContainer/VBoxContainer2/Label4,call_number_slave,"Модификация груди")
	Globaldata.basement_slaves[call_number_slave].int_anatomy_to_string($Status_anatomy/PanelContainer/HBoxContainer/VBoxContainer2/Label5,call_number_slave,"Возраст")
	Globaldata.basement_slaves[call_number_slave].int_anatomy_to_string($Status_anatomy/PanelContainer/HBoxContainer/VBoxContainer2/Label6,call_number_slave,"Влагалище")
	Globaldata.basement_slaves[call_number_slave].int_anatomy_to_string($Status_anatomy/PanelContainer/HBoxContainer/VBoxContainer2/Label7,call_number_slave,"Анус")
	Globaldata.basement_slaves[call_number_slave].int_anatomy_to_string($Status_anatomy/PanelContainer/HBoxContainer/VBoxContainer2/Label8,call_number_slave,"Пирсинг влагалища")
	Globaldata.basement_slaves[call_number_slave].int_anatomy_to_string($Status_anatomy/PanelContainer/HBoxContainer/VBoxContainer2/Label9,call_number_slave,"Модификация влагалища")
	Globaldata.basement_slaves[call_number_slave].int_anatomy_to_string($Status_anatomy/PanelContainer/HBoxContainer/VBoxContainer2/Label10,call_number_slave,"Метка")
	
	
	$Status_anatomy.set_visible(true)
	$Status_appearance.set_visible(false)
	$Status_skill_common.set_visible(false)
	$Status_skill_sex.set_visible(false)
	$Status_clothes.set_visible(false)
	


func _on_button_skills_common_pressed():
	Globaldata.basement_slaves[call_number_slave].int_skills_to_string($Status_skill_common/PanelContainer/HBoxContainer/VBoxContainer2/Label,Globaldata.basement_slaves[call_number_slave].status_housekeeping_slave)
	Globaldata.basement_slaves[call_number_slave].int_skills_to_string($Status_skill_common/PanelContainer/HBoxContainer/VBoxContainer2/Label2,Globaldata.basement_slaves[call_number_slave].status_cooking_slave)
	Globaldata.basement_slaves[call_number_slave].int_skills_to_string($Status_skill_common/PanelContainer/HBoxContainer/VBoxContainer2/Label3,Globaldata.basement_slaves[call_number_slave].status_medicine_slave)
	Globaldata.basement_slaves[call_number_slave].int_skills_to_string($Status_skill_common/PanelContainer/HBoxContainer/VBoxContainer2/Label4,Globaldata.basement_slaves[call_number_slave].status_alchemy_slave)
	Globaldata.basement_slaves[call_number_slave].int_skills_to_string($Status_skill_common/PanelContainer/HBoxContainer/VBoxContainer2/Label5,Globaldata.basement_slaves[call_number_slave].status_paperwork_slave)
	Globaldata.basement_slaves[call_number_slave].int_skills_to_string($Status_skill_common/PanelContainer/HBoxContainer/VBoxContainer2/Label6,Globaldata.basement_slaves[call_number_slave].status_etiquette_and_rehetoric_slave)
	Globaldata.basement_slaves[call_number_slave].int_skills_to_string($Status_skill_common/PanelContainer/HBoxContainer/VBoxContainer2/Label7,Globaldata.basement_slaves[call_number_slave].status_combat_traning_slave)
	Globaldata.basement_slaves[call_number_slave].int_skills_to_string($Status_skill_common/PanelContainer/HBoxContainer/VBoxContainer2/Label8,Globaldata.basement_slaves[call_number_slave].status_dancer_slave)
	Globaldata.basement_slaves[call_number_slave].int_skills_to_string($Status_skill_common/PanelContainer/HBoxContainer/VBoxContainer2/Label9,Globaldata.basement_slaves[call_number_slave].status_singer_slave)
	Globaldata.basement_slaves[call_number_slave].int_skills_to_string($Status_skill_common/PanelContainer/HBoxContainer/VBoxContainer2/Label10,Globaldata.basement_slaves[call_number_slave].status_musician_slave)
	Globaldata.basement_slaves[call_number_slave].int_skills_to_string($Status_skill_common/PanelContainer/HBoxContainer/VBoxContainer2/Label11,Globaldata.basement_slaves[call_number_slave].status_dog_slave)
	Globaldata.basement_slaves[call_number_slave].int_skills_to_string($Status_skill_common/PanelContainer/HBoxContainer/VBoxContainer2/Label12,Globaldata.basement_slaves[call_number_slave].status_cat_slave)
	Globaldata.basement_slaves[call_number_slave].int_skills_to_string($Status_skill_common/PanelContainer/HBoxContainer/VBoxContainer2/Label13,Globaldata.basement_slaves[call_number_slave].status_poni_slave)
	Globaldata.basement_slaves[call_number_slave].int_skills_to_string($Status_skill_common/PanelContainer/HBoxContainer/VBoxContainer2/Label14,Globaldata.basement_slaves[call_number_slave].status_hauler_slave)
	
	
	$Status_skill_common.set_visible(true)
	$Status_appearance.set_visible(false)
	$Status_anatomy.set_visible(false)
	$Status_skill_sex.set_visible(false)
	$Status_clothes.set_visible(false)
	


func _on_button_skills_sex_pressed():
	$Status_skill_sex.set_visible(true)
	$Status_skill_sex/PanelContainer.set_visible(true)
	$Status_skill_sex/Petting.set_visible(false)
	$Status_skill_sex/Oral_sex.set_visible(false)
	$Status_skill_sex/Penetration.set_visible(false)
	$Status_skill_sex/Group_sex.set_visible(false)
	$Status_skill_sex/Demostration.set_visible(false)
	$Status_skill_sex/Lesbian_sex.set_visible(false)
	$Status_skill_sex/Fetishism.set_visible(false)
	$Status_skill_sex/Xenophilia.set_visible(false)
	
	
	$Status_appearance.set_visible(false)
	$Status_anatomy.set_visible(false)
	$Status_skill_common.set_visible(false)
	$Status_clothes.set_visible(false)
	
	
	Globaldata.basement_slaves[call_number_slave].int_skills_to_string($Status_skill_sex/PanelContainer/HBoxContainer/VBoxContainer2/Petting_info,Globaldata.basement_slaves[call_number_slave].sex_skill_petting_average(Globaldata.basement_slaves, call_number_slave))
	Globaldata.basement_slaves[call_number_slave].int_skills_to_string($Status_skill_sex/PanelContainer/HBoxContainer/VBoxContainer2/Oral_sex_info,Globaldata.basement_slaves[call_number_slave].sex_skill_oral_sex_average(Globaldata.basement_slaves,call_number_slave))
	Globaldata.basement_slaves[call_number_slave].int_skills_to_string($Status_skill_sex/PanelContainer/HBoxContainer/VBoxContainer2/Penetration_info,Globaldata.basement_slaves[call_number_slave].sex_skill_penetration_average(Globaldata.basement_slaves,call_number_slave))
	Globaldata.basement_slaves[call_number_slave].int_skills_to_string($Status_skill_sex/PanelContainer/HBoxContainer/VBoxContainer2/Group_sex_info,Globaldata.basement_slaves[call_number_slave].sex_skill_group_sex_average(Globaldata.basement_slaves,call_number_slave))
	Globaldata.basement_slaves[call_number_slave].int_skills_to_string($Status_skill_sex/PanelContainer/HBoxContainer/VBoxContainer2/Demostration_info,Globaldata.basement_slaves[call_number_slave].sex_skill_demonstration_average(Globaldata.basement_slaves,call_number_slave))
	Globaldata.basement_slaves[call_number_slave].int_skills_to_string($Status_skill_sex/PanelContainer/HBoxContainer/VBoxContainer2/Lesbian_sex_info,Globaldata.basement_slaves[call_number_slave].sex_skill_lesbian_sex_average(Globaldata.basement_slaves,call_number_slave))
	Globaldata.basement_slaves[call_number_slave].int_skills_to_string($Status_skill_sex/PanelContainer/HBoxContainer/VBoxContainer2/Fetishism_info,Globaldata.basement_slaves[call_number_slave].sex_skill_fetishism_average(Globaldata.basement_slaves,call_number_slave))
	Globaldata.basement_slaves[call_number_slave].int_skills_to_string($Status_skill_sex/PanelContainer/HBoxContainer/VBoxContainer2/Xenophilia_info,Globaldata.basement_slaves[call_number_slave].sex_skill_xenophilia_average(Globaldata.basement_slaves,call_number_slave))


func _on_button_clothes_pressed():
	$Status_clothes.set_visible(true)
	$Status_appearance.set_visible(false)
	$Status_anatomy.set_visible(false)
	$Status_skill_common.set_visible(false)
	$Status_skill_sex.set_visible(false)


func _on_beauty_pressed():
	$Status_appearance/Info_beauty.set_visible(true)
	$Status_appearance/Status.set_visible(false)
	$Status_appearance/Back_status.set_visible(true)


func _on_endurance_pressed():
	$Status_appearance/Info_endurance.set_visible(true)
	$Status_appearance/Status.set_visible(false)
	$Status_appearance/Back_status.set_visible(true)


func _on_softness_pressed():
	$Status_appearance/Info_softness.set_visible(true)
	$Status_appearance/Status.set_visible(false)
	$Status_appearance/Back_status.set_visible(true)


func _on_mind_pressed():
	$Status_appearance/Info_mind.set_visible(true)
	$Status_appearance/Status.set_visible(false)
	$Status_appearance/Back_status.set_visible(true)


func _on_physique_pressed():
	$Status_appearance/Info_physique.set_visible(true)
	$Status_appearance/Status.set_visible(false)
	$Status_appearance/Back_status.set_visible(true)

func _on_style_pressed():
	$Status_appearance/Info_style.set_visible(true)
	$Status_appearance/Status.set_visible(false)
	$Status_appearance/Back_status.set_visible(true)


func _on_personality_pressed():
	$Status_appearance/Info_personality.set_visible(true)
	$Status_appearance/Status.set_visible(false)
	$Status_appearance/Back_status.set_visible(true)


func _on_close_status_pressed():
	$Status_appearance.set_visible(false)


func _on_back_status_pressed():
	$Status_appearance/Status.set_visible(true)
	$Status_appearance/Info_beauty.set_visible(false)
	$Status_appearance/Info_endurance.set_visible(false)
	$Status_appearance/Info_softness.set_visible(false)
	$Status_appearance/Info_mind.set_visible(false)
	$Status_appearance/Info_physique.set_visible(false)
	$Status_appearance/Info_style.set_visible(false)
	$Status_appearance/Info_personality.set_visible(false)


func _on_petting_pressed():
	$Status_skill_sex/Petting.set_visible(true)
	$Status_skill_sex/PanelContainer.set_visible(false)
	
	Globaldata.basement_slaves[call_number_slave].int_skills_to_string($Status_skill_sex/Petting/Petting/HBoxContainer/VBoxContainer2/Handjob_info,Globaldata.basement_slaves[call_number_slave].status_handjob_slave)
	Globaldata.basement_slaves[call_number_slave].int_skills_to_string($Status_skill_sex/Petting/Petting/HBoxContainer/VBoxContainer2/Footsjob_info,Globaldata.basement_slaves[call_number_slave].status_footsjob_slave)
	Globaldata.basement_slaves[call_number_slave].int_skills_to_string($Status_skill_sex/Petting/Petting/HBoxContainer/VBoxContainer2/Squeezing_info,Globaldata.basement_slaves[call_number_slave].status_squeezing_slave)
	Globaldata.basement_slaves[call_number_slave].int_skills_to_string($Status_skill_sex/Petting/Petting/HBoxContainer/VBoxContainer2/Payzuri,Globaldata.basement_slaves[call_number_slave].status_paizuri_slave)


func _on_back_petting_pressed():
	$Status_skill_sex/Petting.set_visible(false)
	$Status_skill_sex/PanelContainer.set_visible(true)


func _on_oral_sex_pressed():
	$Status_skill_sex/Oral_sex.set_visible(true)
	$Status_skill_sex/PanelContainer.set_visible(false)
	
	Globaldata.basement_slaves[call_number_slave].int_skills_to_string($Status_skill_sex/Oral_sex/Oral_sex/HBoxContainer/VBoxContainer2/Kissing_info,Globaldata.basement_slaves[call_number_slave].status_kissing_slave)
	Globaldata.basement_slaves[call_number_slave].int_skills_to_string($Status_skill_sex/Oral_sex/Oral_sex/HBoxContainer/VBoxContainer2/Licking_info,Globaldata.basement_slaves[call_number_slave].status_licking_slave)
	Globaldata.basement_slaves[call_number_slave].int_skills_to_string($Status_skill_sex/Oral_sex/Oral_sex/HBoxContainer/VBoxContainer2/Blowjob_info,Globaldata.basement_slaves[call_number_slave].status_blowjob_slave)
	Globaldata.basement_slaves[call_number_slave].int_skills_to_string($Status_skill_sex/Oral_sex/Oral_sex/HBoxContainer/VBoxContainer2/Irrumation_info,Globaldata.basement_slaves[call_number_slave].status_irrumation_slave)
	Globaldata.basement_slaves[call_number_slave].int_skills_to_string($Status_skill_sex/Oral_sex/Oral_sex/HBoxContainer/VBoxContainer2/Ass_licking_info,Globaldata.basement_slaves[call_number_slave].status_ass_licking_slave)


func _on_back_oral_sex_pressed():
	$Status_skill_sex/Oral_sex.set_visible(false)
	$Status_skill_sex/PanelContainer.set_visible(true)


func _on_penetration_pressed():
	$Status_skill_sex/Penetration.set_visible(true)
	$Status_skill_sex/PanelContainer.set_visible(false)
	
	Globaldata.basement_slaves[call_number_slave].int_skills_to_string($Status_skill_sex/Penetration/Penetration/HBoxContainer/VBoxContainer2/Sex_info,Globaldata.basement_slaves[call_number_slave].status_sex_slave)
	Globaldata.basement_slaves[call_number_slave].int_skills_to_string($Status_skill_sex/Penetration/Penetration/HBoxContainer/VBoxContainer2/Anal_sex_info,Globaldata.basement_slaves[call_number_slave].status_anal_sex_slave)
	Globaldata.basement_slaves[call_number_slave].int_skills_to_string($Status_skill_sex/Penetration/Penetration/HBoxContainer/VBoxContainer2/Fisting_info,Globaldata.basement_slaves[call_number_slave].status_fisting_slave)
	Globaldata.basement_slaves[call_number_slave].int_skills_to_string($Status_skill_sex/Penetration/Penetration/HBoxContainer/VBoxContainer2/Anal_fisting_info,Globaldata.basement_slaves[call_number_slave].status_anal_fisting_slave)
	


func _on_back_penetration_pressed():
	$Status_skill_sex/Penetration.set_visible(false)
	$Status_skill_sex/PanelContainer.set_visible(true)


func _on_group_sex_pressed():
	$Status_skill_sex/Group_sex.set_visible(true)
	$Status_skill_sex/PanelContainer.set_visible(false)
	
	Globaldata.basement_slaves[call_number_slave].int_skills_to_string($Status_skill_sex/Group_sex/Group_sex/HBoxContainer/VBoxContainer2/Mmw_info,Globaldata.basement_slaves[call_number_slave].status_mmw_slave)
	Globaldata.basement_slaves[call_number_slave].int_skills_to_string($Status_skill_sex/Group_sex/Group_sex/HBoxContainer/VBoxContainer2/Two_mans_info,Globaldata.basement_slaves[call_number_slave].status_two_mans_slave)
	Globaldata.basement_slaves[call_number_slave].int_skills_to_string($Status_skill_sex/Group_sex/Group_sex/HBoxContainer/VBoxContainer2/Three_mans_info2,Globaldata.basement_slaves[call_number_slave].status_three_mans_slave)
	Globaldata.basement_slaves[call_number_slave].int_skills_to_string($Status_skill_sex/Group_sex/Group_sex/HBoxContainer/VBoxContainer2/Five_mans_info,Globaldata.basement_slaves[call_number_slave].status_five_mans_slave)
	Globaldata.basement_slaves[call_number_slave].int_skills_to_string($Status_skill_sex/Group_sex/Group_sex/HBoxContainer/VBoxContainer2/Bukkake_info,Globaldata.basement_slaves[call_number_slave].status_bukkake_slave)


func _on_back_group_sex_pressed():
	$Status_skill_sex/Group_sex.set_visible(false)
	$Status_skill_sex/PanelContainer.set_visible(true)


func _on_demostration_pressed():
	$Status_skill_sex/Demostration.set_visible(true)
	$Status_skill_sex/PanelContainer.set_visible(false)
	
	Globaldata.basement_slaves[call_number_slave].int_skills_to_string($Status_skill_sex/Demostration/Demostration/HBoxContainer/VBoxContainer2/Seduction_info,Globaldata.basement_slaves[call_number_slave].status_seduction_slave)
	Globaldata.basement_slaves[call_number_slave].int_skills_to_string($Status_skill_sex/Demostration/Demostration/HBoxContainer/VBoxContainer2/Masturbate_info,Globaldata.basement_slaves[call_number_slave].status_masturbate_slave)
	Globaldata.basement_slaves[call_number_slave].int_skills_to_string($Status_skill_sex/Demostration/Demostration/HBoxContainer/VBoxContainer2/Dildo_info,Globaldata.basement_slaves[call_number_slave].status_dildo_slave)
	Globaldata.basement_slaves[call_number_slave].int_skills_to_string($Status_skill_sex/Demostration/Demostration/HBoxContainer/VBoxContainer2/Exbitionism_info,Globaldata.basement_slaves[call_number_slave].status_exbitionism_slave)
	Globaldata.basement_slaves[call_number_slave].int_skills_to_string($Status_skill_sex/Demostration/Demostration/HBoxContainer/VBoxContainer2/Humiliation_info,Globaldata.basement_slaves[call_number_slave].status_humiliation_slave)


func _on_back_demonstration_pressed():
	$Status_skill_sex/Demostration.set_visible(false)
	$Status_skill_sex/PanelContainer.set_visible(true)


func _on_lesbian_sex_pressed():
	$Status_skill_sex/Lesbian_sex.set_visible(true)
	$Status_skill_sex/PanelContainer.set_visible(false)
	
	Globaldata.basement_slaves[call_number_slave].int_skills_to_string($Status_skill_sex/Lesbian_sex/Lesbian_sex/HBoxContainer/VBoxContainer2/Caresses_info,Globaldata.basement_slaves[call_number_slave].status_caresses_slave)
	Globaldata.basement_slaves[call_number_slave].int_skills_to_string($Status_skill_sex/Lesbian_sex/Lesbian_sex/HBoxContainer/VBoxContainer2/Kuni_info,Globaldata.basement_slaves[call_number_slave].status_kuni_slave)
	Globaldata.basement_slaves[call_number_slave].int_skills_to_string($Status_skill_sex/Lesbian_sex/Lesbian_sex/HBoxContainer/VBoxContainer2/Lesbian_sex_info,Globaldata.basement_slaves[call_number_slave].status_lesbian_sex_slave)


func _on_back_lesbian_sex_pressed():
	$Status_skill_sex/Lesbian_sex.set_visible(false)
	$Status_skill_sex/PanelContainer.set_visible(true)


func _on_fetishism_pressed():
	$Status_skill_sex/Fetishism.set_visible(true)
	$Status_skill_sex/PanelContainer.set_visible(false)
	
	Globaldata.basement_slaves[call_number_slave].int_skills_to_string($Status_skill_sex/Fetishism/Fetishism/HBoxContainer/VBoxContainer2/Enema_info,Globaldata.basement_slaves[call_number_slave].status_enema_slave)
	Globaldata.basement_slaves[call_number_slave].int_skills_to_string($Status_skill_sex/Fetishism/Fetishism/HBoxContainer/VBoxContainer2/Masochism_info,Globaldata.basement_slaves[call_number_slave].status_masochism_slave)
	Globaldata.basement_slaves[call_number_slave].int_skills_to_string($Status_skill_sex/Fetishism/Fetishism/HBoxContainer/VBoxContainer2/Self_torture_info,Globaldata.basement_slaves[call_number_slave].status_self_torture_slave)
	Globaldata.basement_slaves[call_number_slave].int_skills_to_string($Status_skill_sex/Fetishism/Fetishism/HBoxContainer/VBoxContainer2/Urinophilia_info,Globaldata.basement_slaves[call_number_slave].status_urinophilia_slave)
	Globaldata.basement_slaves[call_number_slave].int_skills_to_string($Status_skill_sex/Fetishism/Fetishism/HBoxContainer/VBoxContainer2/Coprophilia_info,Globaldata.basement_slaves[call_number_slave].status_coprophilia_slave)
	Globaldata.basement_slaves[call_number_slave].int_skills_to_string($Status_skill_sex/Fetishism/Fetishism/HBoxContainer/VBoxContainer2/Fuck_in_boobs_info,Globaldata.basement_slaves[call_number_slave].status_fuck_in_boobs_slave)


func _on_back_fetishism_pressed():
	$Status_skill_sex/Fetishism.set_visible(false)
	$Status_skill_sex/PanelContainer.set_visible(true)


func _on_xenophilia_pressed():
	$Status_skill_sex/Xenophilia.set_visible(true)
	$Status_skill_sex/PanelContainer.set_visible(false)
	
	Globaldata.basement_slaves[call_number_slave].int_skills_to_string($Status_skill_sex/Xenophilia/Xenophilia/HBoxContainer/VBoxContainer2/Doggy_info,Globaldata.basement_slaves[call_number_slave].status_doggy_slave)
	Globaldata.basement_slaves[call_number_slave].int_skills_to_string($Status_skill_sex/Xenophilia/Xenophilia/HBoxContainer/VBoxContainer2/Pig_info,Globaldata.basement_slaves[call_number_slave].status_pig_slave)
	Globaldata.basement_slaves[call_number_slave].int_skills_to_string($Status_skill_sex/Xenophilia/Xenophilia/HBoxContainer/VBoxContainer2/Arachnid_info,Globaldata.basement_slaves[call_number_slave].status_arachnid_slave)
	Globaldata.basement_slaves[call_number_slave].int_skills_to_string($Status_skill_sex/Xenophilia/Xenophilia/HBoxContainer/VBoxContainer2/Horse_info,Globaldata.basement_slaves[call_number_slave].status_horse_slave)
	Globaldata.basement_slaves[call_number_slave].int_skills_to_string($Status_skill_sex/Xenophilia/Xenophilia/HBoxContainer/VBoxContainer2/Tentacles_info,Globaldata.basement_slaves[call_number_slave].status_tentacles_slave)


func _on_back_xenophilia_pressed():
	$Status_skill_sex/Xenophilia.set_visible(false)
	$Status_skill_sex/PanelContainer.set_visible(true)


func _on_close_status_anatomy_pressed():
	$Status_anatomy.set_visible(false)


func _on_close_status_skill_common_pressed():
	$Status_skill_common.set_visible(false)


func _on_close_status_skill_sex_pressed():
	$Status_skill_sex.set_visible(false)


func _on_close_status_clothes_pressed():
	$Status_clothes.set_visible(false)


func _on_button_send_home_pressed():
	Globaldata.all_slaves.append(Globaldata.basement_slaves[call_number_slave])
	Globaldata.basement_slaves.remove_at(call_number_slave)
	$Status_slave.set_visible(false)
	$Status_appearance.set_visible(false)
	$Status_anatomy.set_visible(false)
	$Status_skill_common.set_visible(false)
	$Status_skill_sex.set_visible(false)
	$Status_clothes.set_visible(false)
	$Slave.set_texture(null)
	_on_slave_free_pressed()


func _on_settings_pressed():
	MusicController.stop_play_place_music(true)
	get_tree().root.add_child(preload("res://scen/main_menu.tscn").instantiate())


func _on_accept_dialog_confirmed():
	pass # Replace with function body.


func _on_button_send_home_mouse_entered():
	Globaldata.cursor = 3


func _on_button_send_home_mouse_exited():
	Globaldata.cursor = 0
