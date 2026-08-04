extends Node

class_name class_clothes



func _init():
	for i in all_parts:
		generate_part(i)



func generate_part(part):
	match part:
		"Голова":
			var file = FileAccess.open("res://GameData/json/Clothes.json", FileAccess.READ)
			var names = JSON.parse_string(file.get_as_text())
			file.close()
			clothes = names[part][Globaldata.generate_number(0,len(names[part])-1)]
			return clothes
		"В ушах":
			var file = FileAccess.open("res://GameData/json/Clothes.json", FileAccess.READ)
			var names = JSON.parse_string(file.get_as_text())
			file.close()
			clothes = names[part][Globaldata.generate_number(0,len(names[part])-1)]
			return clothes
		"На шее":
			var file = FileAccess.open("res://GameData/json/Clothes.json", FileAccess.READ)
			var names = JSON.parse_string(file.get_as_text())
			file.close()
			clothes = names[part][Globaldata.generate_number(0,len(names[part])-1)]
			return clothes
		"На теле":
			var file = FileAccess.open("res://GameData/json/Clothes.json", FileAccess.READ)
			var names = JSON.parse_string(file.get_as_text())
			file.close()
			clothes = names[part][Globaldata.generate_number(0,len(names[part])-1)]
			return clothes
		"На руках":
			var file = FileAccess.open("res://GameData/json/Clothes.json", FileAccess.READ)
			var names = JSON.parse_string(file.get_as_text())
			file.close()
			clothes = names[part][Globaldata.generate_number(0,len(names[part])-1)]
			return clothes
		"На ногах":
			var file = FileAccess.open("res://GameData/json/Clothes.json", FileAccess.READ)
			var names = JSON.parse_string(file.get_as_text())
			file.close()
			clothes = names[part][Globaldata.generate_number(0,len(names[part])-1)]
			return clothes
		"Стопы":
			var file = FileAccess.open("res://GameData/json/Clothes.json", FileAccess.READ)
			var names = JSON.parse_string(file.get_as_text())
			file.close()
			clothes = names[part][Globaldata.generate_number(0,len(names[part])-1)]
			return clothes
		"Кольца":
			var file = FileAccess.open("res://GameData/json/Clothes.json", FileAccess.READ)
			var names = JSON.parse_string(file.get_as_text())
			file.close()
			clothes = names[part][Globaldata.generate_number(0,len(names[part])-1)]
			return clothes
		"Игрушки":
			var file = FileAccess.open("res://GameData/json/Clothes.json", FileAccess.READ)
			var names = JSON.parse_string(file.get_as_text())
			file.close()
			clothes = names[part][Globaldata.generate_number(0,len(names[part])-1)]
			return clothes


var all_parts = ["Голова","Уши","Шея","Тело","Руки","Ноги","Стопы","Колца","Игрушки"]
var clothes = ""
var rarity = 0
