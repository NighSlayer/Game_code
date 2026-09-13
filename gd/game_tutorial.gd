extends Node

class Slave:
	var submission = 0
	var mood = 0
	var loyality = 0
	var slut = false

var tutorial_slave = Slave.new()

# Глобальные настройки------------
var text_duration = 8
var is_typing = false
var current_tween: Tween
#-------------------------





# Дейтсвия -----------

func _on_talk_pressed() -> void:
	$Actions_container.set_current_tab(1)
	pass # Replace with function body.



# ------------------------

# Диалог -------------------

func _on_next_phrase_pressed() -> void:
	if is_typing:
		end_typing()
	else:
		$Dialog.set_visible(false)
		$Actions_container.set_visible(true)
	pass # Replace with function body.

func end_typing():
	is_typing = false
	current_tween.kill()
	$Dialog/Dialog_text.set_visible_characters(-1)

#---------------------------

# Разговор -----------------

func _on_set_as_slut_pressed() -> void:
	if tutorial_slave.loyality > 3:
		show_dialog("[color=green]Да мой хозяин.[/color]")
		tutorial_slave.slut = true
	else:
		show_dialog("[color=red]А хы ты урод. [font_size=40]Отвали![/font_size][/color]")
		tutorial_slave.mood = -1
	pass # Replace with function body.

func show_dialog(dialog_text):
	if current_tween:
		current_tween.kill()
	
	$Actions_container.set_visible(false)
	$Dialog/Dialog_text.set_visible_characters(0)
	$Dialog/Dialog_text.set_text(dialog_text)
	$Dialog.set_visible(true)
	
	current_tween = create_tween()
	var current_text = $Dialog/Dialog_text.get_parsed_text().length()
	current_tween.tween_property($Dialog/Dialog_text, "visible_characters", current_text, current_text / text_duration)
	is_typing = true
	current_tween.tween_callback(end_typing)

func _on_back_pressed() -> void:
	$Actions_container.set_current_tab(0)
	pass # Replace with function body.

# ------------------------
