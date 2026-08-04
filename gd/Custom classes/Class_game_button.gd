@tool
class_name GameButton
extends Button




var audio_player : AudioStreamPlayer
var background_picture : TextureRect


@export_category("Настройки фона клаивиши")
## Путь к картнке которая будет на фоне клавиши.
@export_file("*.png","*.jpg","*.webp") var path_picture : String = "res://GameData/img/Game/Interface/Задний фон для клавишь.jpg":
	set(value):
		path_picture = value
		_setup_background()
@export_category("Настройки текста клавиши")
## Путь к стилю текста на клавише
@export_file("*.ttf") var path_fonts : String = "res://GameData/Fonts/Подпись клавишь.ttf":
	set(value):
		path_fonts = value
		_apply_theme()
## Размер символов
@export var font_size : int = 30:
	set(value):
		font_size = value
		_apply_theme()
@export_category("Настройки эффектов кнопки")
## Возвращает в состояние пользовательское по умолчанию
@export var base_style : bool = false:
	set(value):
		if value:
			_setup_styles()
			value = false


var _updating_size = false

func _notification(what):
	if what == NOTIFICATION_DRAW and not _updating_size:
		_updating_size = true
		if text.length() > 24:
			custom_minimum_size = Vector2(225, 90)
		else:
			custom_minimum_size = Vector2(225, 60)
		_updating_size = false
	if what == NOTIFICATION_READY:
		set_autowrap_mode(2 as TextServer.AutowrapMode)

func _ready():
	pressed.connect(_on_pressed)


func _setup_background():
	if not background_picture:
		background_picture = TextureRect.new()
		add_child(background_picture)
		background_picture.set_draw_behind_parent(true)
		background_picture.set_expand_mode(1 as TextureRect.ExpandMode)
		background_picture.set_anchors_and_offsets_preset(15 as Control.LayoutPreset)
	if path_picture != "" and ResourceLoader.exists(path_picture):
		background_picture.texture = load(path_picture)
	else:
		background_picture.texture = null
	queue_redraw()


func _enter_tree():
	_apply_theme()
	_setup_background()
	_setup_styles()

func _apply_theme():
	add_theme_font_override("font", load(path_fonts))
	add_theme_font_size_override("font_size", font_size)

func _setup_styles():
	add_theme_stylebox_override("normal", StyleBoxEmpty.new())
	add_theme_stylebox_override("focus", StyleBoxEmpty.new())
	add_theme_stylebox_override("hover", StyleBoxEmpty.new())
	add_theme_stylebox_override("pressed", StyleBoxEmpty.new())
	add_theme_stylebox_override("hover_pressed", StyleBoxEmpty.new())
	

func _on_pressed():
	MusicController._sound_button_pressed()
