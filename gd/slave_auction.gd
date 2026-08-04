extends Node2D

var slave_for_sale = []
var now_slave = 0
var bots_auctions = []
var price_slave
var auctions_start = false
var time_auction = 0
var who_buy = null
var step = 0




func display_slave_stats(slave_lot):
	# Грудь
	$Slave_stats/VBoxContainer/Boobs/Image.set_texture(load(slave_lot.int_anatomy_boobs_to_picture()))
	$Slave_stats/VBoxContainer/Boobs/VBoxContainer/Size.set_text(slave_lot.stats_to_string("Размер груди"))
	$Slave_stats/VBoxContainer/Boobs/VBoxContainer/Lactation.set_text(slave_lot.stats_to_string("Лактация"))
	$Slave_stats/VBoxContainer/Boobs/VBoxContainer/Piercing.set_text("Пирсинг: " + slave_lot.stats_to_string("Пирсинг груди"))
	$Slave_stats/VBoxContainer/Boobs/VBoxContainer/Modification.set_text("Модификация: " + slave_lot.stats_to_string("Модификация груди"))
	# Влагалище
	$Slave_stats/VBoxContainer/Pussy/HBoxContainer/Image.set_texture(load(slave_lot.int_anatomy_pussy_to_picture()))
	$Slave_stats/VBoxContainer/Pussy/VBoxContainer/Vagina.set_text("Влагалище: " + slave_lot.stats_to_string("Влагалище"))
	$Slave_stats/VBoxContainer/Pussy/VBoxContainer/Piercing.set_text("Пирсинг: " + slave_lot.stats_to_string("Пирсинг влагалища"))
	$Slave_stats/VBoxContainer/Pussy/VBoxContainer/Modification.set_text("Модификация: " + slave_lot.stats_to_string("Модификация влагалища"))
	# Анус
	$Slave_stats/VBoxContainer/Anus/Image.set_texture(load(slave_lot.int_anatomy_pussy_in_to_picture()))
	$Slave_stats/VBoxContainer/Anus/VBoxContainer/Anus.set_text("Анус: " + slave_lot.stats_to_string("Анус"))
	# Остальные параметры
	$Slave_stats/VBoxContainer/Other_stats/Age.set_text("Возраст: " + slave_lot.stats_to_string("Возраст"))
	$Slave_stats/VBoxContainer/Other_stats/Mark.set_text(slave_lot.stats_to_string("Метка"))
	$Slave_stats/VBoxContainer/Other_stats/Beauty.set_text("Красота: " + slave_lot.stats_to_string("Красота"))
	$Slave_stats/VBoxContainer/Other_stats/Softness.set_text("Чуствительность: " + slave_lot.stats_to_string("Чуствительность"))
	$Slave_stats/VBoxContainer/Other_stats/Mindness.set_text("Сообразительность: " + slave_lot.stats_to_string("Сообразительность"))
	$Slave_stats/VBoxContainer/Other_stats/Physique.set_text("Телосложение: " + slave_lot.stats_to_string("Телосложение"))
	$Slave_stats/VBoxContainer/Other_stats/Personality.set_text("Характер: " + slave_lot.stats_to_string("Характер"))
	$Slave_stats/VBoxContainer/Other_stats/Endurance.set_text("Выносливость: " + slave_lot.stats_to_string("Выносливость"))
	$Slave_stats/VBoxContainer/Other_stats/Strength.set_text("Сила: " + slave_lot.stats_to_string("Сила"))
	$Slave_stats/VBoxContainer/Other_stats/Agility.set_text("Ловкость: " + slave_lot.stats_to_string("Ловкость"))
	

func estimate_price_slave(slave_lot):
	return int(5 * (slave_lot.appearance.beauty + slave_lot.appearance.softness + slave_lot.appearance.mindness + slave_lot.appearance.psysique  + slave_lot.appearance.personality + slave_lot.appearance.endurance + slave_lot.appearance.agility + slave_lot.appearance.strength + ((slave_lot.boobs.size - 1) % 3) + int(slave_lot.boobs.lactation) + int(slave_lot.boobs.piercing) + int(slave_lot.boobs.modification) + slave_lot.anatomy.age + ((slave_lot.anatomy.vagina - 1) % 3) + int(slave_lot.anatomy.vagina_modification) + slave_lot.anatomy.anus + int(slave_lot.anatomy.vagina_piercing) - slave_lot.anatomy.mark)) 

func next_price():
	return price_slave + int(1 + price_slave * 0.10)

func generate_slave_for_sale():
	for i in range(Globaldata.generate_number(3,6)):
		slave_for_sale.append(class_slave.new())

func generate_bots_for_auction():
	for i in range(Globaldata.generate_number(1,3)):
		bots_auctions.append(auction_bot.new())

func update_background():
	match Globaldata.generate_number(1,4):
		1:
			return load("res://GameData/img/Game/Places/Rich_district/Аукционный дом/Сцена/1.jpg")
		2:
			return load("res://GameData/img/Game/Places/Rich_district/Аукционный дом/Сцена/2.png")
		3:
			return load("res://GameData/img/Game/Places/Rich_district/Аукционный дом/Сцена/3.jpeg")
		4:
			return load("res://GameData/img/Game/Places/Rich_district/Аукционный дом/Сцена/4.jpg")

func _ready():
	$Slave_stats.set_visible(false)
	
	if not Globaldata.auctions_ends:
		$Background.set_texture(update_background())
		generate_slave_for_sale()
		generate_bots_for_auction()
		MainHeroCharacter.time_change_visible()
		$Ambient.play()
	else:
		$Dialog.set_text("Сегодняшний аукцион закончился")
		$Actions/Start_auction.set_visible(false)

func _on_start_auction_pressed():
	$Dialog.add_theme_font_override("normal_font", load("res://GameData/Fonts/Аукционист.ttf"))
	$Time_left_lot.set_visible(true)
	$Settings.set_visible(false)
	$Slave_stats.set_visible(true)
	time_auction = 0
	step = 0
	$Actions/Raise.set_visible(true)
	$Actions/Start_auction.set_text("Следующий лот")
	$Lot_time.start(30)
	if now_slave + 1 < slave_for_sale.size():
		$Slave.set_texture(load(slave_for_sale[now_slave].img.full))
		price_slave = estimate_price_slave(slave_for_sale[now_slave])
		$Dialog.set_text("Вот начальная цена лота " + str(price_slave) + "\nКто готов предложить " + str(next_price()))
		display_slave_stats(slave_for_sale[now_slave])
		for bot in bots_auctions:
			bot.new_lot()
			bot.update_lot_cost(slave_for_sale[now_slave],price_slave)
		$Survey_bots.start(0.1)
		now_slave += 1
	else:
		$Dialog.add_theme_font_override("normal_font", load("res://GameData/Fonts/Второстепенные персонажи.ttf"))
		$Lot_time.stop()
		$Survey_bots.stop()
		$Actions/Raise.set_visible(false)
		$Dialog.set_text("На сегодня это всё")
		$Slave.set_texture(load("res://GameData/img/Game/Places/Rich_district/Аукционный дом/Сотрудник аукциона.png"))
		$Actions/Start_auction.set_visible(false)
		$Settings.set_visible(true)


func _on_survey_bots_timeout():
	time_auction += 0.1
	if round((30 - time_auction) * 10) / 10 > 0.1:
		$Time_left_lot.set_text("Время до конца текущего лота\n" + str(round((30 - time_auction) * 10) / 10))
	else:
		$Time_left_lot.set_text("Время до конца текущего лота\n0")
	var reset_bots = false
	for bot in bots_auctions:
			if bot.action(time_auction,next_price()):
				step += 1
				#print(time_auction)
				#print(step)
				price_slave = next_price()
				who_buy = bot
				$Dialog.set_text("Учатсник " + str(bot.bot_name) + " Сделал ставку\n" + "Новая текущая цена " + str(price_slave) + " Кто готов предложить " + str(next_price()))
				reset_bots = true
				$Action.set_stream(load("res://GameData/snd/Game/Slave auction/Удар судьи.mp3"))
				$Action.play()
				break
	if reset_bots:
		for bot in bots_auctions:
			bot.reset_last_action(time_auction)


func _on_raise_pressed():
	$Action.set_stream(load("res://GameData/snd/Game/Slave auction/Удар судьи.mp3"))
	$Action.play()
	price_slave = next_price()
	who_buy = Globaldata.hero
	$Dialog.set_text("Учатсник " + str(Globaldata.hero.name_hero) + " Сделал ставку\n" +"Новая текущая цена " + str(price_slave) + " Кто готов предложить " + str(next_price()))


func _on_lot_time_timeout():
	$Lot_time.stop()
	$Survey_bots.stop()
	$Actions/Raise.set_visible(false)
	$Action.set_stream(load("res://GameData/snd/Game/Slave auction/Звук продано.mp3"))
	$Action.play()
	if who_buy is class_main_character :
		Globaldata.money -= price_slave
		MainHeroCharacter.update_main_hero_money()
		$Dialog.set_text("Лот продан участнику " + who_buy.name + " За " + str(price_slave))
		Globaldata.all_slaves.append(slave_for_sale[now_slave - 1])
	elif who_buy != null:
		bots_auctions[bots_auctions.find(who_buy)].budget -= price_slave
		$Dialog.set_text("Лот продан участнику " + who_buy.bot_name + " За " + str(price_slave))
	else:
		$Dialog.set_text("Жаль что такой хороший товар никому не нужен")
	


func _on_exit_pressed():
	MainHeroCharacter.time_change_visible()
	Globaldata.auctions_ends = true
	get_tree().change_scene_to_file("res://scen/auction_house.tscn")
