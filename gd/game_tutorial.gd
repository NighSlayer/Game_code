extends Node

#region Внутренние классы
class Slave:
	var slave_name: String = "Изабель"
	
	#region Подчинение
	## Подчинение
	var submission: int = 0
	## Минимальное значение подчинения
	var min_submission: int = -25
	## Максимальное значение подчинения
	var max_submission: int = 25
	#endregion
	
	#region Настроение
	## Настроение
	var mood: int = 0
	#endregion
	
	#region Преданность
	## Преданность
	var loyality: int = 0
	## Минимальное значение преданности
	var min_loyality: int = -25
	## Максимальное значение преданности
	var max_loyality: int = 25
	#endregion
	
	#region Страх
	## Страх
	var fear: int = 0
	## Минимальное значение страха
	var min_fear: int = 0
	## Максимальное значение страха
	var max_fear: int = 15
	#endregion
	
	## Быть шлюхой
	var slut: bool = false
	## Количество попыток успокоить рабыню
	var calm_down_times: int = 0
	## Количество попыток объяснить положение рабыни
	var explain_situation_times: int = 0
	## Количество попыток повлиять на страх
	var threaten_and_appease_times: int = 0
	

#endregion

#region Переменные классов
var tutorial_slave = Slave.new()

#endregion

#region Глобальные настройки
	#region Настройки диалога
var text_duration: int = 8
var is_typing: bool = false
var current_tween: Tween
var current_dialog: Array[String] = []
var current_dialog_phrase: int = 0

	#endregion



	#region Словари диалогов
## Диалог приказания стать шлюхой положительный результат
var dialog_set_as_slut_agree: Array[String] = ["[color=green]Да мой хозяин.[/color]"]
## Диалог приказания стать шлюхой отрицательный результат
var dialog_set_as_slut_disagree: Array[String] = ["[color=red]А хы ты урод. [font_size=40]Отвали![/font_size][/color]"]
## Диалог обяснения положения рабыни положительный результат
var dialog_explain_situation: Array[String] = ["Вы объяснете рабыне её положение", "Она пытается смирится с этим"]
## Диалог обяснения положения рабыни слишком большое количество раз
var dialog_explain_situation_many_times: Array[String] = ["Вы объяснете рабыне её положение", "На сегодня она усвоила этот урок"]
## Диалог попытки успокоить рабыню положительный результат
var dialog_calm_down_positive: Array[String] = ["Вы пытаетесь утешить рабыню", "Она вроде как успокоилась"]
## Диалог попытки успокоить рабыню отрицательный результат
var dialog_calm_down_negative: Array[String] = ["Вы пытаетесь утешить рабыню", "Она не собирается успокаиваться"]
## Диалог попытки успокоить рабыню слишком большое количество раз
var dialog_calm_down_many_times: Array[String] = ["Вы пытаетесь утешить рабыню", "Но она вам не верит"]
## Диалог угрозы рабыне
var dialog_threaten: Array[String] = ["Вы пригрозили рабыне", "Это её напугало"]
## Диалог похвалы рабыне
var dialog_appease: Array[String] = ["Вы успокаиваете рабыню", "Это её немного успокоило"]
## Диалог слишкой частой похвалы или запугивания
var dialog_threaten_and_appease_many_times: Array[String] = ["Ваши слова не влияют на её состояние"]
	#endregion
#endregion

#region Ссылки на узлы
@onready var slave_name_label: Label = $Status/VerticalContainerforButtons/Slave_name_label
@onready var mood_value: Label = $Status/VerticalContainerforButtons/Mood/Value
@onready var loyality_value: Label = $Status/VerticalContainerforButtons/Loyality/Value
@onready var submission_value: Label = $Status/VerticalContainerforButtons/Submission/Value
@onready var fear_value: Label = $Status/VerticalContainerforButtons/Fear/Value
@onready var dialog_text_label: RichTextLabel = $Dialog/Text



#endregion

#region Встроенные методы
func _ready() -> void:
	$Status.set_visible(false)
#endregion

#region Вспомогательные функции
func end_typing():
	is_typing = false
	current_tween.kill()
	dialog_text_label.set_visible_characters(-1)

func get_phase_status(now_value: int, min_value: int, max_value: int, phase_count: int):
	if (max_value - min_value) % phase_count == 0:
		var phase_size = (max_value - min_value) / phase_count
	else:
		push_error("Размер фазы не является цемым числом. Измените границы или колиество фаз ")
	pass

func set_mood_value(new_mood: String):
	mood_value.set_text(new_mood)

func set_loyality_value(new_loyality: String):
	loyality_value.set_text(new_loyality)

func set_submission_value(new_submission: String):
	submission_value.set_text(new_submission)

func set_fear_value(new_fear: String):
	fear_value.set_text(new_fear)

func set_mood():
	match(tutorial_slave.mood):
		-2:
			set_mood_value("Ужасное")
		-1:
			set_mood_value("Плохое")
		0:
			set_mood_value("Без настроения")
		1:
			set_mood_value("Хорошее")
		2:
			set_mood_value("Отличное")

func set_loyality():
	clampi(tutorial_slave.loyality, tutorial_slave.min_loyality, tutorial_slave.max_loyality)
	if tutorial_slave.loyality < -20:
		set_loyality_value("Предаст по возможности")
	elif tutorial_slave.loyality < -10:
		set_loyality_value("Готова подставить")
	elif tutorial_slave.loyality > -10 and tutorial_slave.loyality < 10:
		set_loyality_value("Не готова прикрывать")
	elif tutorial_slave.loyality > 10:
		set_loyality_value("Может прикрыть")
	elif tutorial_slave.loyality > 20:
		set_loyality_value("Готова заслонить собой")
			

func set_submission():
	clampi(tutorial_slave.submission, tutorial_slave.min_submission, tutorial_slave.max_submission)
	if tutorial_slave.submission < -20:
		set_submission_value("Своевольна")
	elif tutorial_slave.submission < -10:
		set_submission_value("Непослушна")
	elif tutorial_slave.submission > -10 and tutorial_slave.submission < 10:
		set_submission_value("Воспринимает приказы")
	elif tutorial_slave.submission > 10:
		set_submission_value("Послушание")
	elif tutorial_slave.submission > 20:
		set_submission_value("Полное послушание")

func set_fear():
	clampi(tutorial_slave.loyality, tutorial_slave.min_loyality, tutorial_slave.max_loyality)
	if tutorial_slave.fear < 5:
		set_fear_value("Спокойна")
	elif tutorial_slave.fear > 5:
		set_fear_value("Напугана")
	elif tutorial_slave.fear > 10:
		set_fear_value("В ужасе")

#endregion

#region Основные функции
func update_slave_status():
	slave_name_label.set_text(tutorial_slave.slave_name)
	set_mood()
	set_loyality()
	set_submission()
	set_fear()
	$Status.set_visible(!$Status.is_visible())

func show_dialog(dialog_text: String):
	
	if current_tween:
		current_tween.kill()
	
	$Actions_container.set_visible(false)
	dialog_text_label.set_visible_characters(0)
	dialog_text_label.set_text(dialog_text)
	$Dialog.set_visible(true)
	
	current_tween = create_tween()
	var current_text = dialog_text_label.get_parsed_text().length()
	current_tween.tween_property(dialog_text_label, "visible_characters", current_text, current_text / text_duration)
	is_typing = true
	current_tween.tween_callback(end_typing)

func update_phrase():
	current_dialog_phrase += 1
	if current_dialog_phrase < current_dialog.size():
		show_dialog(current_dialog[current_dialog_phrase])
	else:
		$Dialog.set_visible(false)
		$Actions_container.set_visible(true)
		current_dialog_phrase = 0
	
	pass

#endregion 

#region Сигналы
	#region Actions
func _on_status_pressed() -> void:
	update_slave_status()
	

func _on_talk_pressed() -> void:
	$Actions_container.set_current_tab(1)

func _on_order_pressed() -> void:
	pass # Replace with function body.

func _on_threaten_pressed() -> void:
	if tutorial_slave.threaten_and_appease_times < 4:
		tutorial_slave.fear += 1
		tutorial_slave.mood -= 1
		show_dialog(dialog_threaten[current_dialog_phrase])
		current_dialog = dialog_threaten

func _on_appease_pressed() -> void:
	if tutorial_slave.threaten_and_appease_times < 4:
		if tutorial_slave.fear > 0:
			tutorial_slave.fear -= 1
		if tutorial_slave.mood > -2:
			tutorial_slave.mood -= 1
		show_dialog(dialog_appease[current_dialog_phrase])
		current_dialog = dialog_appease

	#endregion

	#region Talk
func _on_set_as_slut_pressed() -> void:
	if tutorial_slave.loyality >= 10 and tutorial_slave.mood >= 2:
		show_dialog(dialog_set_as_slut_agree[current_dialog_phrase])
		current_dialog = dialog_set_as_slut_agree
		tutorial_slave.slut = true
	elif tutorial_slave.loyality > 20:
		show_dialog(dialog_set_as_slut_agree[current_dialog_phrase])
		current_dialog = dialog_set_as_slut_agree
		tutorial_slave.slut = true
	else:
		show_dialog(dialog_set_as_slut_disagree[current_dialog_phrase])
		current_dialog = dialog_set_as_slut_disagree
		tutorial_slave.mood -= 1

func _on_explain_situation_pressed() -> void:
	if tutorial_slave.explain_situation_times < 1:
		show_dialog(dialog_explain_situation[current_dialog_phrase])
		current_dialog = dialog_explain_situation
		tutorial_slave.submission += 1
	else:
		show_dialog(dialog_explain_situation_many_times[current_dialog_phrase])
		current_dialog = dialog_explain_situation_many_times

func _on_ask_pressed() -> void:
	pass # Replace with function body.

func _on_calm_down_pressed() -> void:
	if tutorial_slave.mood < 0 and tutorial_slave.calm_down_times < 2:
		show_dialog(dialog_calm_down_positive[current_dialog_phrase])
		tutorial_slave.calm_down_times += 1
		tutorial_slave.mood = 0
	else:
		show_dialog(dialog_calm_down_many_times[current_dialog_phrase])
		current_dialog = dialog_calm_down_many_times

func _on_back_pressed() -> void:
	$Actions_container.set_current_tab(0)
	
	#endregion

func _on_actions_container_tab_changed(tab: int) -> void:
	$Status.set_visible(false)

func _on_next_phrase_pressed() -> void:
	if is_typing:
		end_typing()
	else:
		update_phrase()
	
#endregion
