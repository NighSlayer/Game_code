extends Node

#region Внутренние классы
class Slave:
	var slave_name:String = "Изабель"
	var submission:int = 0
	var mood:int = 0
	var loyality:int = 0
	var slut:bool = false

#endregion

#region Переменные классов
var tutorial_slave = Slave.new()

#endregion

#region Глобальные настройки
	#region Настройки диалога
var text_duration:int = 8
var is_typing:bool = false
var current_tween:Tween
var current_dialog:Array = []
var current_dialog_phrase:int = 0
	#endregion



	#region Словари диалогов
var dialog_explain_situation:Array[String] = ["Вы объяснете рабыне её положение", "Она пытается смирится с этим","По ней видно что ей тяжело","Вы счастливый уходите"]
var dialog_set_as_slut_agree:Array[String] = ["[color=green]Да мой хозяин.[/color]"]
var dialog_set_as_slut_disagree:Array[String] = ["[color=red]А хы ты урод. [font_size=40]Отвали![/font_size][/color]"]
	#endregion
#endregion

#region Ссылки на узлы
@onready var mood_value: Label = $Status/VerticalContainerforButtons/Mood/Value
@onready var dialog_text_label: RichTextLabel = $Dialog/Text
@onready var slave_name_label: Label = $Status/VerticalContainerforButtons/Slave_name_label

#endregion

#region Встроенные методы
func _ready() -> void:
	$Status.set_visible(false)
#endregion

#region Вспомогательные функции
func set_mood_value(new_text: String):
	mood_value.set_text(new_text)

func set_mood():
	match(tutorial_slave.mood):
		-1:
			set_mood_value("Плохое")
		0:
			set_mood_value("Без настроения")
		1:
			set_mood_value("Хорошее")

func end_typing():
	is_typing = false
	current_tween.kill()
	dialog_text_label.set_visible_characters(-1)

#endregion

#region Основные функции
func update_slave_status():
	slave_name_label.set_text(tutorial_slave.slave_name)
	set_mood()

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

	#endregion

	#region Talk
func _on_set_as_slut_pressed() -> void:
	if tutorial_slave.loyality > 3:
		show_dialog(dialog_set_as_slut_agree[current_dialog_phrase])
		current_dialog = dialog_set_as_slut_agree
		tutorial_slave.slut = true
	else:
		show_dialog(dialog_set_as_slut_disagree[current_dialog_phrase])
		current_dialog = dialog_set_as_slut_disagree
		tutorial_slave.mood = -1

func _on_explain_situation_pressed() -> void:
	show_dialog(dialog_explain_situation[current_dialog_phrase])
	current_dialog = dialog_explain_situation
	tutorial_slave.loyality = +1

func _on_ask_pressed() -> void:
	pass # Replace with function body.

func _on_back_pressed() -> void:
	$Actions_container.set_current_tab(0)
	
	#endregion


func _on_next_phrase_pressed() -> void:
	if is_typing:
		end_typing()
	else:
		update_phrase()
	
#endregion
