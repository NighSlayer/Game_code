extends Node2D

var emploee = 0
var slave_range = 6

var rng = RandomNumberGenerator.new()
static var can_sale_vegetables = true
static var can_sale_flour_and_cereals = true
static var can_sale_cheese = true
static var can_sale_butter = true
static var can_sale_eggs = true
static var can_sale_milk = true
static var can_sale_cream = true
static var can_sale_meat_frash = true
static var can_sale_human_meat = true
# Автозакупка магазина
static var autobuy_vegetables = false
static var autobuy_flour_and_cereals = false
static var autobuy_cheese = false
static var autobuy_butter = false
static var autobuy_eggs = false
static var autobuy_milk = false
static var autobuy_cream = false
static var autobuy_meat_frash = false
static var autobuy_human_meat = false
var client_nof_find_product = 0


func _ready():
	$Rules/Choose_for_sale/Products1/VBoxContainer/Vegetables.set_pressed(can_sale_vegetables)
	$Rules/Choose_for_sale/Products1/VBoxContainer/Flour_and_cereals.set_pressed(can_sale_flour_and_cereals)
	$Rules/Choose_for_sale/Products1/VBoxContainer/Cheese.set_pressed(can_sale_cheese)
	$Rules/Choose_for_sale/Products1/VBoxContainer/Butter.set_pressed(can_sale_butter)
	$Rules/Choose_for_sale/Products1/VBoxContainer/Eggs.set_pressed(can_sale_eggs)
	$Rules/Choose_for_sale/Products1/VBoxContainer/Milk.set_pressed(can_sale_milk)
	$Rules/Choose_for_sale/Products2/VBoxContainer/Cream.set_pressed(can_sale_cream)
	$Rules/Choose_for_sale/Products2/VBoxContainer/Meat_frash.set_pressed(can_sale_meat_frash)
	$Rules/Choose_for_sale/Products2/VBoxContainer/Human_meat.set_pressed(can_sale_human_meat)
	
	if Globaldata.shop_open:
		$Main_menu_shop/VBoxContainer/Open_shop.set_pressed(true)
	else:
		$Main_menu_shop/VBoxContainer/Open_shop.set_pressed(false)
	
	
	if autobuy_vegetables:
		$Rules/Choose_for_auto_buy/Products1/VBoxContainer/Vegetables_buy.set_pressed(true)
	else:
		$Rules/Choose_for_auto_buy/Products1/VBoxContainer/Vegetables_buy.set_pressed(false)
	
	if autobuy_flour_and_cereals:
		$Rules/Choose_for_auto_buy/Products1/VBoxContainer/Flour_and_cereals_buy.set_pressed(true)
	else:
		$Rules/Choose_for_auto_buy/Products1/VBoxContainer/Flour_and_cereals_buy.set_pressed(false)
	
	if autobuy_cheese:
		$Rules/Choose_for_auto_buy/Products1/VBoxContainer/Cheese_buy.set_pressed(true)
	else:
		$Rules/Choose_for_auto_buy/Products1/VBoxContainer/Cheese_buy.set_pressed(false)
	
	if autobuy_butter:
		$Rules/Choose_for_auto_buy/Products1/VBoxContainer/Butter_buy.set_pressed(true)
	else:
		$Rules/Choose_for_auto_buy/Products1/VBoxContainer/Butter_buy.set_pressed(false)
	
	if autobuy_eggs:
		$Rules/Choose_for_auto_buy/Products1/VBoxContainer/Eggs_buy.set_pressed(true)
	else:
		$Rules/Choose_for_auto_buy/Products1/VBoxContainer/Eggs_buy.set_pressed(false)
	
	if autobuy_milk:
		$Rules/Choose_for_auto_buy/Products1/VBoxContainer/Milk_buy.set_pressed(true)
	else:
		$Rules/Choose_for_auto_buy/Products1/VBoxContainer/Milk_buy.set_pressed(false)
	
	if autobuy_cream:
		$Rules/Choose_for_auto_buy/Products2/VBoxContainer/Cream_buy.set_pressed(true)
	else:
		$Rules/Choose_for_auto_buy/Products2/VBoxContainer/Cream_buy.set_pressed(false)
	
	if autobuy_meat_frash:
		$Rules/Choose_for_auto_buy/Products2/VBoxContainer/Meat_frash_buy.set_pressed(true)
	else:
		$Rules/Choose_for_auto_buy/Products2/VBoxContainer/Meat_frash_buy.set_pressed(false)
	
	if autobuy_human_meat:
		$Rules/Choose_for_auto_buy/Products2/VBoxContainer/Human_meat_buy.set_pressed(true)
	else:
		$Rules/Choose_for_auto_buy/Products2/VBoxContainer/Human_meat_buy.set_pressed(false)
	
	
	
	if Globaldata.shop_open:
		if Globaldata.days_shop_worked > 0:
			var shop_days_calculate = Globaldata.days_shop_worked
			for j in range(shop_days_calculate):
				
				if autobuy_vegetables:
					var difference = 60 - Globaldata.shop_have_vegetables
					for i in range(difference):
						rng.randomize()
						var buying_price_add = rng.randi_range(Globaldata.supplier_margin_shop_vegetables[0],Globaldata.supplier_margin_shop_vegetables[1])
						Globaldata.money -= buying_price_add
						Globaldata.shop_have_vegetables += 1
				
				rng.randomize()
				var vegetables_saled = rng.randi_range(1, 60)
				for i in range(vegetables_saled):
					if Globaldata.shop_have_vegetables > 0:
						Globaldata.money += 5
						Globaldata.shop_have_vegetables -= 1
					else:
						client_nof_find_product += 1
				
				if autobuy_flour_and_cereals:
					var difference = 60 - Globaldata.shop_have_flour_and_cereals
					for i in range(difference):
						rng.randomize()
						var buying_price_add = rng.randi_range(-1,1)
						Globaldata.money -= rng.randi_range(Globaldata.supplier_margin_shop_flour_and_cereals[0],Globaldata.supplier_margin_shop_flour_and_cereals[1])
						Globaldata.shop_have_flour_and_cereals += 1
				
				rng.randomize()
				var flour_and_cereals_saled = rng.randi_range(1, 60)
				for i in range(flour_and_cereals_saled):
					if Globaldata.shop_have_flour_and_cereals > 0:
						Globaldata.money += 3
						Globaldata.shop_have_flour_and_cereals -= 1
					else:
						client_nof_find_product += 1
				
				if autobuy_cheese:
					var difference = 60 - Globaldata.shop_have_cheese
					for i in range(difference):
						rng.randomize()
						var buying_price_add = rng.randi_range(-1,1)
						Globaldata.money -= rng.randi_range(Globaldata.supplier_margin_shop_cheese[0],Globaldata.supplier_margin_shop_cheese[1])
						Globaldata.shop_have_cheese += 1
				
				rng.randomize()
				var cheese_saled = rng.randi_range(1, 60)
				for i in range(cheese_saled):
					if Globaldata.shop_have_cheese > 0:
						Globaldata.money += 12
						Globaldata.shop_have_cheese -= 1
					else:
						client_nof_find_product += 1
				
				if autobuy_butter:
					var difference = 60 - Globaldata.shop_have_butter
					for i in range(difference):
						rng.randomize()
						var buying_price_add = rng.randi_range(-1,1)
						Globaldata.money -= rng.randi_range(Globaldata.supplier_margin_shop_butter[0],Globaldata.supplier_margin_shop_butter[1])
						Globaldata.shop_have_butter += 1
				
				rng.randomize()
				var butter_saled = rng.randi_range(1, 60)
				for i in range(butter_saled):
					if Globaldata.shop_have_butter > 0:
						Globaldata.money += 6
						Globaldata.shop_have_butter -= 1
					else:
						client_nof_find_product += 1
				
				if autobuy_eggs:
					var difference = 60 - Globaldata.shop_have_eggs
					for i in range(difference):
						rng.randomize()
						var buying_price_add = rng.randi_range(-1,1)
						Globaldata.money -= rng.randi_range(Globaldata.supplier_margin_shop_eggs[0],Globaldata.supplier_margin_shop_eggs[1])
						Globaldata.shop_have_eggs += 1
				
				rng.randomize()
				var eggs_saled = rng.randi_range(1, 60)
				for i in range(eggs_saled):
					if Globaldata.shop_have_eggs > 0:
						Globaldata.money += 4
						Globaldata.shop_have_eggs -= 1
					else:
						client_nof_find_product += 1
				
				if autobuy_milk:
					var difference = 60 - Globaldata.shop_have_milk
					for i in range(difference):
						rng.randomize()
						var buying_price_add = rng.randi_range(-1,1)
						Globaldata.money -= rng.randi_range(Globaldata.supplier_margin_shop_milk[0],Globaldata.supplier_margin_shop_milk[1])
						Globaldata.shop_have_milk += 1
				
				rng.randomize()
				var milk_saled = rng.randi_range(1, 60)
				for i in range(milk_saled):
					if Globaldata.shop_have_milk > 0:
						Globaldata.money += 3
						Globaldata.shop_have_milk -= 1
					else:
						client_nof_find_product += 1
				
				if autobuy_cream:
					var difference = 60 - Globaldata.shop_have_cream
					for i in range(difference):
						rng.randomize()
						var buying_price_add = rng.randi_range(-1,1)
						Globaldata.money -= rng.randi_range(Globaldata.supplier_margin_shop_cream[0],Globaldata.supplier_margin_shop_cream[1])
						Globaldata.shop_have_cream += 1
				
				rng.randomize()
				var cream_saled = rng.randi_range(1, 60)
				for i in range(cream_saled):
					if Globaldata.shop_have_cream > 0:
						Globaldata.money += 4
						Globaldata.shop_have_cream -= 1
					else:
						client_nof_find_product += 1
				
				if autobuy_meat_frash:
					var difference = 60 - Globaldata.shop_have_meat_frash
					for i in range(difference):
						rng.randomize()
						var buying_price_add = rng.randi_range(-1,1)
						Globaldata.money -= rng.randi_range(Globaldata.supplier_margin_shop_meat_frash[0],Globaldata.supplier_margin_shop_meat_frash[1])
						Globaldata.shop_have_meat_frash += 1
				
				rng.randomize()
				var meat_frash_saled = rng.randi_range(1, 60)
				for i in range(meat_frash_saled):
					if Globaldata.shop_have_meat_frash > 0:
						Globaldata.money += 4
						Globaldata.shop_have_meat_frash -= 1
					else:
						client_nof_find_product += 1
				
				if autobuy_human_meat:
					var difference = 60 - Globaldata.shop_have_human_meat
					for i in range(difference):
						rng.randomize()
						var buying_price_add = rng.randi_range(-1,1)
						Globaldata.money -= rng.randi_range(Globaldata.supplier_margin_shop_human_meat[0],Globaldata.supplier_margin_shop_human_meat[1])
						Globaldata.shop_have_human_meat += 1
				
				rng.randomize()
				var human_meat_saled = rng.randi_range(1, 60)
				for i in range(human_meat_saled):
					if Globaldata.shop_have_human_meat > 0:
						Globaldata.money += 12
						Globaldata.shop_have_human_meat -= 1
					else:
						client_nof_find_product += 1
	
	$Money/VBoxContainer/HBoxContainer/Stars_ducats.set_text(str(Globaldata.money))
	

func _on_open_shop_toggled(toggled_on):
	if toggled_on:
		Globaldata.shop_open = true
	else:
		Globaldata.shop_open = false


func _on_personal_pressed():
	$Personal.set_visible(true)
	$Main_menu_shop.set_visible(false)


func _on_rules_pressed():
	$Rules.set_visible(true)
	$Rules/Choose_for_sale.set_visible(false)
	$Main_menu_shop.set_visible(false)


func _on_product_pressed():
	$Storage.set_visible(true)
	$Main_menu_shop.set_visible(false)
	
	$Storage/Products/VBoxContainer/Vegetables.set_text("Овощи %s/60"%Globaldata.shop_have_vegetables)
	$Storage/Products/VBoxContainer/Flour_and_cereals.set_text("Мука и крупы %s/60"%Globaldata.shop_have_flour_and_cereals)
	$Storage/Products/VBoxContainer/Cheese.set_text("Сыр %s/60"%Globaldata.shop_have_cheese)
	$Storage/Products/VBoxContainer/Butter.set_text("Сливочное масло %s/60"%Globaldata.shop_have_butter)
	$Storage/Products/VBoxContainer/Eggs.set_text("Яйца %s/60"%Globaldata.shop_have_eggs)
	$Storage/Products/VBoxContainer/Milk.set_text("Молоко %s/60"%Globaldata.shop_have_milk)
	$Storage/Products2/VBoxContainer/Cream.set_text("Сливки %s/60"%Globaldata.shop_have_cream)
	$Storage/Products2/VBoxContainer/Meat_frash.set_text("Мясо %s/60"%Globaldata.shop_have_meat_frash)
	$Storage/Products2/VBoxContainer/Human_meat.set_text("Девчатина %s/60"%Globaldata.shop_have_human_meat)


func _on_exit_pressed():
	get_tree().change_scene_to_file("res://scen/trading_area.tscn")


func _on_guards_pressed():
	emploee = 1
	$Personal/Guards.set_visible(true)
	$Personal/VBoxContainer.set_visible(false)
	if Globaldata.all_slaves.size() != 0:
		for i in range(0, 6):
			if i < Globaldata.all_slaves.size():
				Globaldata.all_slaves[i].show_if_aviability(get_node("Personal/Guards/Slave_" + str(i+1)),i)
				get_node("Personal/Guards/Slave_" + str(i+1)).set_text("%s"%Globaldata.all_slaves[i].slave_name)
				if Globaldata.all_slaves[i].slave_work == 0:
					get_node("Personal/Guards/Slave_" + str(i+1)).set_text("%s"%Globaldata.all_slaves[i].slave_name)
				elif Globaldata.all_slaves[i].slave_work == 1:
					get_node("Personal/Guards/Slave_" + str(i+1)).set_text("%s\n(Охрана)"%Globaldata.all_slaves[i].slave_name)
				elif Globaldata.all_slaves[i].slave_work == 2:
					get_node("Personal/Guards/Slave_" + str(i+1)).set_text("%s\n(Продавец)"%Globaldata.all_slaves[i].slave_name)
				elif Globaldata.all_slaves[i].slave_work == 3:
					get_node("Personal/Guards/Slave_" + str(i+1)).set_text("%s\n(Работник склада)"%Globaldata.all_slaves[i].slave_name)
				elif Globaldata.all_slaves[i].slave_work == 4:
					get_node("Personal/Guards/Slave_" + str(i+1)).set_text("%s\n(Уборщик)"%Globaldata.all_slaves[i].slave_name)
			else:
				get_node("Personal/Guards/Slave_" + str(i+1)).set_visible(false)
	else:
		$Personal/Guards/Slave_1.set_visible(false)
		$Personal/Guards/Slave_2.set_visible(false)
		$Personal/Guards/Slave_3.set_visible(false)
		$Personal/Guards/Slave_4.set_visible(false)
		$Personal/Guards/Slave_5.set_visible(false)
		$Personal/Guards/Slave_6.set_visible(false)
	if Globaldata.all_slaves.size() > 6:
		$Personal/Guards/Switch_pages/Right.set_visible(true)
	else:
		$Personal/Guards/Switch_pages/Right.set_visible(false)
	$Personal/Guards/Switch_pages/Left.set_visible(false)


func _on_shopkeepers_pressed():
	emploee = 2
	$Personal/VBoxContainer.set_visible(false)
	$Personal/Shopkeepers.set_visible(true)
	if Globaldata.all_slaves.size() != 0:
		for i in range(0, 6):
			if i < Globaldata.all_slaves.size():
				Globaldata.all_slaves[i].show_if_aviability(get_node("Personal/Shopkeepers/Slave_" + str(i+1)),i)
				get_node("Personal/Shopkeepers/Slave_" + str(i+1)).set_text("%s"%Globaldata.all_slaves[i].slave_name)
				if Globaldata.all_slaves[i].slave_work == 0:
					get_node("Personal/Shopkeepers/Slave_" + str(i+1)).set_text("%s"%Globaldata.all_slaves[i].slave_name)
				elif Globaldata.all_slaves[i].slave_work == 1:
					get_node("Personal/Shopkeepers/Slave_" + str(i+1)).set_text("%s\n(Охрана)"%Globaldata.all_slaves[i].slave_name)
				elif Globaldata.all_slaves[i].slave_work == 2:
					get_node("Personal/Shopkeepers/Slave_" + str(i+1)).set_text("%s\n(Продавец)"%Globaldata.all_slaves[i].slave_name)
				elif Globaldata.all_slaves[i].slave_work == 3:
					get_node("Personal/Shopkeepers/Slave_" + str(i+1)).set_text("%s\n(Работник склада)"%Globaldata.all_slaves[i].slave_name)
				elif Globaldata.all_slaves[i].slave_work == 4:
					get_node("Personal/Shopkeepers/Slave_" + str(i+1)).set_text("%s\n(Уборщик)"%Globaldata.all_slaves[i].slave_name)
			else:
				get_node("Personal/Shopkeepers/Slave_" + str(i+1)).set_visible(false)
	else:
		$Personal/Shopkeepers/Slave_1.set_visible(false)
		$Personal/Shopkeepers/Slave_2.set_visible(false)
		$Personal/Shopkeepers/Slave_3.set_visible(false)
		$Personal/Shopkeepers/Slave_4.set_visible(false)
		$Personal/Shopkeepers/Slave_5.set_visible(false)
		$Personal/Shopkeepers/Slave_6.set_visible(false)
	if Globaldata.all_slaves.size() > 6:
		$Personal/Shopkeepers/Switch_pages/Right.set_visible(true)
	else:
		$Personal/Shopkeepers/Switch_pages/Right.set_visible(false)
	$Personal/Shopkeepers/Switch_pages/Left.set_visible(false)
	


func _on_storage_workers_pressed():
	emploee = 3
	$Personal/VBoxContainer.set_visible(false)
	$Personal/Storage_workers.set_visible(true)
	if Globaldata.all_slaves.size() != 0:
		for i in range(0, 6):
			if i < Globaldata.all_slaves.size():
				Globaldata.all_slaves[i].show_if_aviability(get_node("Personal/Storage_workers/Slave_" + str(i+1)),i)
				get_node("Personal/Storage_workers/Slave_" + str(i+1)).set_text("%s"%Globaldata.all_slaves[i].slave_name)
				if Globaldata.all_slaves[i].slave_work == 0:
					get_node("Personal/Storage_workers/Slave_" + str(i+1)).set_text("%s"%Globaldata.all_slaves[i].slave_name)
				elif Globaldata.all_slaves[i].slave_work == 1:
					get_node("Personal/Storage_workers/Slave_" + str(i+1)).set_text("%s\n(Охрана)"%Globaldata.all_slaves[i].slave_name)
				elif Globaldata.all_slaves[i].slave_work == 2:
					get_node("Personal/Storage_workers/Slave_" + str(i+1)).set_text("%s\n(Продавец)"%Globaldata.all_slaves[i].slave_name)
				elif Globaldata.all_slaves[i].slave_work == 3:
					get_node("Personal/Storage_workers/Slave_" + str(i+1)).set_text("%s\n(Работник склада)"%Globaldata.all_slaves[i].slave_name)
				elif Globaldata.all_slaves[i].slave_work == 4:
					get_node("Personal/Storage_workers/Slave_" + str(i+1)).set_text("%s\n(Уборщик)"%Globaldata.all_slaves[i].slave_name)
			else:
				get_node("Personal/Storage_workers/Slave_" + str(i+1)).set_visible(false)
	else:
		$Personal/Storage_workers/Slave_1.set_visible(false)
		$Personal/Storage_workers/Slave_2.set_visible(false)
		$Personal/Storage_workers/Slave_3.set_visible(false)
		$Personal/Storage_workers/Slave_4.set_visible(false)
		$Personal/Storage_workers/Slave_5.set_visible(false)
		$Personal/Storage_workers/Slave_6.set_visible(false)
	if Globaldata.all_slaves.size() > 6:
		$Personal/Storage_workers/Switch_pages/Right.set_visible(true)
	else:
		$Personal/Storage_workers/Switch_pages/Right.set_visible(false)
	$Personal/Storage_workers/Switch_pages/Left.set_visible(false)
	


func _on_cleaners_pressed():
	emploee = 4
	$Personal/VBoxContainer.set_visible(false)
	$Personal/Cleaners.set_visible(true)
	if Globaldata.all_slaves.size() != 0:
		for i in range(0, 6):
			if i < Globaldata.all_slaves.size():
				Globaldata.all_slaves[i].show_if_aviability(get_node("Personal/Cleaners/Slave_" + str(i+1)),i)
				get_node("Personal/Cleaners/Slave_" + str(i+1)).set_text("%s"%Globaldata.all_slaves[i].slave_name)
				if Globaldata.all_slaves[i].slave_work == 0:
					get_node("Personal/Cleaners/Slave_" + str(i+1)).set_text("%s"%Globaldata.all_slaves[i].slave_name)
				elif Globaldata.all_slaves[i].slave_work == 1:
					get_node("Personal/Cleaners/Slave_" + str(i+1)).set_text("%s\n(Охрана)"%Globaldata.all_slaves[i].slave_name)
				elif Globaldata.all_slaves[i].slave_work == 2:
					get_node("Personal/Cleaners/Slave_" + str(i+1)).set_text("%s\n(Продавец)"%Globaldata.all_slaves[i].slave_name)
				elif Globaldata.all_slaves[i].slave_work == 3:
					get_node("Personal/Cleaners/Slave_" + str(i+1)).set_text("%s\n(Работник склада)"%Globaldata.all_slaves[i].slave_name)
				elif Globaldata.all_slaves[i].slave_work == 4:
					get_node("Personal/Cleaners/Slave_" + str(i+1)).set_text("%s\n(Уборщик)"%Globaldata.all_slaves[i].slave_name)
			else:
				get_node("Personal/Cleaners/Slave_" + str(i+1)).set_visible(false)
	else:
		$Personal/Cleaners/Slave_1.set_visible(false)
		$Personal/Cleaners/Slave_2.set_visible(false)
		$Personal/Cleaners/Slave_3.set_visible(false)
		$Personal/Cleaners/Slave_4.set_visible(false)
		$Personal/Cleaners/Slave_5.set_visible(false)
		$Personal/Cleaners/Slave_6.set_visible(false)
	if Globaldata.all_slaves.size() > 6:
		$Personal/Cleaners/Switch_pages/Right.set_visible(true)
	else:
		$Personal/Cleaners/Switch_pages/Right.set_visible(false)
	$Personal/Cleaners/Switch_pages/Left.set_visible(false)


func _on_back_personal_pressed():
	$Personal.set_visible(false)
	$Main_menu_shop.set_visible(true)


func _on_slave_1_pressed():
	if emploee == 1:
		Globaldata.all_slaves[slave_range - 6].slave_work = 1
		_on_back_choose_guards_pressed()
	elif emploee == 2:
		Globaldata.all_slaves[slave_range - 6].slave_work = 2
		_on_back_choose_shopkeepers_pressed()
	elif emploee == 3:
		Globaldata.all_slaves[slave_range - 6].slave_work = 3
		_on_back_choose_storage_workers_pressed()
	elif emploee == 4:
		Globaldata.all_slaves[slave_range - 6].slave_work = 4
		_on_back_choose_cleaners_pressed()


func _on_slave_2_pressed():
	if emploee == 1:
		Globaldata.all_slaves[slave_range - 5].slave_work = 1
		_on_back_choose_guards_pressed()
	elif emploee == 2:
		Globaldata.all_slaves[slave_range - 5].slave_work = 2
		_on_back_choose_shopkeepers_pressed()
	elif emploee == 3:
		Globaldata.all_slaves[slave_range - 5].slave_work = 3
		_on_back_choose_storage_workers_pressed()
	elif emploee == 4:
		Globaldata.all_slaves[slave_range - 5].slave_work = 4
		_on_back_choose_cleaners_pressed()


func _on_slave_3_pressed():
	if emploee == 1:
		Globaldata.all_slaves[slave_range - 4].slave_work = 1
		_on_back_choose_guards_pressed()
	elif emploee == 2:
		Globaldata.all_slaves[slave_range - 4].slave_work = 2
		_on_back_choose_shopkeepers_pressed()
	elif emploee == 3:
		Globaldata.all_slaves[slave_range - 4].slave_work = 3
		_on_back_choose_storage_workers_pressed()
	elif emploee == 4:
		Globaldata.all_slaves[slave_range - 4].slave_work = 4
		_on_back_choose_cleaners_pressed()


func _on_slave_4_pressed():
	if emploee == 1:
		Globaldata.all_slaves[slave_range - 3].slave_work = 1
		_on_back_choose_guards_pressed()
	elif emploee == 2:
		Globaldata.all_slaves[slave_range - 3].slave_work = 2
		_on_back_choose_shopkeepers_pressed()
	elif emploee == 3:
		Globaldata.all_slaves[slave_range - 3].slave_work = 3
		_on_back_choose_storage_workers_pressed()
	elif emploee == 4:
		Globaldata.all_slaves[slave_range - 3].slave_work = 4
		_on_back_choose_cleaners_pressed()


func _on_slave_5_pressed():
	if emploee == 1:
		Globaldata.all_slaves[slave_range - 2].slave_work = 1
		_on_back_choose_guards_pressed()
	elif emploee == 2:
		Globaldata.all_slaves[slave_range - 2].slave_work = 2
		_on_back_choose_shopkeepers_pressed()
	elif emploee == 3:
		Globaldata.all_slaves[slave_range - 2].slave_work = 3
		_on_back_choose_storage_workers_pressed()
	elif emploee == 4:
		Globaldata.all_slaves[slave_range - 2].slave_work = 4
		_on_back_choose_cleaners_pressed()


func _on_slave_6_pressed():
	if emploee == 1:
		Globaldata.all_slaves[slave_range - 1].slave_work = 1
		_on_back_choose_guards_pressed()
	elif emploee == 2:
		Globaldata.all_slaves[slave_range - 1].slave_work = 2
		_on_back_choose_shopkeepers_pressed()
	elif emploee == 2:
		Globaldata.all_slaves[slave_range - 1].slave_work = 3
		_on_back_choose_storage_workers_pressed()
	elif emploee == 4:
		Globaldata.all_slaves[slave_range - 1].slave_work = 4
		_on_back_choose_storage_workers_pressed()


func _on_back_choose_guards_pressed():
	slave_range = 6
	$Personal/Guards.set_visible(false)
	$Personal/VBoxContainer.set_visible(true)



func _on_back_choose_shopkeepers_pressed():
	slave_range = 6
	$Personal/VBoxContainer.set_visible(true)
	$Personal/Shopkeepers.set_visible(false)


func _on_back_choose_storage_workers_pressed():
	slave_range = 6
	$Personal/VBoxContainer.set_visible(true)
	$Personal/Storage_workers.set_visible(false)


func _on_back_choose_cleaners_pressed():
	slave_range = 6
	$Personal/VBoxContainer.set_visible(true)
	$Personal/Cleaners.set_visible(false)


func _on_left_pressed():
	slave_range -= 12
	print("лево")
	print(slave_range)
	if emploee == 1:
		if Globaldata.all_slaves.size() > 0:
			for i in range(6):
				if slave_range < Globaldata.all_slaves.size():
					get_node("Personal/Guards/Slave_" + str(i+1)).set_visible(true)
					print(get_node("Personal/Guards/Slave_" + str(i+1)))
					print(Globaldata.all_slaves[slave_range].slave_name,Globaldata.all_slaves[slave_range].slave_work)
					if Globaldata.all_slaves[slave_range].slave_work == 0:
						get_node("Personal/Guards/Slave_" + str(i+1)).set_text("%s"%Globaldata.all_slaves[slave_range].slave_name)
					elif Globaldata.all_slaves[slave_range].slave_work == 1:
						get_node("Personal/Guards/Slave_" + str(i+1)).set_text("%s\n(Охрана)"%Globaldata.all_slaves[slave_range].slave_name)
					elif Globaldata.all_slaves[slave_range].slave_work == 2:
						get_node("Personal/Guards/Slave_" + str(i+1)).set_text("%s\n(Продавец)"%Globaldata.all_slaves[slave_range].slave_name)
					elif Globaldata.all_slaves[slave_range].slave_work == 3:
						get_node("Personal/Guards/Slave_" + str(i+1)).set_text("%s\n(Работник склада)"%Globaldata.all_slaves[slave_range].slave_name)
					elif Globaldata.all_slaves[slave_range].slave_work == 4:
						get_node("Personal/Guards/Slave_" + str(i+1)).set_text("%s\n(Уборщик)"%Globaldata.all_slaves[slave_range].slave_name)
					
					#get_node("Personal/Guards/Slave_" + str(i+1)).set_text("%s"%slave_range) #%Globaldata.all_slaves[i].slave_name
				else:
					get_node("Personal/Guards/Slave_" + str(i+1)).set_visible(false)
				slave_range += 1
				print(slave_range)
		else:
			$Personal/Guards/Slave_1.set_visible(false)
			$Personal/Guards/Slave_2.set_visible(false)
			$Personal/Guards/Slave_3.set_visible(false)
			$Personal/Guards/Slave_4.set_visible(false)
			$Personal/Guards/Slave_5.set_visible(false)
			$Personal/Guards/Slave_6.set_visible(false)
		if slave_range <= Globaldata.all_slaves.size():
			$Personal/Guards/Switch_pages/Right.set_visible(true)
		else:
			$Personal/Guards/Switch_pages/Right.set_visible(false)
		
		if slave_range >= 12:
			$Personal/Guards/Switch_pages/Left.set_visible(true)
		else:
			$Personal/Guards/Switch_pages/Left.set_visible(false)
			
	elif emploee == 2:
		if Globaldata.all_slaves.size() > 0:
			for i in range(6):
				if slave_range < Globaldata.all_slaves.size():
					get_node("Personal/Shopkeepers/Slave_" + str(i+1)).set_visible(true)
					print(get_node("Personal/Shopkeepers/Slave_" + str(i+1)))
					print(Globaldata.all_slaves[slave_range].slave_name,Globaldata.all_slaves[slave_range].slave_work)
					if Globaldata.all_slaves[slave_range].slave_work == 0:
						get_node("Personal/Shopkeepers/Slave_" + str(i+1)).set_text("%s"%Globaldata.all_slaves[slave_range].slave_name)
					elif Globaldata.all_slaves[slave_range].slave_work == 1:
						get_node("Personal/Shopkeepers/Slave_" + str(i+1)).set_text("%s\n(Охрана)"%Globaldata.all_slaves[slave_range].slave_name)
					elif Globaldata.all_slaves[slave_range].slave_work == 2:
						get_node("Personal/Shopkeepers/Slave_" + str(i+1)).set_text("%s\n(Продавец)"%Globaldata.all_slaves[slave_range].slave_name)
					elif Globaldata.all_slaves[slave_range].slave_work == 3:
						get_node("Personal/Shopkeepers/Slave_" + str(i+1)).set_text("%s\n(Работник склада)"%Globaldata.all_slaves[slave_range].slave_name)
					elif Globaldata.all_slaves[slave_range].slave_work == 4:
						get_node("Personal/Shopkeepers/Slave_" + str(i+1)).set_text("%s\n(Уборщик)"%Globaldata.all_slaves[slave_range].slave_name)
					
					#get_node("Personal/Guards/Slave_" + str(i+1)).set_text("%s"%slave_range) #%Globaldata.all_slaves[i].slave_name
				else:
					get_node("Personal/Shopkeepers/Slave_" + str(i+1)).set_visible(false)
				slave_range += 1
				print(slave_range)
		else:
			$Personal/Shopkeepers/Slave_1.set_visible(false)
			$Personal/Shopkeepers/Slave_2.set_visible(false)
			$Personal/Shopkeepers/Slave_3.set_visible(false)
			$Personal/Shopkeepers/Slave_4.set_visible(false)
			$Personal/Shopkeepers/Slave_5.set_visible(false)
			$Personal/Shopkeepers/Slave_6.set_visible(false)
		if slave_range <= Globaldata.all_slaves.size():
			$Personal/Shopkeepers/Switch_pages/Right.set_visible(true)
		else:
			$Personal/Shopkeepers/Switch_pages/Right.set_visible(false)
		
		if slave_range >= 12:
			$Personal/Shopkeepers/Switch_pages/Left.set_visible(true)
		else:
			$Personal/Shopkeepers/Switch_pages/Left.set_visible(false)
		
	elif emploee == 3:
		if Globaldata.all_slaves.size() > 0:
			for i in range(6):
				if slave_range < Globaldata.all_slaves.size():
					get_node("Personal/Storage_workers/Slave_" + str(i+1)).set_visible(true)
					print(get_node("Personal/Storage_workers/Slave_" + str(i+1)))
					print(Globaldata.all_slaves[slave_range].slave_name,Globaldata.all_slaves[slave_range].slave_work)
					if Globaldata.all_slaves[slave_range].slave_work == 0:
						get_node("Personal/Storage_workers/Slave_" + str(i+1)).set_text("%s"%Globaldata.all_slaves[slave_range].slave_name)
					elif Globaldata.all_slaves[slave_range].slave_work == 1:
						get_node("Personal/Storage_workers/Slave_" + str(i+1)).set_text("%s\n(Охрана)"%Globaldata.all_slaves[slave_range].slave_name)
					elif Globaldata.all_slaves[slave_range].slave_work == 2:
						get_node("Personal/Storage_workers/Slave_" + str(i+1)).set_text("%s\n(Продавец)"%Globaldata.all_slaves[slave_range].slave_name)
					elif Globaldata.all_slaves[slave_range].slave_work == 3:
						get_node("Personal/Storage_workers/Slave_" + str(i+1)).set_text("%s\n(Работник склада)"%Globaldata.all_slaves[slave_range].slave_name)
					elif Globaldata.all_slaves[slave_range].slave_work == 4:
						get_node("Personal/Storage_workers/Slave_" + str(i+1)).set_text("%s\n(Уборщик)"%Globaldata.all_slaves[slave_range].slave_name)
					
					#get_node("Personal/Guards/Slave_" + str(i+1)).set_text("%s"%slave_range) #%Globaldata.all_slaves[i].slave_name
				else:
					get_node("Personal/Storage_workers/Slave_" + str(i+1)).set_visible(false)
				slave_range += 1
				print(slave_range)
		else:
			$Personal/Storage_workers/Slave_1.set_visible(false)
			$Personal/Storage_workers/Slave_2.set_visible(false)
			$Personal/Storage_workers/Slave_3.set_visible(false)
			$Personal/Storage_workers/Slave_4.set_visible(false)
			$Personal/Storage_workers/Slave_5.set_visible(false)
			$Personal/Storage_workers/Slave_6.set_visible(false)
		if slave_range <= Globaldata.all_slaves.size():
			$Personal/Shopkeepers/Switch_pages/Right.set_visible(true)
		else:
			$Personal/Storage_workers/Switch_pages/Right.set_visible(false)
		
		if slave_range >= 12:
			$Personal/Storage_workers/Switch_pages/Left.set_visible(true)
		else:
			$Personal/Storage_workers/Switch_pages/Left.set_visible(false)
	
	elif emploee == 4:
		if Globaldata.all_slaves.size() > 0:
			for i in range(6):
				if slave_range < Globaldata.all_slaves.size():
					get_node("Personal/Cleaners/Slave_" + str(i+1)).set_visible(true)
					print(get_node("Personal/Cleaners/Slave_" + str(i+1)))
					print(Globaldata.all_slaves[slave_range].slave_name,Globaldata.all_slaves[slave_range].slave_work)
					if Globaldata.all_slaves[slave_range].slave_work == 0:
						get_node("Personal/Cleaners/Slave_" + str(i+1)).set_text("%s"%Globaldata.all_slaves[slave_range].slave_name)
					elif Globaldata.all_slaves[slave_range].slave_work == 1:
						get_node("Personal/Cleaners/Slave_" + str(i+1)).set_text("%s\n(Охрана)"%Globaldata.all_slaves[slave_range].slave_name)
					elif Globaldata.all_slaves[slave_range].slave_work == 2:
						get_node("Personal/Cleaners/Slave_" + str(i+1)).set_text("%s\n(Продавец)"%Globaldata.all_slaves[slave_range].slave_name)
					elif Globaldata.all_slaves[slave_range].slave_work == 3:
						get_node("Personal/Cleaners/Slave_" + str(i+1)).set_text("%s\n(Работник склада)"%Globaldata.all_slaves[slave_range].slave_name)
					elif Globaldata.all_slaves[slave_range].slave_work == 4:
						get_node("Personal/Cleaners/Slave_" + str(i+1)).set_text("%s\n(Уборщик)"%Globaldata.all_slaves[slave_range].slave_name)
					
					#get_node("Personal/Guards/Slave_" + str(i+1)).set_text("%s"%slave_range) #%Globaldata.all_slaves[i].slave_name
				else:
					get_node("Personal/Cleaners/Slave_" + str(i+1)).set_visible(false)
				slave_range += 1
				print(slave_range)
		else:
			$Personal/Cleaners/Slave_1.set_visible(false)
			$Personal/Cleaners/Slave_2.set_visible(false)
			$Personal/Cleaners/Slave_3.set_visible(false)
			$Personal/Cleaners/Slave_4.set_visible(false)
			$Personal/Cleaners/Slave_5.set_visible(false)
			$Personal/Cleaners/Slave_6.set_visible(false)
		if slave_range <= Globaldata.all_slaves.size():
			$Personal/Shopkeepers/Switch_pages/Right.set_visible(true)
		else:
			$Personal/Cleaners/Switch_pages/Right.set_visible(false)
		
		if slave_range >= 12:
			$Personal/Cleaners/Switch_pages/Left.set_visible(true)
		else:
			$Personal/Cleaners/Switch_pages/Left.set_visible(false)


func _on_right_pressed():
	print("право")
	print(slave_range)
	if emploee == 1:
		if Globaldata.all_slaves.size() > 0:
			for i in range(6):
				if slave_range < Globaldata.all_slaves.size():
					get_node("Personal/Guards/Slave_" + str(i+1)).set_visible(true)
					print(get_node("Personal/Guards/Slave_" + str(i+1)))
					print(Globaldata.all_slaves[slave_range].slave_name,Globaldata.all_slaves[slave_range].slave_work)
					if Globaldata.all_slaves[slave_range].slave_work == 0:
						get_node("Personal/Guards/Slave_" + str(i+1)).set_text("%s"%Globaldata.all_slaves[slave_range].slave_name)
					elif Globaldata.all_slaves[slave_range].slave_work == 1:
						get_node("Personal/Guards/Slave_" + str(i+1)).set_text("%s\n(Охрана)"%Globaldata.all_slaves[slave_range].slave_name)
					elif Globaldata.all_slaves[slave_range].slave_work == 2:
						get_node("Personal/Guards/Slave_" + str(i+1)).set_text("%s\n(Продавец)"%Globaldata.all_slaves[slave_range].slave_name)
					elif Globaldata.all_slaves[slave_range].slave_work == 3:
						get_node("Personal/Guards/Slave_" + str(i+1)).set_text("%s\n(Работник склада)"%Globaldata.all_slaves[slave_range].slave_name)
					elif Globaldata.all_slaves[slave_range].slave_work == 4:
						get_node("Personal/Guards/Slave_" + str(i+1)).set_text("%s\n(Уборщик)"%Globaldata.all_slaves[slave_range].slave_name)
					
					#get_node("Personal/Guards/Slave_" + str(i+1)).set_text("%s"%slave_range) #%Globaldata.all_slaves[i].slave_name
				else:
					get_node("Personal/Guards/Slave_" + str(i+1)).set_visible(false)
				slave_range += 1
				print(slave_range)
		else:
			$Personal/Guards/Slave_1.set_visible(false)
			$Personal/Guards/Slave_2.set_visible(false)
			$Personal/Guards/Slave_3.set_visible(false)
			$Personal/Guards/Slave_4.set_visible(false)
			$Personal/Guards/Slave_5.set_visible(false)
			$Personal/Guards/Slave_6.set_visible(false)
		
		
		if slave_range <= Globaldata.all_slaves.size():
			$Personal/Guards/Switch_pages/Right.set_visible(true)
		else:
			$Personal/Guards/Switch_pages/Right.set_visible(false)
		
		if slave_range >= 12:
			$Personal/Guards/Switch_pages/Left.set_visible(true)
		else:
			$Personal/Guards/Switch_pages/Left.set_visible(false)
	
	elif emploee == 2:
		if Globaldata.all_slaves.size() > 0:
			for i in range(6):
				if slave_range < Globaldata.all_slaves.size():
					get_node("Personal/Shopkeepers/Slave_" + str(i+1)).set_visible(true)
					print(get_node("Personal/Shopkeepers/Slave_" + str(i+1)))
					print(Globaldata.all_slaves[slave_range].slave_name,Globaldata.all_slaves[slave_range].slave_work)
					if Globaldata.all_slaves[slave_range].slave_work == 0:
						get_node("Personal/Shopkeepers/Slave_" + str(i+1)).set_text("%s"%Globaldata.all_slaves[slave_range].slave_name)
					elif Globaldata.all_slaves[slave_range].slave_work == 1:
						get_node("Personal/Shopkeepers/Slave_" + str(i+1)).set_text("%s\n(Охрана)"%Globaldata.all_slaves[slave_range].slave_name)
					elif Globaldata.all_slaves[slave_range].slave_work == 2:
						get_node("Personal/Shopkeepers/Slave_" + str(i+1)).set_text("%s\n(Продавец)"%Globaldata.all_slaves[slave_range].slave_name)
					elif Globaldata.all_slaves[slave_range].slave_work == 3:
						get_node("Personal/Shopkeepers/Slave_" + str(i+1)).set_text("%s\n(Работник склада)"%Globaldata.all_slaves[slave_range].slave_name)
					elif Globaldata.all_slaves[slave_range].slave_work == 4:
						get_node("Personal/Shopkeepers/Slave_" + str(i+1)).set_text("%s\n(Уборщик)"%Globaldata.all_slaves[slave_range].slave_name)
					
					#get_node("Personal/Guards/Slave_" + str(i+1)).set_text("%s"%slave_range) #%Globaldata.all_slaves[i].slave_name
				else:
					get_node("Personal/Shopkeepers/Slave_" + str(i+1)).set_visible(false)
				slave_range += 1
				print(slave_range)
		else:
			$Personal/Shopkeepers/Slave_1.set_visible(false)
			$Personal/Shopkeepers/Slave_2.set_visible(false)
			$Personal/Shopkeepers/Slave_3.set_visible(false)
			$Personal/Shopkeepers/Slave_4.set_visible(false)
			$Personal/Shopkeepers/Slave_5.set_visible(false)
			$Personal/Shopkeepers/Slave_6.set_visible(false)
		if slave_range <= Globaldata.all_slaves.size():
			$Personal/Shopkeepers/Switch_pages/Right.set_visible(true)
		else:
			$Personal/Shopkeepers/Switch_pages/Right.set_visible(false)
		
		if slave_range >= 12:
			$Personal/Shopkeepers/Switch_pages/Left.set_visible(true)
		else:
			$Personal/Shopkeepers/Switch_pages/Left.set_visible(false)
	
	elif emploee == 3:
		if Globaldata.all_slaves.size() > 0:
			for i in range(6):
				if slave_range < Globaldata.all_slaves.size():
					get_node("Personal/Storage_workers/Slave_" + str(i+1)).set_visible(true)
					print(get_node("Personal/Storage_workers/Slave_" + str(i+1)))
					print(Globaldata.all_slaves[slave_range].slave_name,Globaldata.all_slaves[slave_range].slave_work)
					if Globaldata.all_slaves[slave_range].slave_work == 0:
						get_node("Personal/Storage_workers/Slave_" + str(i+1)).set_text("%s"%Globaldata.all_slaves[slave_range].slave_name)
					elif Globaldata.all_slaves[slave_range].slave_work == 1:
						get_node("Personal/Storage_workers/Slave_" + str(i+1)).set_text("%s\n(Охрана)"%Globaldata.all_slaves[slave_range].slave_name)
					elif Globaldata.all_slaves[slave_range].slave_work == 2:
						get_node("Personal/Storage_workers/Slave_" + str(i+1)).set_text("%s\n(Продавец)"%Globaldata.all_slaves[slave_range].slave_name)
					elif Globaldata.all_slaves[slave_range].slave_work == 3:
						get_node("Personal/Storage_workers/Slave_" + str(i+1)).set_text("%s\n(Работник склада)"%Globaldata.all_slaves[slave_range].slave_name)
					elif Globaldata.all_slaves[slave_range].slave_work == 4:
						get_node("Personal/Storage_workers/Slave_" + str(i+1)).set_text("%s\n(Уборщик)"%Globaldata.all_slaves[slave_range].slave_name)
					
					#get_node("Personal/Guards/Slave_" + str(i+1)).set_text("%s"%slave_range) #%Globaldata.all_slaves[i].slave_name
				else:
					get_node("Personal/Storage_workers/Slave_" + str(i+1)).set_visible(false)
				slave_range += 1
				print(slave_range)
		else:
			$Personal/Storage_workers/Slave_1.set_visible(false)
			$Personal/Storage_workers/Slave_2.set_visible(false)
			$Personal/Storage_workers/Slave_3.set_visible(false)
			$Personal/Storage_workers/Slave_4.set_visible(false)
			$Personal/Storage_workers/Slave_5.set_visible(false)
			$Personal/Storage_workers/Slave_6.set_visible(false)
		if slave_range <= Globaldata.all_slaves.size():
			$Personal/Storage_workers/Switch_pages/Right.set_visible(true)
		else:
			$Personal/Storage_workers/Switch_pages/Right.set_visible(false)
		
		if slave_range >= 12:
			$Personal/Storage_workers/Switch_pages/Left.set_visible(true)
		else:
			$Personal/Storage_workers/Switch_pages/Left.set_visible(false)
	
	elif emploee == 4:
		if Globaldata.all_slaves.size() > 0:
			for i in range(6):
				if slave_range < Globaldata.all_slaves.size():
					get_node("Personal/Cleaners/Slave_" + str(i+1)).set_visible(true)
					print(get_node("Personal/Cleaners/Slave_" + str(i+1)))
					print(Globaldata.all_slaves[slave_range].slave_name,Globaldata.all_slaves[slave_range].slave_work)
					if Globaldata.all_slaves[slave_range].slave_work == 0:
						get_node("Personal/Cleaners/Slave_" + str(i+1)).set_text("%s"%Globaldata.all_slaves[slave_range].slave_name)
					elif Globaldata.all_slaves[slave_range].slave_work == 1:
						get_node("Personal/Cleaners/Slave_" + str(i+1)).set_text("%s\n(Охрана)"%Globaldata.all_slaves[slave_range].slave_name)
					elif Globaldata.all_slaves[slave_range].slave_work == 2:
						get_node("Personal/Cleaners/Slave_" + str(i+1)).set_text("%s\n(Продавец)"%Globaldata.all_slaves[slave_range].slave_name)
					elif Globaldata.all_slaves[slave_range].slave_work == 3:
						get_node("Personal/Cleaners/Slave_" + str(i+1)).set_text("%s\n(Работник склада)"%Globaldata.all_slaves[slave_range].slave_name)
					elif Globaldata.all_slaves[slave_range].slave_work == 4:
						get_node("Personal/Cleaners/Slave_" + str(i+1)).set_text("%s\n(Уборщик)"%Globaldata.all_slaves[slave_range].slave_name)
					
					#get_node("Personal/Guards/Slave_" + str(i+1)).set_text("%s"%slave_range) #%Globaldata.all_slaves[i].slave_name
				else:
					get_node("Personal/Cleaners/Slave_" + str(i+1)).set_visible(false)
				slave_range += 1
				print(slave_range)
		else:
			$Personal/Cleaners/Slave_1.set_visible(false)
			$Personal/Cleaners/Slave_2.set_visible(false)
			$Personal/Cleaners/Slave_3.set_visible(false)
			$Personal/Cleaners/Slave_4.set_visible(false)
			$Personal/Cleaners/Slave_5.set_visible(false)
			$Personal/Cleaners/Slave_6.set_visible(false)
		if slave_range <= Globaldata.all_slaves.size():
			$Personal/Cleaners/Switch_pages/Right.set_visible(true)
		else:
			$Personal/Cleaners/Switch_pages/Right.set_visible(false)
		
		if slave_range >= 12:
			$Personal/Cleaners/Switch_pages/Left.set_visible(true)
		else:
			$Personal/Cleaners/Switch_pages/Left.set_visible(false)


func _on_products_for_sale_pressed():
	$Rules/Choose_for_sale.set_visible(true)
	$Rules/Rules_buttons.set_visible(false)


func _on_back_rules_pressed():
	$Main_menu_shop.set_visible(true)
	$Rules.set_visible(false)


func _on_vegetables_toggled(toggled_on):
	if toggled_on:
		can_sale_vegetables = true
	else:
		can_sale_vegetables = false
		


func _on_flour_and_cereals_toggled(toggled_on):
	if toggled_on:
		can_sale_flour_and_cereals = true
	else:
		can_sale_flour_and_cereals = false


func _on_cheese_toggled(toggled_on):
	if toggled_on:
		can_sale_cheese = true
	else:
		can_sale_cheese = false


func _on_butter_toggled(toggled_on):
	if toggled_on:
		can_sale_butter = true
	else:
		can_sale_butter = false


func _on_eggs_toggled(toggled_on):
	if toggled_on:
		can_sale_eggs = true
	else:
		can_sale_eggs = false


func _on_milk_toggled(toggled_on):
	if toggled_on:
		can_sale_milk = true
	else:
		can_sale_milk = false


func _on_back_products_pressed():
	$Rules/Choose_for_sale.set_visible(false)
	$Rules/Rules_buttons.set_visible(true)


func _on_cream_toggled(toggled_on):
	if toggled_on:
		can_sale_cream = true
	else:
		can_sale_cream = false


func _on_meat_frash_toggled(toggled_on):
	if toggled_on:
		can_sale_meat_frash = true
	else:
		can_sale_meat_frash = false


func _on_human_meat_toggled(toggled_on):
	if toggled_on:
		can_sale_human_meat = true
	else:
		can_sale_human_meat = false


func _on_vegetables_buy_toggled(toggled_on):
	if toggled_on:
		autobuy_vegetables = true
	else:
		autobuy_vegetables = false


func _on_flour_and_cereals_buy_toggled(toggled_on):
	if toggled_on:
		autobuy_flour_and_cereals = true
	else:
		autobuy_flour_and_cereals = false


func _on_cheese_buy_toggled(toggled_on):
	if toggled_on:
		autobuy_cheese = true
	else:
		autobuy_cheese = false


func _on_butter_buy_toggled(toggled_on):
	if toggled_on:
		autobuy_butter = true
	else:
		autobuy_butter = false


func _on_eggs_buy_toggled(toggled_on):
	if toggled_on:
		autobuy_eggs = true
	else:
		autobuy_eggs = false


func _on_milk_buy_toggled(toggled_on):
	if toggled_on:
		autobuy_milk = true
	else:
		autobuy_milk = false


func _on_cream_buy_toggled(toggled_on):
	if toggled_on:
		autobuy_cream = true
	else:
		autobuy_cream = false


func _on_meat_frash_buy_toggled(toggled_on):
	if toggled_on:
		autobuy_meat_frash = true
	else:
		autobuy_meat_frash = false


func _on_human_meat_buy_toggled(toggled_on):
	if toggled_on:
		autobuy_human_meat = true
	else:
		autobuy_human_meat = false


func _on_autobuy_products_pressed():
	$Rules/Rules_buttons.set_visible(false)
	$Rules/Choose_for_auto_buy.set_visible(true)


func _on_back_products_autobuy_pressed():
	$Rules/Rules_buttons.set_visible(true)
	$Rules/Choose_for_auto_buy.set_visible(false)


func _on_back_storage_pressed():
	$Storage.set_visible(false)
	$Main_menu_shop.set_visible(true)


func _on_settings_pressed():
	MusicController.stop_play_place_music(true)
	get_tree().root.add_child(preload("res://scen/main_menu.tscn").instantiate())
