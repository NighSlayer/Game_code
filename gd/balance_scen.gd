extends Node2D


func _ready() -> void:
	MainHeroCharacter.main_hero_visible()
	if Globaldata.all_slaves.size() == 0:
		Globaldata.add_slave(class_slave.new())
	Globaldata.training = true
	$Full_slave.set_texture(load(Globaldata.all_slaves[0].img.full))
	


func _on_back_pressed() -> void:
	get_tree().change_scene_to_file("res://scen/main_menu.tscn")
	pass # Replace with function body.


func _on_generate_new_slave_pressed() -> void:
	Globaldata.remove_slave(-1)
	Globaldata.add_slave(class_slave.new())
	$Full_slave.set_texture(load(Globaldata.all_slaves[0].img.full))
	pass # Replace with function body.


func _on_start_button_pressed() -> void:
	$Actions.visible = not $Actions.visible
	$Slaves.visible = not $Slaves.visible
	get_tree().change_scene_to_file("res://scen/slave_check.tscn")
	pass # Replace with function body.


func _on_break_training_pressed() -> void:
	$Actions.visible = not $Actions.visible
	$Slaves.visible = not $Slaves.visible
	pass # Replace with function body.
