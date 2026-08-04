extends Node2D

var rng = RandomNumberGenerator.new()
var press_map = []
var now_press = 0
var score = 0
var stop_mini_game = false
var final_score = 0
var countdown_start = false

func check_map(map_tile):
	if press_map.size() > now_press:
		if now_press != -1:
			if press_map[now_press] == map_tile:
				match map_tile:
					0:
						$TextureRect/GridContainer/Map_q/TextureRect.set_texture(load("res://GameData/img/Game/Interface/Зелёная галочка.png"))
					1:
						$TextureRect/GridContainer/Map_w/TextureRect.set_texture(load("res://GameData/img/Game/Interface/Зелёная галочка.png"))
					2:
						$TextureRect/GridContainer/Map_e/TextureRect.set_texture(load("res://GameData/img/Game/Interface/Зелёная галочка.png"))
					3:
						$TextureRect/GridContainer/Map_a/TextureRect.set_texture(load("res://GameData/img/Game/Interface/Зелёная галочка.png"))
					4:
						$TextureRect/GridContainer/Map_s/TextureRect.set_texture(load("res://GameData/img/Game/Interface/Зелёная галочка.png"))
					5:
						$TextureRect/GridContainer/Map_d/TextureRect.set_texture(load("res://GameData/img/Game/Interface/Зелёная галочка.png"))
					6:
						$TextureRect/GridContainer/Map_z/TextureRect.set_texture(load("res://GameData/img/Game/Interface/Зелёная галочка.png"))
					7:
						$TextureRect/GridContainer/Map_x/TextureRect.set_texture(load("res://GameData/img/Game/Interface/Зелёная галочка.png"))
					8:
						$TextureRect/GridContainer/Map_c/TextureRect.set_texture(load("res://GameData/img/Game/Interface/Зелёная галочка.png"))
				now_press += 1
				score += 1
				$Score.set_text(str(score))
				MusicController.correct_choose()
			else:
				MusicController.incorrect_choose()
				now_press = -1
				match map_tile:
					0:
						$TextureRect/GridContainer/Map_q/TextureRect.set_texture(load("res://GameData/img/Game/Interface/Крестик.png"))
					1:
						$TextureRect/GridContainer/Map_w/TextureRect.set_texture(load("res://GameData/img/Game/Interface/Крестик.png"))
					2:
						$TextureRect/GridContainer/Map_e/TextureRect.set_texture(load("res://GameData/img/Game/Interface/Крестик.png"))
					3:
						$TextureRect/GridContainer/Map_a/TextureRect.set_texture(load("res://GameData/img/Game/Interface/Крестик.png"))
					4:
						$TextureRect/GridContainer/Map_s/TextureRect.set_texture(load("res://GameData/img/Game/Interface/Крестик.png"))
					5:
						$TextureRect/GridContainer/Map_d/TextureRect.set_texture(load("res://GameData/img/Game/Interface/Крестик.png"))
					6:
						$TextureRect/GridContainer/Map_z/TextureRect.set_texture(load("res://GameData/img/Game/Interface/Крестик.png"))
					7:
						$TextureRect/GridContainer/Map_x/TextureRect.set_texture(load("res://GameData/img/Game/Interface/Крестик.png"))
					8:
						$TextureRect/GridContainer/Map_c/TextureRect.set_texture(load("res://GameData/img/Game/Interface/Крестик.png"))
				$Timer.start(0.5)
	if now_press == press_map.size():
		$Timer.start(0.5)

func draw_map(count_press):
	now_press = 0
	press_map.clear()
	while press_map.size() < count_press:
		rng.randomize()
		var now = rng.randi_range(0,8)
		if now not in press_map:
			press_map.append(now)
	var array_label = ["q","w","e","a","s","d","z","x","c"]
	for j in range(1,count_press):
		for i in range(0,9):
			if i in press_map:
				get_node("TextureRect/GridContainer/Map_" + str(array_label[i]) + "/TextureRect").set_texture(load("res://GameData/img/Game/Interface/Mini-game/Место нажатия.png"))
			else:
				get_node("TextureRect/GridContainer/Map_" + str(array_label[i]) + "/TextureRect").set_texture(null)
	for i in range(0,9):
		get_node("TextureRect/GridContainer/Map_" + str(array_label[i]) + "/Label").set_text("")
	for j in range(0,count_press):
		match press_map[j]:
			0:
				$TextureRect/GridContainer/Map_q/Label.set_text(str(j+1))
			1:
				$TextureRect/GridContainer/Map_w/Label.set_text(str(j+1))
			2:
				$TextureRect/GridContainer/Map_e/Label.set_text(str(j+1))
			3:
				$TextureRect/GridContainer/Map_a/Label.set_text(str(j+1))
			4:
				$TextureRect/GridContainer/Map_s/Label.set_text(str(j+1))
			5:
				$TextureRect/GridContainer/Map_d/Label.set_text(str(j+1))
			6:
				$TextureRect/GridContainer/Map_z/Label.set_text(str(j+1))
			7:
				$TextureRect/GridContainer/Map_x/Label.set_text(str(j+1))
			8:
				$TextureRect/GridContainer/Map_c/Label.set_text(str(j+1))


func _ready():
	$Play_mini_game_time.start(60)
	MainHeroCharacter.main_hero_visible(false)
	set_process(true)
	$Score.set_text(str(score))
	draw_map(2)
	

func _process(delta):
	if stop_mini_game != true:
		if $Play_mini_game_time.get_time_left() < 10 and countdown_start == false:
			$Countdown.play()
			countdown_start = true
		$Time_left.set_text("Оставшееся время:" + str(int($Play_mini_game_time.get_time_left())))
		if Input.is_action_just_pressed("Клавиша Q"):
			check_map(0)
		elif Input.is_action_just_pressed("Клавиша W"):
			check_map(1)
		elif Input.is_action_just_pressed("Клавиша E"):
			check_map(2)
		elif Input.is_action_just_pressed("Клавиша A"):
			check_map(3)
		elif Input.is_action_just_pressed("Клавиша S"):
			check_map(4)
		elif Input.is_action_just_pressed("Клавиша D"):
			check_map(5)
		elif Input.is_action_just_pressed("Клавиша Z"):
			check_map(6)
		elif Input.is_action_just_pressed("Клавиша X"):
			check_map(7)
		elif Input.is_action_just_pressed("Клавиша C"):
			check_map(8)
	else:
		$Final_score.set_visible(true)
		if final_score < score:
			final_score += 1
			$Countdown.set_stream(preload("res://GameData/snd/Game/Mini-game/Counting score.mp3"))
			$Countdown.play()
			$Final_score/VBoxContainer/Label2.set_text(str(final_score))
		else:
			$Countdown.stop()


func _on_timer_timeout():
	if score > 9:
		if score > 50:
			if score > 99:
				draw_map(9)
			else:
				draw_map(5)
		else:
			draw_map(3)
	else:
		draw_map(2)
	


func _on_play_mini_game_time_timeout():
	stop_mini_game = true
