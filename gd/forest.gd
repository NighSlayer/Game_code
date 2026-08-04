extends Node2D

var page_text = 1
var path = 0

func _ready() -> void:
	$Background.set_visible(true)
	$NPC.set_visible(false)
	$NPC2.set_visible(false)
	$Dialog_window.set_visible(true)
	$Choose_window.set_visible(false)
	

func _on_button_pressed() -> void:
	
	match(page_text):
		1:
			$NPC.set_visible(true)
			$AnimationPlayer.play("Patrol")
			$Dialog_window/RichTextLabel.set_text("Увидев что вы очнулись один из патрульных подходит к вам.")
		2:
			$AnimationPlayer.stop()
			$NPC.set_size(Vector2(400,1711.152))
			$Dialog_window/RichTextLabel.set_text("Что вы здесь делаете?")
		3:
			$Dialog_window/RichTextLabel.set_text("(Нажниме на нужный вариант ответа)")
			$Dialog_window/Button.set_visible(false)
			$Choose_window.set_visible(true)
		4:
			$Dialog_window/Button.set_visible(true)
			$Dialog_window/RichTextLabel.set_text("Ничего не понял.[font_size=15]Подождитека,у него на руке нет метки и непонятная для меня речь[/font_size].Пройдёмте.")
			$Choose_window.set_visible(false)
		5:
			$SoundEffect.play()
			$Dialog_window/RichTextLabel.set_text("Надев на вас наручники, он встал сзади ,уперев меч в спину начал вас толкать вперёд.")
			$Choose_window.set_visible(false)
		6:
			$SoundEffect.stop()
			$SoundEffect.set_stream(load("res://GameData/snd/Game/Шаги.mp3"))
			$SoundEffect.play()
			$Background.set_texture(load("res://GameData/img/Game/Places/Suburb_district/Пригород.png"))
			$Background.set_size(Vector2(1920,1080))
			$Dialog_window/RichTextLabel.set_text("Выйдя из леса и пройдя некоторое время вы оказываетесь в пригороде некоторого города.")
		7:
			$SoundEffect.stop()
			$SoundEffect.play()
			$Background.set_texture(load("res://GameData/img/Game/Places/Slum_district/Трущобы.jpg"))
			$Background.set_size(Vector2(1920,1080))
			$Dialog_window/RichTextLabel.set_text("Пройдя огромные ворота вы оказыветесь в трущобах.")
		8:
			$SoundEffect.stop()
			$SoundEffect.play()
			$Background.set_texture(load("res://GameData/img/Game/Places/Poor_district/Бедный район.jpg"))
			$Background.set_size(Vector2(1920,1080))
			$Dialog_window/RichTextLabel.set_text("Двигаясь дальше по городу внешний вид улиц поменялся и вы оказались в бедном районе.")
		9:
			$SoundEffect.stop()
			if randf() >= 0.5:
				$SoundEffect.set_stream(load("res://GameData/snd/Game/Дверь с шагами.ogg"))
				$SoundEffect.play()
				$Background.set_texture(load("res://GameData/img/Game/Places/Poor_district/Клановый дом Чёрная грязь/Чёрная грязь.jpg"))
				$Background.set_size(Vector2(1920,1080))
				$Dialog_window/RichTextLabel.set_text("Зайдя в здание один из патрульных оставляет вас у дверей,а сам подходит к важно сидящему человеку в конце комнаты.")
				Globaldata.clan_debt = "Чёрная грязь"
			else:
				$SoundEffect.set_stream(load("res://GameData/snd/Game/Шаги.mp3"))
				$SoundEffect.play()
				$Background.set_texture(load("res://GameData/img/Game/Places/Buisness_district/Деловой район.png"))
				$Background.set_size(Vector2(1920,1080))
				$Dialog_window/RichTextLabel.set_text("Пройдя непрятно выглядищие районы вы оказыветесь в деловом районе.")
				page_text +=.1
		10.1:
			$SoundEffect.stop()
			$SoundEffect.play()
			$Background.set_texture(load("res://GameData/img/Game/Places/Merchant_district/Купеческий район.jpg"))
			$Background.set_size(Vector2(1920,1080))
			$Dialog_window/RichTextLabel.set_text("Пройдя деловой район вы попадаете в купеческий район, район где деньги меняют владельца чаще чем товары покупаемые за эти деньги.")
		11.1:
			$SoundEffect.stop()
			if randf() >= 0.5:
				$SoundEffect.set_stream(load("res://GameData/snd/Game/Дверь с шагами.ogg"))
				$SoundEffect.play()
				$Background.set_texture(load("res://GameData/img/Game/Places/Merchant_district/Клановый дом Железный опор/Железный опор.jpg"))
				$Background.set_size(Vector2(1920,1080))
				$Dialog_window/RichTextLabel.set_text("Зайдя в здание один из патрульных оставляет вас у дверей,а сам подходит к важно сидящему человеку в конце комнаты.")
				Globaldata.clan_debt = "Железная опора"
				page_text = 9
			else:
				$SoundEffect.set_stream(load("res://GameData/snd/Game/Шаги.mp3"))
				$SoundEffect.play()
				$Background.set_texture(load("res://GameData/img/Game/Places/Rich_district/Богатый район.png"))
				$Background.set_size(Vector2(1920,1080))
				$Dialog_window/RichTextLabel.set_text("Пройдя ещё район вы оказались в богатом районе.")
				page_text +=.1
		12.2:
			$SoundEffect.set_stream(load("res://GameData/snd/Game/Шаги.mp3"))
			$SoundEffect.play()
			$Background.set_texture(load("res://GameData/img/Game/Places/Elite_district/Элитный район.png"))
			$Background.set_size(Vector2(1920,1080))
			$Dialog_window/RichTextLabel.set_text("Пройдя как вам казалось красивый район вы оказались в элитном районе выглядящем идельно по сравнению с остальными домами и дорогами города.")
		13.2:
			$SoundEffect.set_stream(load("res://GameData/snd/Game/Дверь с шагами.ogg"))
			$SoundEffect.play()
			$Background.set_texture(load("res://GameData/img/Game/Places/Elite_district/Клановый дом Золотой рай/Золотой рай.jpg"))
			$Background.set_size(Vector2(1920,1080))
			$Dialog_window/RichTextLabel.set_text("Зайдя в здание один из патрульных оставляет вас у дверей,а сам подходит к важно сидящему человеку в конце комнаты.")
			Globaldata.clan_debt = "Золотой рай"
			page_text = 9
		10:
			$SoundEffect.set_stream(load("res://GameData/snd/Game/Шаги.mp3"))
			$SoundEffect.play()
			$Background.set_size(Vector2(1920,1080))
			$Dialog_window/RichTextLabel.set_text("Постояв некоторое время из другого конца комнаты слышится:Веди его сюда!.")
		11:
			$SoundEffect.stop()
			$Dialog_window/RichTextLabel.set_text("Подойдя к важнй персоне патрульных хватает вас за руку и показывает её.")
		12:
			$Dialog_window/RichTextLabel.set_text("На лице смотрящего человека было недоумение.Идиоты у него есть метка.Освободите его и валите отсюда.")
		13:
			$SoundEffect.set_stream(load("res://GameData/snd/Game/Places/Forest/Надевание наручников.ogg"))
			$SoundEffect.play()
			$Dialog_window/RichTextLabel.set_text("Сняв с вас наручники патрульные ушли в страхе.")
		14:
			$SoundEffect.stop()
			if Globaldata.clan_debt == "Чёрная грязь":
				$NPC.set_texture(load("res://GameData/img/Game/Places/Poor_district/Клановый дом Чёрная грязь/Глава дома.png"))
				$NPC.set_size(Vector2(1000,800))
				$NPC.set_position(Vector2(472,122))
				$Dialog_window/RichTextLabel.set_text("Меня зовут " + Globaldata.name_head_bang_black_mud +". Извини за неудобства, давай в качестве извенений я тебе выдам домик на окрайне с несколькими рабынями.")
				
			if Globaldata.clan_debt == "Железная опора":
				$NPC.set_texture(load("res://GameData/img/Game/Places/Merchant_district/Клановый дом Железный опор/Глава дома.png"))
				$NPC.set_size(Vector2(1000,800))
				$NPC.set_position(Vector2(472,122))
				$Dialog_window/RichTextLabel.set_text("Меня зовут " + Globaldata.name_head_bang_iron_pillar +". Извини за неудобства, давай в качестве извенений я тебе выдам домик на окрайне с несколькими рабынями.")
				
			if Globaldata.clan_debt == "Золотой рай":
				$NPC.set_texture(load("res://GameData/img/Game/Places/Elite_district/Клановый дом Золотой рай/Глава дома.png"))
				$NPC.set_size(Vector2(1000,800))
				$NPC.set_position(Vector2(472,122))
				$Dialog_window/RichTextLabel.set_text("Меня зовут " + Globaldata.name_head_bang_golden_paradise +". Извини за неудобства, давай в качестве извенений я тебе выдам домик на окрайне с несколькими рабынями.")
		15:
			$Dialog_window/RichTextLabel.set_text("Взявь листок и написав на нём что-то он с грохотом поставил печать.")
		16:
			$Dialog_window/Button.set_visible(false)
			$Dialog_window/RichTextLabel.set_text("Скрутив он вытянул руку.")
			for button in $Choose_window/VBoxContainer.get_children():
				button.set_text("Взять бумагу")
				button.mouse_entered.connect(_on_mouse_enter)
			$Choose_window.set_visible(true)
			$Dialog_window/RichTextLabel.set_text("(Нажниме на нужный вариант ответа)")
		17:
			$Dialog_window/Button.set_visible(true)
			$Choose_window.set_visible(false)
			for button in $Choose_window/VBoxContainer.get_children():
				button.mouse_entered.disconnect(_on_mouse_enter)
			$Dialog_window/RichTextLabel.set_text("[color=red]НО УЧТИ[/color] я не отдам тебе их просто так.Ты должен будешь выплатить за них " + str(Globaldata.debt) + " кредов")
		18:
			$Dialog_window/Button.set_visible(false)
			$Choose_window.set_visible(true)
			$Dialog_window/RichTextLabel.set_text("(Нажниме на нужный вариант ответа)")
		19:
			$SoundEffect.set_stream(load("res://GameData/snd/Game/Дверь с шагами.ogg"))
			$SoundEffect.play()
			$Dialog_window/Button.set_visible(true)
			$Choose_window.set_visible(false)
			$NPC.set_texture(load("res://GameData/img/Game/Places/Forest/Охраник.png"))
			$NPC.set_size(Vector2(600,2367.816))
			$NPC.set_position(Vector2(672,-300))
			$Background.set_texture(load("res://GameData/img/Game/Places/Home/Interiors/Living rooms/Living room 4.jpg"))
			$Dialog_window/RichTextLabel.set_text("Зайдя в дом ,выданный вам, вы видите охранка который подорвался и направил на вас копьё")
		20:
			$SoundEffect.stop()
			$Dialog_window/Button.set_visible(false)
			$Choose_window.set_visible(true)
			for button in $Choose_window/VBoxContainer.get_children():
				button.set_text("Показать документ")
			$NPC.set_texture(load("res://GameData/img/Game/Places/Forest/Охраник.png"))
			$Dialog_window/RichTextLabel.set_text("(Нажниме на нужный вариант ответа)")
		21:
			$SoundEffect.set_stream(load("res://GameData/snd/Game/Дверь.mp3"))
			$SoundEffect.play()
			$Dialog_window/Button.set_visible(true)
			$Choose_window.set_visible(false)
			$NPC.set_visible(false)
			$Dialog_window/RichTextLabel.set_text("Забрав и прочав документ охранник с радостным выражением лица уходит из дома")
		22:
			$SoundEffect.stop()
			$Dialog_window/Button.set_visible(true)
			$Choose_window.set_visible(false)
			Globaldata.all_slaves.append(class_slave.new())
			Globaldata.all_slaves.append(class_slave.new())
			$Dialog_window/RichTextLabel.set_text("На шум дверей выглянула одна из рабынь.Увидев что охранник ушёл она решилась подойти к вам.")
		23:
			$SoundEffect.set_stream(load("res://GameData/snd/Game/Шаги.mp3"))
			$SoundEffect.play()
			$Dialog_window/Button.set_visible(true)
			$Choose_window.set_visible(false)
			$NPC.set_texture(load(Globaldata.all_slaves[0].img.full))
			$NPC.set_visible(true)
			$NPC.set_size(Vector2(800,2367.816))
			$NPC.set_position(Vector2(565,-586))
			$Dialog_window/RichTextLabel.set_text("[font_size=15]Вы наш новый охранник?[/font_size]")
		24:
			$SoundEffect.stop()
			$Dialog_window/Button.set_visible(false)
			$Choose_window.set_visible(true)
			for button in $Choose_window/VBoxContainer.get_children():
				button.set_text("Нет")
			$Dialog_window/RichTextLabel.set_text("(Нажниме на нужный вариант ответа)")
		25:
			$Dialog_window/Button.set_visible(true)
			$Choose_window.set_visible(false)
			$Dialog_window/RichTextLabel.set_text("Значит вы нам поможите?")
		26:
			$Dialog_window/Button.set_visible(false)
			$Choose_window.set_visible(true)
			for button in $Choose_window/VBoxContainer.get_children():
				button.set_text("Мне бы кто помог")
			$Dialog_window/RichTextLabel.set_text("(Нажниме на нужный вариант ответа)")
		27:
			$Dialog_window/Button.set_visible(true)
			$Choose_window.set_visible(false)
			$Dialog_window/RichTextLabel.set_text("Скажите мне, может я вам помогу господин.")
		28:
			$Dialog_window/Button.set_visible(false)
			$Choose_window.set_visible(true)
			$Choose_window/VBoxContainer/Option_1.set_text("Что происходит?")
			$Choose_window/VBoxContainer/Option_2.set_text("Где я?")
			$Choose_window/VBoxContainer/Option_3.set_text("Подожди ты меня понимаешь?")
			$Choose_window/VBoxContainer/Option_1.pressed.connect(path_one.bind(1))
			$Choose_window/VBoxContainer/Option_2.pressed.connect(path_one.bind(2))
			$Choose_window/VBoxContainer/Option_3.pressed.connect(path_one.bind(3))
			$Dialog_window/RichTextLabel.set_text("(Нажниме на нужный вариант ответа)")
		29:
			$Dialog_window/Button.set_visible(true)
			$Choose_window.set_visible(false)
			$Dialog_window/RichTextLabel.set_text("[font_size=15]Когда лес извергнёт мужчину с меткой, он даст вам право выбрать — служить, бежать… или боротся.[/font_size]Неужели вы тот самый человек из пророчества?.")
		30:
			$Dialog_window/Button.set_visible(false)
			$Choose_window.set_visible(true)
			$Choose_window/VBoxContainer/Option_1.set_text("Я не думаю.")
			$Choose_window/VBoxContainer/Option_2.set_text("Да это я")
			$Choose_window/VBoxContainer/Option_3.set_text("Ты не ответила на мой вопрос")
			$Choose_window/VBoxContainer/Option_1.pressed.disconnect(path_one)
			$Choose_window/VBoxContainer/Option_2.pressed.disconnect(path_one)
			$Choose_window/VBoxContainer/Option_3.pressed.disconnect(path_one)
			$Choose_window/VBoxContainer/Option_1.pressed.connect(path_two.bind(1))
			$Choose_window/VBoxContainer/Option_2.pressed.connect(path_two.bind(1))
			$Choose_window/VBoxContainer/Option_3.pressed.connect(path_two.bind(1))
			$Dialog_window/RichTextLabel.set_text("(Нажниме на нужный вариант ответа)")
		31:
			$Dialog_window/Button.set_visible(true)
			$Choose_window.set_visible(false)
			match path:
				1:
					$Dialog_window/RichTextLabel.set_text("Схватив вас за руку она посмотрела тыльную сторону вашей ладони.[font_size=15]Нет, не может быть, нет,нет,нет,нет.Он должен был быть тем самым.[/font_size]Она рухнул на колени, раскинув их в стороны, будто земля ушла из-под ног — единственный лучик который промелькнул оказался ложным")
					$SoundEffect.set_stream(load("res://GameData/snd/Game/Slaves/Плач "+ str(Globaldata.generate_number(1,3)) +".mp3"))
					$SoundEffect.play()
				2:
					$Dialog_window/RichTextLabel.set_text("Схватив вас за руку она посмотрела тыльную сторону вашей ладони.[font_size=15]Неужели, свершилось, пророчество было правдой.[/font_size]Держа вас за руку она упала на колени и начала плакать.")
					$SoundEffect.set_stream(load("res://GameData/snd/Game/Slaves/Плач "+ str(Globaldata.generate_number(1,3)) +".mp3"))
					$SoundEffect.play()
				3:
					$Dialog_window/RichTextLabel.set_text("Проигнорировав ваши слова она схватила вас за руку и посмотрела тыльную сторону вашей ладони.[font_size=15]Видимо всё-таки миф, были права" + Globaldata.all_slaves[1] + ".[/font_size]")
		32:
			$SoundEffect.stop()
			match path:
				2:
					$Dialog_window/RichTextLabel.set_text("Меня зовут "+ str(Globaldata.all_slaves[0].slave_name) +". Вы попали в другой мир. Никто не знает, попало ли сюда ваше тело из родного мира, переселился ли только ваш разум в новую оболочку — или вы вообще клон самого себя. Единственное, что важно: никогда не раскрывайте своё происхождение. Иначе вас казнят. Вы понимаете меня, потому что для этого места мы пришли из одного и того же мира — и наша речь для нас обоих естественна. Но для местных вы говорите на непонятном языке. Сейчас я позову подругу — она проведёт ритуал, после которого вы сможете говорить и понимать язык этого мира. "+ Globaldata.all_slaves[1].slave_name +", иди сюда!")
				1,3:
					$Dialog_window/RichTextLabel.set_text("Меня зовут "+ str(Globaldata.all_slaves[0].slave_name) +". Вы находитесь в городе Элисия — главном месте торговлей рабынями из другого мира, таких как я.Поэтому господин прошу не издевайтесь над нами, мы не по своей воле попали сюда.Я сейчас позову другую рабыню которая здесь есть. " + Globaldata.all_slaves[1].slave_name + " иди сюда")
		33:
			$NPC.set_size(Vector2(800,2367.816))
			$NPC.set_position(Vector2(265,-586))
			$NPC2.set_texture(load(Globaldata.all_slaves[1].img.full))
			$NPC2.set_visible(true)
			$NPC2.set_size(Vector2(800,2367.816))
			$NPC2.set_position(Vector2(865,-586))
			$Dialog_window/RichTextLabel.set_text("Придя к вам она замечает что вы как-то взволновано говорите и применяет к вам непонятное для вас заклинание.")
			$AnimationPlayer.play("Magic")
		34:
			$AnimationPlayer.stop()
			$Dialog_window/RichTextLabel.set_text(str(Globaldata.all_slaves[1].slave_name) + ": Это он!\nДругая рабыня приближившись к уху "  + str(Globaldata.all_slaves[1].slave_name) + " говорит.[font_size=15]У него есть местка.Это вряд ли он[/font_size].\n" + str(Globaldata.all_slaves[1].slave_name) + ":[font_size=15]Его метка засветилась, так она себя ведёт только у избранного[/font_size]")
		35:
			match path:
				1:
					$Dialog_window/RichTextLabel.set_text("Отлично теперь вы понимаете местный язык. Сюда по вссему вы только попали в этот мир ... как вас зовут наш мессия?")
				2:
					$Dialog_window/RichTextLabel.set_text("Отлично теперь вы понимаете местный язык. Никто не знает, попало ли сюда ваше тело из родного мира, переселился ли только ваш разум в новую оболочку — или вы вообще клон самого себя. Единственное, что важно: никогда не раскрывайте своё происхождение. Иначе вас казнят. Вы понимаете меня, потому что для этого места мы пришли из одного и того же мира — и наша речь для нас обоих естественна. Но для местных вы говорите на непонятном языке. Как я вам и говорила Элисия — центр торговли рабами из друго мира поэтому логичный вариант это торговля рабами, но и другими вариантами тоже можно заработать денег. Как нам к вам обращаться наш мессия?")
		36:
			$Dialog_window/Button.set_visible(false)
			$Choose_window.set_visible(true)
			$Choose_window/VBoxContainer/Option_1.set_text(str(Globaldata.hero.name_hero))
			$Choose_window/VBoxContainer/Option_2.set_text(str(Globaldata.hero.name_hero))
			$Choose_window/VBoxContainer/Option_3.set_text(str(Globaldata.hero.name_hero))
			$Choose_window/VBoxContainer/Option_1.pressed.disconnect(path_two)
			$Choose_window/VBoxContainer/Option_2.pressed.disconnect(path_two)
			$Choose_window/VBoxContainer/Option_3.pressed.disconnect(path_two)
			$Dialog_window/RichTextLabel.set_text("(Нажниме на нужный вариант ответа)")
		37:
			$Dialog_window/Button.set_visible(true)
			$Choose_window.set_visible(false)
			$Dialog_window/RichTextLabel.set_text("Благодарю мессия. Мы тогда пойдём в свою комнату если мы будем нужны зовите нас")
		38:
			get_tree().change_scene_to_file("res://scen/home.tscn")
	page_text +=1

func path_one(choosen_path):
	if choosen_path == 3:
		path = 2
	page_text = 29
	_on_button_pressed()

func path_two(choosen_path):
	match(choosen_path):
		1:
			if path == 2:
				Globaldata.all_slaves[0].condition.fear += 1
				
			else:
				Globaldata.all_slaves[0].condition.despair += 1
				path = 1
		2:
			Globaldata.all_slaves[0].condition.loyalty += 1
			
			path = 2
		3:
			if path == 2:
				Globaldata.all_slaves[0].condition.fear += 1
			else:
				Globaldata.all_slaves[0].condition.fear += 1
				path = 3
	page_text = 31
	_on_button_pressed()

func path_three():
	
	_on_button_pressed()

func _on_mouse_enter():
	_on_button_pressed()
