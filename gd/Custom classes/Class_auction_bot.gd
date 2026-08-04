extends Node

class_name auction_bot

var bot_names = [ "",
	"Аргор", "Браннор", "Вайрик", "Галадор", "Дракар",
	"Зирелл", "Игар", "Йорган", "Келдор", "Лумарис",
	"Моргрим", "Нарикс", "Оридан", "Пелгор", "Рагнар",
	"Силван", "Тембор", "Ульрик", "Фаррон", "Халдар",
	"Церик", "Юриан", "Эйрен", "Элдрин", "Элронд",
	"Аэлиус", "Белгар", "Каэлан", "Дариус", "Талос",
	"Астарот", "Горвальд", "Кельвар", "Морган", "Торвин",
	"Амарант", "Феликсор", "Волканор", "Галионар", "Драугар",
	"Зефир", "Ледар", "Норвар", "Ориндор", "Пеллеон",
	"Рейвар", "Сильварион", "Торгар", "Уртан", "Фарвар",
	"Харизон", "Церамон", "Эльдар", "Эльрион", "Эриктар"
]

var used_bot_names = []

func update_budget(cost):
	budget -= cost

func update_lot_cost(lot,cost_lot):
	var total = 0
	for j in range(18):
		weights.append(randf())
		total += weights[j]
	
	for i in range(18):
		weights[i] /= total
	var slave_rarity = absf(lot.appearance.beauty - requred_slave.appearance.beauty) * weights[0] \
	+ absf(lot.appearance.endurance - requred_slave.appearance.endurance) * weights[1] \
	+ absf(lot.appearance.softness - requred_slave.appearance.softness) * weights[2] \
	+ absf(lot.appearance.mindness - requred_slave.appearance.mindness) * weights[3] \
	+ absf(lot.appearance.psysique - requred_slave.appearance.psysique) * weights[4] \
	+ absf(lot.appearance.personality - requred_slave.appearance.personality) * weights[5] \
	+ absf(lot.appearance.strength - requred_slave.appearance.strength) * weights[6] \
	+ absf(lot.appearance.agility - requred_slave.appearance.agility) * weights[7] \
	+ absf((lot.boobs.size - 1) % 3 - (requred_slave.boobs.size - 1) % 3) * weights[8] \
	+ absf(int(lot.boobs.lactation) - int(requred_slave.boobs.lactation)) * weights[9] \
	+ absf(int(lot.boobs.piercing) - int(requred_slave.boobs.piercing)) * weights[10] \
	+ absf(int(lot.boobs.modification) - int(requred_slave.boobs.modification)) * weights[11] \
	+ absf(lot.anatomy.age - requred_slave.anatomy.age) * weights[11] \
	+ absf((lot.anatomy.vagina - 1) % 3 - (requred_slave.anatomy.vagina - 1) % 3) * weights[13] \
	+ absf(int(lot.anatomy.vagina_modification) - int(requred_slave.anatomy.vagina_modification)) * weights[14] \
	+ absf(lot.anatomy.anus - requred_slave.anatomy.anus) * weights[15] \
	+ absf(int(lot.anatomy.vagina_piercing) - int(requred_slave.anatomy.vagina_piercing)) * weights[16] \
	+ absf(lot.anatomy.mark - requred_slave.anatomy.mark) * weights[17]
	if slave_rarity > 0.01:
		if budget > cost_lot:
			current_bid = cost_lot * Globaldata.generate_number(10,30) * 0.1 / slave_rarity
			while current_bid > budget:
				current_bid = cost_lot * Globaldata.generate_number(10,30) * 0.1 / slave_rarity
		else:
			current_bid = budget
	else:
		current_bid = budget

func new_lot():
	last_action = 0

func reset_last_action(time_auction):
	last_action = time_auction

var bot_name 
var budget 
var current_bid # Максимальная ставка для текущего лота
var time_reaction  # Время реагирования бота
var last_action 
var requred_slave = (class_slave.new())
var weights = []

func action(time_auction, next_price):
	if time_auction - last_action - Globaldata.generate_number(1,20) * 0.1 > time_reaction:
		if next_price < current_bid:
			match Globaldata.generate_number(1,2):
				1:
					last_action = time_auction
					return true
				2:
					last_action = time_auction
					return false

func _init():
	bot_name = bot_names[Globaldata.generate_number(1,55)]
	used_bot_names.append(bot_name)
	budget = Globaldata.generate_number(500,1000)
	
	time_reaction = Globaldata.generate_number(3,5)
	last_action = 0
