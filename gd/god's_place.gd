extends Node2D

var next = 0

func _on_next_pressed():
	if next == 3:
		get_tree().change_scene_to_file("res://scen/forest.tscn")
		MainHeroCharacter.main_hero_visible()
	if next == 2:
		$Background.set_texture(load("res://GameData/img/Game/Places/Forest/Forest.webp"))
		$History_text.set_text("Вдруг всё тело становиться тяжёлым и вы теряете сознание")
		$Ambient.set_stream(load("res://GameData/snd/Game/Places/God/Приземление на ноги.mp3"))
		next = 3
	if next == 1:
		$Paper_text.set_visible(false)
		$Ambient.set_stream(load("res://GameData/snd/Game/Places/God/Развивающаяся бумага.mp3"))
		$Ambient.play()
		$History_text.set_text("Только прочитав текст лист сдувает ветер и вы словно оказываетесь в непонятном пространстве.")
		$Background.set_texture(load("res://GameData/img/Game/Places/God/Пустота.png"))
		next = 2
	if next == 0:
		$History_text.set_text("Вы медленно подходите к столу. На нём лежит лист бумаги. Вы наклоняетесь ближе, чтобы рассмотреть его, и замечаете текст. Он гласит: \"Он стал рабом своего замысла, и мир, созданный им, отверг своего бога, заковав его в цепи. Ведь каждый выбор и действие несут за собой последствия.\"")
		$Background.set_texture(load("res://GameData/img/Game/Places/God/Стол с бумагой.png"))
		$Paper_text.set_visible(true)
		next = 1
