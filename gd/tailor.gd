extends Node2D

var old_text_dialog = ""

func _ready():
	MusicController.open_door_music()
	$Dialog.set_text("[center]А вам что нужно?[/center]")


func _on_exit_pressed():
	get_tree().change_scene_to_file("res://scen/trading_area.tscn")
	MusicController.play_steps("res://GameData/snd/Game/Шаги.mp3")
	MusicController.open_door_music()
	print(Globaldata.all_clothes)


func _on_buy_clothes_pressed():
	old_text_dialog = "[center]Вот мои товары[/center]"
	$Dialog.set_text("[center]Вот мои товары[/center]")
	$Main_menu_tailor.set_visible(false)
	$Products.set_visible(true)


func _on_back_pressed():
	$Dialog.set_text("[center]Ничего не покупаешь?Жаль.[/center]")
	$Main_menu_tailor.set_visible(true)
	$Products.set_visible(false)



func _on_first_product_pressed():
	if Globaldata.all_clothes.size() < Globaldata.max_cloths_in_wardrobe:
		Globaldata.all_clothes.append(1)
		$Dialog.set_text("[center]Что-то ещё?[/center]")
		$Main_menu_tailor.set_visible(true)
		$Products.set_visible(false)
	else:
		$Dialog.set_text("[center]Боюсь у тебя места не зватит для этой одежды.[/center]")


func _on_second_product_pressed():
	if Globaldata.all_clothes.size() < Globaldata.max_cloths_in_wardrobe:
		Globaldata.all_clothes.append(2)
		$Main_menu_tailor.set_visible(true)
		$Products.set_visible(false)
	else:
		$Dialog.set_text("[center]Боюсь у тебя места не зватит для этой одежды.[/center]")


func _on_third_product_pressed():
	if Globaldata.all_clothes.size() < Globaldata.max_cloths_in_wardrobe:
		Globaldata.all_clothes.append(3)
		$Dialog.set_text("[center]Что-то ещё?[/center]")
		$Main_menu_tailor.set_visible(true)
		$Products.set_visible(false)
	else:
		$Dialog.set_text("[center]Боюсь у тебя места не зватит для этой одежды.[/center]")


func _on_fourth_product_pressed():
	if Globaldata.all_clothes.size() < Globaldata.max_cloths_in_wardrobe:
		Globaldata.all_clothes.append(4)
		$Dialog.set_text("[center]Что-то ещё?[/center]")
		$Main_menu_tailor.set_visible(true)
		$Products.set_visible(false)
	else:
		$Dialog.set_text("[center]Боюсь у тебя места не зватит для этой одежды.[/center]")


func _on_fifth_product_pressed():
	if Globaldata.all_clothes.size() < Globaldata.max_cloths_in_wardrobe:
		Globaldata.all_clothes.append(5)
		$Dialog.set_text("[center]Что-то ещё?[/center]")
		$Main_menu_tailor.set_visible(true)
		$Products.set_visible(false)
	else:
		$Dialog.set_text("[center]Боюсь у тебя места не зватит для этой одежды.[/center]")


func _on_sixth_product_pressed():
	if Globaldata.all_clothes.size() < Globaldata.max_cloths_in_wardrobe:
		Globaldata.all_clothes.append(6)
		$Dialog.set_text("[center]Что-то ещё?[/center]")
		$Main_menu_tailor.set_visible(true)
		$Products.set_visible(false)
	else:
		$Dialog.set_text("[center]Боюсь у тебя места не зватит для этой одежды.[/center]")


func _on_seventh_product_pressed():
	if Globaldata.all_clothes.size() < Globaldata.max_cloths_in_wardrobe:
		Globaldata.all_clothes.append(7)
		$Dialog.set_text("[center]Что-то ещё?[/center]")
		$Main_menu_tailor.set_visible(true)
		$Products.set_visible(false)
	else:
		$Dialog.set_text("[center]Боюсь у тебя места не зватит для этой одежды.[/center]")



func _on_eighth_product_pressed():
	if Globaldata.all_clothes.size() < Globaldata.max_cloths_in_wardrobe:
		Globaldata.all_clothes.append(8)
		$Dialog.set_text("[center]Что-то ещё?[/center]")
		$Main_menu_tailor.set_visible(true)
		$Products.set_visible(false)
	else:
		$Dialog.set_text("[center]Боюсь у тебя места не зватит для этой одежды.[/center]")
	


func _on_settings_pressed():
	MusicController.stop_play_place_music(true)
	Globaldata.settings_scene = true
	get_tree().root.add_child(preload("res://scen/main_menu.tscn").instantiate())


func _on_first_product_mouse_entered():
	$Dialog.set_text("[center]Костюм горничной.Удобная одежда для уборки дома.[/center]")


func _on_first_product_mouse_exited():
	$Dialog.set_text(old_text_dialog)


func _on_second_product_mouse_entered():
	$Dialog.set_text("[center]Наряд ночной бабочки.Очень вызывающая одежда для <<нужных>> людей.[/center]")


func _on_second_product_mouse_exited():
	$Dialog.set_text(old_text_dialog)


func _on_third_product_mouse_entered():
	$Dialog.set_text("[center]Костюм кухарки.Очень удобная одежда для готовки еды.[/center]")


func _on_third_product_mouse_exited():
	$Dialog.set_text(old_text_dialog)


func _on_fourth_product_mouse_entered():
	$Dialog.set_text("[center]Одеяние мага. Самая обычная одежда, но магические способности она почемму-то повышает.[/center]")


func _on_fourth_product_mouse_exited():
	$Dialog.set_text(old_text_dialog)


func _on_fifth_product_mouse_entered():
	$Dialog.set_text("[center]Одежда медсестры. В некоторые точно поверят что перед ними медсестра.[/center]")


func _on_fifth_product_mouse_exited():
	$Dialog.set_text(old_text_dialog)


func _on_sixth_product_mouse_entered():
	$Dialog.set_text("[center]Боевые доспехи. Самые обычные железные доспехи для война.[/center]")


func _on_sixth_product_mouse_exited():
	$Dialog.set_text(old_text_dialog)


func _on_seventh_product_mouse_entered():
	$Dialog.set_text("[center]Школьная форма. В такой одежде кажется рабам кажется, что у них появиться возможность выкупить себя поэтому учатся усерднее.[/center]")



func _on_seventh_product_mouse_exited():
	$Dialog.set_text(old_text_dialog)


func _on_eighth_product_mouse_entered():
	$Dialog.set_text("[center]Одеяния алхимика. Говорят что в них ходят только ведьмы, но на самом деле они ничем не отличаются от одежды химиков.[/center]")


func _on_eighth_product_mouse_exited():
	$Dialog.set_text(old_text_dialog)
