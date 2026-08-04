extends Node2D

func _ready():
	MusicController.place_music = "res://GameData/snd/Game/Red light street/Background.mp3"
	MusicController.place_play_music(0)
	$Brothel/Dialog.set_text("[center] Что вам?[/center]")

func _on_exit_the_brothel_pressed():
	get_tree().change_scene_to_file("res://scen/red_light_district.tscn")
	MusicController.play_steps("res://GameData/snd/Game/Шаги.mp3")
	MusicController.open_door_music()

func _on_give_slaves_to_panel_pressed():
	var price_room = int(10 / Globaldata.difficult_ratio)
	$Brothel/Dialog.set_text("[center]Учтите что стоимость аренды комнаты %s звёздных дукат, одежду вашим выдавать рабам не собираюсь, у меня и без вас одежды девочкам не хватает.[/center]" %price_room)
	$Brothel/Give_slaves_to_panel.set_visible(false)
	$Brothel/Talk.set_visible(false)
	$Brothel/Exit_the_brothel.set_visible(false)
	if Globaldata.have_slave1:
		$Brothel/Give_slave1.set_visible(true)
	if Globaldata.have_slave2:
		$Brothel/Give_slave2.set_visible(true)
	if Globaldata.have_slave3:
		$Brothel/Give_slave3.set_visible(true)
	$Brothel/Back.set_visible(true)
	$Brothel/Confirm.set_visible(true)




func _on_back_pressed():
	$Brothel/Dialog.set_text("[center] Что вам?[/center]")
	$Brothel/Give_slaves_to_panel.set_visible(true)
	$Brothel/Talk.set_visible(true)
	$Brothel/Exit_the_brothel.set_visible(true)
	$Brothel/Give_slave1.set_visible(false)
	$Brothel/Give_slave2.set_visible(false)
	$Brothel/Give_slave3.set_visible(false)
	$Brothel/Back.set_visible(false)
	$Brothel/Give_slave1/Checkbox_slave1/Checkmark_slave1.set_visible(false)
	$Brothel/Give_slave2/Checkbox_slave2/Checkmark_slave2.set_visible(false)
	$Brothel/Give_slave3/Checkbox_slave3/Checkmark_slave3.set_visible(false)
	$Brothel/Confirm.set_visible(false)


func _on_give_slave_1_pressed():
	if $Brothel/Give_slave1/Checkbox_slave1/Checkmark_slave1.is_visible():
		$Brothel/Give_slave1/Checkbox_slave1/Checkmark_slave1.set_visible(false)
	else:
		$Brothel/Give_slave1/Checkbox_slave1/Checkmark_slave1.set_visible(true)


func _on_give_slave_2_pressed():
	if $Brothel/Give_slave2/Checkbox_slave2/Checkmark_slave2.is_visible():
		$Brothel/Give_slave2/Checkbox_slave2/Checkmark_slave2.set_visible(false)
	else:
		$Brothel/Give_slave2/Checkbox_slave2/Checkmark_slave2.set_visible(true)


func _on_give_slave_3_pressed():
	if $Brothel/Give_slave3/Checkbox_slave3/Checkmark_slave3.is_visible():
		$Brothel/Give_slave3/Checkbox_slave3/Checkmark_slave3.set_visible(false)
	else:
		$Brothel/Give_slave3/Checkbox_slave3/Checkmark_slave3.set_visible(true)


func _on_confirm_pressed():
	if $Brothel/Give_slave1/Checkbox_slave1/Checkmark_slave1.is_visible() or $Brothel/Give_slave2/Checkbox_slave2/Checkmark_slave2.is_visible() or $Brothel/Give_slave3/Checkbox_slave3/Checkmark_slave3.is_visible():
		var revenue = 0
		var rng = RandomNumberGenerator.new()
		rng.randomize()
		var random_int_num = rng.randi_range(1,35)
		if Globaldata.have_slave1:
			match random_int_num:
				1:
					rng.randomize()
					var rand_revenue = rng.randi_range(1,10)
					revenue = (rand_revenue + Globaldata.status_handjob_slave1) * Globaldata.difficult_ratio + revenue
				2:
					rng.randomize()
					var rand_revenue = rng.randi_range(1,10)
					revenue = (rand_revenue + Globaldata.status_footsjob_slave1) * Globaldata.difficult_ratio + revenue
				3:
					rng.randomize()
					var rand_revenue = rng.randi_range(1,10)
					revenue = (rand_revenue + Globaldata.status_squeezing_slave1) * Globaldata.difficult_ratio + revenue
				4:
					rng.randomize()
					var rand_revenue = rng.randi_range(1,10)
					revenue = (rand_revenue + Globaldata.status_kissing_slave1) * Globaldata.difficult_ratio + revenue
				5:
					rng.randomize()
					var rand_revenue = rng.randi_range(1,10)
					revenue = (rand_revenue + Globaldata.status_licking_slave1) * Globaldata.difficult_ratio + revenue
				6:
					rng.randomize()
					var rand_revenue = rng.randi_range(1,10)
					revenue = (rand_revenue + Globaldata.status_blowjob_slave1) * Globaldata.difficult_ratio + revenue
				7:
					rng.randomize()
					var rand_revenue = rng.randi_range(1,10)
					revenue = (rand_revenue + Globaldata.status_irrumation_slave1) * Globaldata.difficult_ratio + revenue
				8:
					rng.randomize()
					var rand_revenue = rng.randi_range(1,10)
					revenue = (rand_revenue + Globaldata.status_ass_licking_slave1) * Globaldata.difficult_ratio + revenue
				9:
					rng.randomize()
					var rand_revenue = rng.randi_range(1,10)
					revenue = (rand_revenue + Globaldata.status_seduction_slave1) * Globaldata.difficult_ratio + revenue
				10:
					rng.randomize()
					var rand_revenue = rng.randi_range(1,10)
					revenue = (rand_revenue + Globaldata.status_masturbate_slave1) * Globaldata.difficult_ratio + revenue
				11:
					rng.randomize()
					var rand_revenue = rng.randi_range(1,10)
					revenue = (rand_revenue + Globaldata.status_dildo_slave1) * Globaldata.difficult_ratio + revenue
				12:
					rng.randomize()
					var rand_revenue = rng.randi_range(1,10)
					revenue = (rand_revenue + Globaldata.status_exbitionism_slave1) * Globaldata.difficult_ratio + revenue
				13:
					rng.randomize()
					var rand_revenue = rng.randi_range(1,10)
					revenue = (rand_revenue + Globaldata.status_humiliation_slave1) * Globaldata.difficult_ratio + revenue
				14:
					rng.randomize()
					var rand_revenue = rng.randi_range(1,10)
					revenue = (rand_revenue + Globaldata.status_doggy_slave1) * Globaldata.difficult_ratio + revenue
				15:
					rng.randomize()
					var rand_revenue = rng.randi_range(1,10)
					revenue = (rand_revenue + Globaldata.status_pig_slave1) * Globaldata.difficult_ratio + revenue
				16:
					rng.randomize()
					var rand_revenue = rng.randi_range(1,10)
					revenue = (rand_revenue + Globaldata.status_arachnid_slave1) * Globaldata.difficult_ratio + revenue
				17:
					rng.randomize()
					var rand_revenue = rng.randi_range(1,10)
					revenue = (rand_revenue + Globaldata.status_horse_slave1) * Globaldata.difficult_ratio + revenue
				18:
					rng.randomize()
					var rand_revenue = rng.randi_range(1,10)
					revenue = (rand_revenue + Globaldata.status_tentacles_slave1) * Globaldata.difficult_ratio + revenue
				19:
					rng.randomize()
					var rand_revenue = rng.randi_range(1,10)
					revenue = (rand_revenue + Globaldata.status_sex_slave1) * Globaldata.difficult_ratio + revenue
				20:
					rng.randomize()
					var rand_revenue = rng.randi_range(1,10)
					revenue = (rand_revenue + Globaldata.status_anal_sex_slave1) * Globaldata.difficult_ratio + revenue
				21:
					rng.randomize()
					var rand_revenue = rng.randi_range(1,10)
					revenue = (rand_revenue + Globaldata.status_fisting_slave1) * Globaldata.difficult_ratio + revenue
				22:
					rng.randomize()
					var rand_revenue = rng.randi_range(1,10)
					revenue = (rand_revenue + Globaldata.status_anal_fisting_slave1) * Globaldata.difficult_ratio + revenue
				23:
					rng.randomize()
					var rand_revenue = rng.randi_range(1,10)
					revenue = (rand_revenue + Globaldata.status_mmw_slave1) * Globaldata.difficult_ratio + revenue
				24:
					rng.randomize()
					var rand_revenue = rng.randi_range(1,10)
					revenue = (rand_revenue + Globaldata.status_two_mans_slave1) * Globaldata.difficult_ratio + revenue
				25:
					rng.randomize()
					var rand_revenue = rng.randi_range(1,10)
					revenue = (rand_revenue + Globaldata.status_three_mans_slave1) * Globaldata.difficult_ratio + revenue
				26:
					rng.randomize()
					var rand_revenue = rng.randi_range(1,10)
					revenue = (rand_revenue + Globaldata.status_five_mans_slave1) * Globaldata.difficult_ratio + revenue
				27:
					rng.randomize()
					var rand_revenue = rng.randi_range(1,10)
					revenue = (rand_revenue + Globaldata.status_bukkake_slave1) * Globaldata.difficult_ratio + revenue
				28:
					rng.randomize()
					var rand_revenue = rng.randi_range(1,10)
					revenue = (rand_revenue + Globaldata.status_caresses_slave1) * Globaldata.difficult_ratio + revenue
				29:
					rng.randomize()
					var rand_revenue = rng.randi_range(1,10)
					revenue = (rand_revenue + Globaldata.status_kuni_slave1) * Globaldata.difficult_ratio + revenue
				30:
					rng.randomize()
					var rand_revenue = rng.randi_range(1,10)
					revenue = (rand_revenue + Globaldata.status_lesbian_sex_slave1) * Globaldata.difficult_ratio + revenue
				31:
					rng.randomize()
					var rand_revenue = rng.randi_range(1,10)
					revenue = (rand_revenue + Globaldata.status_fuck_in_boobs_slave1) * Globaldata.difficult_ratio + revenue
				32:
					rng.randomize()
					var rand_revenue = rng.randi_range(1,10)
					revenue = (rand_revenue + Globaldata.status_enema_slave1) * Globaldata.difficult_ratio + revenue
				33:
					rng.randomize()
					var rand_revenue = rng.randi_range(1,10)
					revenue = (rand_revenue + Globaldata.status_masochism_slave1) * Globaldata.difficult_ratio + revenue
				34:
					rng.randomize()
					var rand_revenue = rng.randi_range(1,10)
					revenue = (rand_revenue + Globaldata.status_self_torture_slave1) * Globaldata.difficult_ratio + revenue
				35:
					rng.randomize()
					var rand_revenue = rng.randi_range(1,10)
					revenue = (rand_revenue + Globaldata.status_urinophilia_slave1) * Globaldata.difficult_ratio + revenue
				36:
					rng.randomize()
					var rand_revenue = rng.randi_range(1,10)
					revenue = (rand_revenue + Globaldata.status_coprophilia_slave1) * Globaldata.difficult_ratio + revenue
		print(revenue)
		rng.randomize()
		random_int_num = rng.randi_range(1,35)
		if Globaldata.have_slave2:
			match random_int_num:
				1:
					rng.randomize()
					var rand_revenue = rng.randi_range(1,10)
					revenue = (rand_revenue + Globaldata.status_handjob_slave2) * Globaldata.difficult_ratio + revenue
				2:
					rng.randomize()
					var rand_revenue = rng.randi_range(1,10)
					revenue = (rand_revenue + Globaldata.status_footsjob_slave2) * Globaldata.difficult_ratio + revenue
				3:
					rng.randomize()
					var rand_revenue = rng.randi_range(1,10)
					revenue = (rand_revenue + Globaldata.status_squeezing_slave2) * Globaldata.difficult_ratio + revenue
				4:
					rng.randomize()
					var rand_revenue = rng.randi_range(1,10)
					revenue = (rand_revenue + Globaldata.status_kissing_slave2) * Globaldata.difficult_ratio + revenue
				5:
					rng.randomize()
					var rand_revenue = rng.randi_range(1,10)
					revenue = (rand_revenue + Globaldata.status_licking_slave2) * Globaldata.difficult_ratio + revenue
				6:
					rng.randomize()
					var rand_revenue = rng.randi_range(1,10)
					revenue = (rand_revenue + Globaldata.status_blowjob_slave2) * Globaldata.difficult_ratio + revenue
				7:
					rng.randomize()
					var rand_revenue = rng.randi_range(1,10)
					revenue = (rand_revenue + Globaldata.status_irrumation_slave2) * Globaldata.difficult_ratio + revenue
				8:
					rng.randomize()
					var rand_revenue = rng.randi_range(1,10)
					revenue = (rand_revenue + Globaldata.status_ass_licking_slave2) * Globaldata.difficult_ratio + revenue
				9:
					rng.randomize()
					var rand_revenue = rng.randi_range(1,10)
					revenue = (rand_revenue + Globaldata.status_seduction_slave2) * Globaldata.difficult_ratio + revenue
				10:
					rng.randomize()
					var rand_revenue = rng.randi_range(1,10)
					revenue = (rand_revenue + Globaldata.status_masturbate_slave2) * Globaldata.difficult_ratio + revenue
				11:
					rng.randomize()
					var rand_revenue = rng.randi_range(1,10)
					revenue = (rand_revenue + Globaldata.status_dildo_slave2) * Globaldata.difficult_ratio + revenue
				12:
					rng.randomize()
					var rand_revenue = rng.randi_range(1,10)
					revenue = (rand_revenue + Globaldata.status_exbitionism_slave2) * Globaldata.difficult_ratio + revenue
				13:
					rng.randomize()
					var rand_revenue = rng.randi_range(1,10)
					revenue = (rand_revenue + Globaldata.status_humiliation_slave2) * Globaldata.difficult_ratio + revenue
				14:
					rng.randomize()
					var rand_revenue = rng.randi_range(1,10)
					revenue = (rand_revenue + Globaldata.status_doggy_slave2) * Globaldata.difficult_ratio + revenue
				15:
					rng.randomize()
					var rand_revenue = rng.randi_range(1,10)
					revenue = (rand_revenue + Globaldata.status_pig_slave2) * Globaldata.difficult_ratio + revenue
				16:
					rng.randomize()
					var rand_revenue = rng.randi_range(1,10)
					revenue = (rand_revenue + Globaldata.status_arachnid_slave2) * Globaldata.difficult_ratio + revenue
				17:
					rng.randomize()
					var rand_revenue = rng.randi_range(1,10)
					revenue = (rand_revenue + Globaldata.status_horse_slave2) * Globaldata.difficult_ratio + revenue
				18:
					rng.randomize()
					var rand_revenue = rng.randi_range(1,10)
					revenue = (rand_revenue + Globaldata.status_tentacles_slave2) * Globaldata.difficult_ratio + revenue
				19:
					rng.randomize()
					var rand_revenue = rng.randi_range(1,10)
					revenue = (rand_revenue + Globaldata.status_sex_slave2) * Globaldata.difficult_ratio + revenue
				20:
					rng.randomize()
					var rand_revenue = rng.randi_range(1,10)
					revenue = (rand_revenue + Globaldata.status_anal_sex_slave2) * Globaldata.difficult_ratio + revenue
				21:
					rng.randomize()
					var rand_revenue = rng.randi_range(1,10)
					revenue = (rand_revenue + Globaldata.status_fisting_slave2) * Globaldata.difficult_ratio + revenue
				22:
					rng.randomize()
					var rand_revenue = rng.randi_range(1,10)
					revenue = (rand_revenue + Globaldata.status_anal_fisting_slave2) * Globaldata.difficult_ratio + revenue
				23:
					rng.randomize()
					var rand_revenue = rng.randi_range(1,10)
					revenue = (rand_revenue + Globaldata.status_mmw_slave2) * Globaldata.difficult_ratio + revenue
				24:
					rng.randomize()
					var rand_revenue = rng.randi_range(1,10)
					revenue = (rand_revenue + Globaldata.status_two_mans_slave2) * Globaldata.difficult_ratio + revenue
				25:
					rng.randomize()
					var rand_revenue = rng.randi_range(1,10)
					revenue = (rand_revenue + Globaldata.status_three_mans_slave2) * Globaldata.difficult_ratio + revenue
				26:
					rng.randomize()
					var rand_revenue = rng.randi_range(1,10)
					revenue = (rand_revenue + Globaldata.status_five_mans_slave2) * Globaldata.difficult_ratio + revenue
				27:
					rng.randomize()
					var rand_revenue = rng.randi_range(1,10)
					revenue = (rand_revenue + Globaldata.status_bukkake_slave2) * Globaldata.difficult_ratio + revenue
				28:
					rng.randomize()
					var rand_revenue = rng.randi_range(1,10)
					revenue = (rand_revenue + Globaldata.status_caresses_slave2) * Globaldata.difficult_ratio + revenue
				29:
					rng.randomize()
					var rand_revenue = rng.randi_range(1,10)
					revenue = (rand_revenue + Globaldata.status_kuni_slave2) * Globaldata.difficult_ratio + revenue
				30:
					rng.randomize()
					var rand_revenue = rng.randi_range(1,10)
					revenue = (rand_revenue + Globaldata.status_lesbian_sex_slave2) * Globaldata.difficult_ratio + revenue
				31:
					rng.randomize()
					var rand_revenue = rng.randi_range(1,10)
					revenue = (rand_revenue + Globaldata.status_fuck_in_boobs_slave2) * Globaldata.difficult_ratio + revenue
				32:
					rng.randomize()
					var rand_revenue = rng.randi_range(1,10)
					revenue = (rand_revenue + Globaldata.status_enema_slave2) * Globaldata.difficult_ratio + revenue
				33:
					rng.randomize()
					var rand_revenue = rng.randi_range(1,10)
					revenue = (rand_revenue + Globaldata.status_masochism_slave2) * Globaldata.difficult_ratio + revenue
				34:
					rng.randomize()
					var rand_revenue = rng.randi_range(1,10)
					revenue = (rand_revenue + Globaldata.status_self_torture_slave2) * Globaldata.difficult_ratio + revenue
				35:
					rng.randomize()
					var rand_revenue = rng.randi_range(1,10)
					revenue = (rand_revenue + Globaldata.status_urinophilia_slave2) * Globaldata.difficult_ratio + revenue
				36:
					rng.randomize()
					var rand_revenue = rng.randi_range(1,10)
					revenue = (rand_revenue + Globaldata.status_coprophilia_slave2) * Globaldata.difficult_ratio + revenue
		print(revenue)
		rng.randomize()
		random_int_num = rng.randi_range(1,35)
		if Globaldata.have_slave3:
			match random_int_num:
				1:
					rng.randomize()
					var rand_revenue = rng.randi_range(1,10)
					revenue = (rand_revenue + Globaldata.status_handjob_slave3) * Globaldata.difficult_ratio + revenue
				2:
					rng.randomize()
					var rand_revenue = rng.randi_range(1,10)
					revenue = (rand_revenue + Globaldata.status_footsjob_slave3) * Globaldata.difficult_ratio + revenue
				3:
					rng.randomize()
					var rand_revenue = rng.randi_range(1,10)
					revenue = (rand_revenue + Globaldata.status_squeezing_slave3) * Globaldata.difficult_ratio + revenue
				4:
					rng.randomize()
					var rand_revenue = rng.randi_range(1,10)
					revenue = (rand_revenue + Globaldata.status_kissing_slave3) * Globaldata.difficult_ratio + revenue
				5:
					rng.randomize()
					var rand_revenue = rng.randi_range(1,10)
					revenue = (rand_revenue + Globaldata.status_licking_slave3) * Globaldata.difficult_ratio + revenue
				6:
					rng.randomize()
					var rand_revenue = rng.randi_range(1,10)
					revenue = (rand_revenue + Globaldata.status_blowjob_slave3) * Globaldata.difficult_ratio + revenue
				7:
					rng.randomize()
					var rand_revenue = rng.randi_range(1,10)
					revenue = (rand_revenue + Globaldata.status_irrumation_slave3) * Globaldata.difficult_ratio + revenue
				8:
					rng.randomize()
					var rand_revenue = rng.randi_range(1,10)
					revenue = (rand_revenue + Globaldata.status_ass_licking_slave3) * Globaldata.difficult_ratio + revenue
				9:
					rng.randomize()
					var rand_revenue = rng.randi_range(1,10)
					revenue = (rand_revenue + Globaldata.status_seduction_slave3) * Globaldata.difficult_ratio + revenue
				10:
					rng.randomize()
					var rand_revenue = rng.randi_range(1,10)
					revenue = (rand_revenue + Globaldata.status_masturbate_slave3) * Globaldata.difficult_ratio + revenue
				11:
					rng.randomize()
					var rand_revenue = rng.randi_range(1,10)
					revenue = (rand_revenue + Globaldata.status_dildo_slave3) * Globaldata.difficult_ratio + revenue
				12:
					rng.randomize()
					var rand_revenue = rng.randi_range(1,10)
					revenue = (rand_revenue + Globaldata.status_exbitionism_slave3) * Globaldata.difficult_ratio + revenue
				13:
					rng.randomize()
					var rand_revenue = rng.randi_range(1,10)
					revenue = (rand_revenue + Globaldata.status_humiliation_slave3) * Globaldata.difficult_ratio + revenue
				14:
					rng.randomize()
					var rand_revenue = rng.randi_range(1,10)
					revenue = (rand_revenue + Globaldata.status_doggy_slave3) * Globaldata.difficult_ratio + revenue
				15:
					rng.randomize()
					var rand_revenue = rng.randi_range(1,10)
					revenue = (rand_revenue + Globaldata.status_pig_slave3) * Globaldata.difficult_ratio + revenue
				16:
					rng.randomize()
					var rand_revenue = rng.randi_range(1,10)
					revenue = (rand_revenue + Globaldata.status_arachnid_slave3) * Globaldata.difficult_ratio + revenue
				17:
					rng.randomize()
					var rand_revenue = rng.randi_range(1,10)
					revenue = (rand_revenue + Globaldata.status_horse_slave3) * Globaldata.difficult_ratio + revenue
				18:
					rng.randomize()
					var rand_revenue = rng.randi_range(1,10)
					revenue = (rand_revenue + Globaldata.status_tentacles_slave3) * Globaldata.difficult_ratio + revenue
				19:
					rng.randomize()
					var rand_revenue = rng.randi_range(1,10)
					revenue = (rand_revenue + Globaldata.status_sex_slave3) * Globaldata.difficult_ratio + revenue
				20:
					rng.randomize()
					var rand_revenue = rng.randi_range(1,10)
					revenue = (rand_revenue + Globaldata.status_anal_sex_slave3) * Globaldata.difficult_ratio + revenue
				21:
					rng.randomize()
					var rand_revenue = rng.randi_range(1,10)
					revenue = (rand_revenue + Globaldata.status_fisting_slave3) * Globaldata.difficult_ratio + revenue
				22:
					rng.randomize()
					var rand_revenue = rng.randi_range(1,10)
					revenue = (rand_revenue + Globaldata.status_anal_fisting_slave3) * Globaldata.difficult_ratio + revenue
				23:
					rng.randomize()
					var rand_revenue = rng.randi_range(1,10)
					revenue = (rand_revenue + Globaldata.status_mmw_slave3) * Globaldata.difficult_ratio + revenue
				24:
					rng.randomize()
					var rand_revenue = rng.randi_range(1,10)
					revenue = (rand_revenue + Globaldata.status_two_mans_slave3) * Globaldata.difficult_ratio + revenue
				25:
					rng.randomize()
					var rand_revenue = rng.randi_range(1,10)
					revenue = (rand_revenue + Globaldata.status_three_mans_slave3) * Globaldata.difficult_ratio + revenue
				26:
					rng.randomize()
					var rand_revenue = rng.randi_range(1,10)
					revenue = (rand_revenue + Globaldata.status_five_mans_slave3) * Globaldata.difficult_ratio + revenue
				27:
					rng.randomize()
					var rand_revenue = rng.randi_range(1,10)
					revenue = (rand_revenue + Globaldata.status_bukkake_slave3) * Globaldata.difficult_ratio + revenue
				28:
					rng.randomize()
					var rand_revenue = rng.randi_range(1,10)
					revenue = (rand_revenue + Globaldata.status_caresses_slave3) * Globaldata.difficult_ratio + revenue
				29:
					rng.randomize()
					var rand_revenue = rng.randi_range(1,10)
					revenue = (rand_revenue + Globaldata.status_kuni_slave3) * Globaldata.difficult_ratio + revenue
				30:
					rng.randomize()
					var rand_revenue = rng.randi_range(1,10)
					revenue = (rand_revenue + Globaldata.status_lesbian_sex_slave3) * Globaldata.difficult_ratio + revenue
				31:
					rng.randomize()
					var rand_revenue = rng.randi_range(1,10)
					revenue = (rand_revenue + Globaldata.status_fuck_in_boobs_slave3) * Globaldata.difficult_ratio + revenue
				32:
					rng.randomize()
					var rand_revenue = rng.randi_range(1,10)
					revenue = (rand_revenue + Globaldata.status_enema_slave3) * Globaldata.difficult_ratio + revenue
				33:
					rng.randomize()
					var rand_revenue = rng.randi_range(1,10)
					revenue = (rand_revenue + Globaldata.status_masochism_slave3) * Globaldata.difficult_ratio + revenue
				34:
					rng.randomize()
					var rand_revenue = rng.randi_range(1,10)
					revenue = (rand_revenue + Globaldata.status_self_torture_slave3) * Globaldata.difficult_ratio + revenue
				35:
					rng.randomize()
					var rand_revenue = rng.randi_range(1,10)
					revenue = (rand_revenue + Globaldata.status_urinophilia_slave3) * Globaldata.difficult_ratio + revenue
				36:
					rng.randomize()
					var rand_revenue = rng.randi_range(1,10)
					revenue = (rand_revenue + Globaldata.status_coprophilia_slave3) * Globaldata.difficult_ratio + revenue
		revenue = int(revenue)
		Globaldata.money += revenue
		print(Globaldata.money)
		$Brothel/Dialog.set_text("[center]Вот ваши %s звёздныx дукат за работу рабов .\n Что-то ещё?[/center]"%revenue)
		$Brothel/Give_slaves_to_panel.set_visible(true)
		$Brothel/Talk.set_visible(true)
		$Brothel/Exit_the_brothel.set_visible(true)
		$Brothel/Give_slave1.set_visible(false)
		$Brothel/Give_slave2.set_visible(false)
		$Brothel/Give_slave3.set_visible(false)
		$Brothel/Back.set_visible(false)
		$Brothel/Give_slave1/Checkbox_slave1/Checkmark_slave1.set_visible(false)
		$Brothel/Give_slave2/Checkbox_slave2/Checkmark_slave2.set_visible(false)
		$Brothel/Give_slave3/Checkbox_slave3/Checkmark_slave3.set_visible(false)
		$Brothel/Confirm.set_visible(false)
	else :
		$Brothel/Dialog.set_text("[center]Я за воздух денег не даю но могу забрать.[/center]")


func _on_settings_pressed():
	Globaldata.now_scene = "res://scen/brothel.tscn"
	MusicController.stop_play_place_music(true)
	Globaldata.settings_scene = true
	get_tree().change_scene_to_file("res://scen/main_menu.tscn")
