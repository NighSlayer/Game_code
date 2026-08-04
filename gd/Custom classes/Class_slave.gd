extends Node

class_name class_slave


var type_size_boobs = ["", "A","AA","AP","B","BB","BP","C","CC","CP","D","DD","DP","E","EE","EP","F","FF","FP","G","GG","GP","H","HH","HP"]




func int_appearance_to_string(parametr):
	if parametr == "Красота":
		if appearance.beauty >= 1 and appearance.beauty < 2:
			return "Изуродована"
		elif appearance.beauty >= 2 and appearance.beauty < 3:
			return "Дурнушка"
		elif appearance.beauty >= 3 and appearance.beauty < 4:
			return "Миловидная"
		elif appearance.beauty >= 4 and appearance.beauty < 5:
			return "Привлекательная"
		elif appearance.beauty >= 5 and appearance.beauty < 6:
			return "Красавица"
		elif appearance.beauty >= 6 and appearance.beauty < 7:
			return "Королева красоты"
	if parametr == "Выносливость":
		if appearance.endurance >= 1 and appearance.endurance < 2:
			return "Измождённый"
		elif appearance.endurance >= 2 and appearance.endurance< 3:
			return "Немощная"
		elif appearance.endurance >= 3 and appearance.endurance < 4:
			return "Слабое здоровье"
		elif appearance.endurance >= 4 and appearance.endurance < 5:
			return "Здорова"
		elif appearance.endurance >= 5 and appearance.endurance < 6:
			return "Выносливая"
		elif appearance.endurance >= 6 and appearance.endurance < 7:
			return "Как лошадь"
	if parametr == "Чуствительность":
		if appearance.softness >= 1 and appearance.softness < 2:
			return "Бесчуственная"
		elif appearance.softness >= 2 and appearance.softness < 3:
			return "Огрубевшая"
		elif appearance.softness >= 3 and appearance.softness < 4:
			return "Слегка огрубевшая"
		elif appearance.softness >= 4 and appearance.softness < 5:
			return "Чусвительная"
		elif appearance.softness >= 5 and appearance.softness < 6:
			return "Нежная"
		elif appearance.softness >= 6 and appearance.softness < 7:
				return "Нежная как цветок"
	if parametr == "Сообразительность":
		if appearance.mindness >=1 and appearance.mindness < 2:
			return "Дура"
		elif appearance.mindness >=2 and appearance.mindness < 3:
			return "Глупая"
		elif appearance.mindness >=3 and appearance.mindness < 4:
			return "Недалёкая"
		elif appearance.mindness >=4 and appearance.mindness < 5:
			return "Сообразительная"
		elif appearance.mindness >=5 and appearance.mindness < 6:
			return "Умная"
		elif appearance.mindness >=6 and appearance.mindness < 7:
			return "Интеллектуальная"
	if parametr == "Телосложение":
		if appearance.psysique >= 1 and appearance.psysique <2:
			return "Как спичка"
		elif appearance.psysique >= 2 and appearance.psysique <3:
			return "Худая"
		elif appearance.psysique >= 3 and appearance.psysique <4:
			return "Стройная"
		elif appearance.psysique >= 4 and appearance.psysique <5:
			return "Полная"
		elif appearance.psysique >= 5 and appearance.psysique <6:
			return "Жирная"
		elif appearance.psysique >= 6 and appearance.psysique <7:
			return "Подтянутая"
	if parametr == "Стиль":
		if appearance.style >= 1 and appearance.style < 2:
			return "Чумичка"
		elif appearance.style >= 2 and appearance.style < 3:
			return "Невзрачная"
		elif appearance.style >= 3 and appearance.style < 4:
			return "Ухоженная"
		elif appearance.style >= 4 and appearance.style < 5:
			return "Изящная"
		elif appearance.style >= 5 and appearance.style < 6:
			return "Элегантная"
		elif appearance.style >= 6 and appearance.style < 7:
			return "Икона стиля"
	if parametr == "Характер":
		if appearance.personality >= 1 and appearance.personality < 2:
			return "Безвольная"
		elif appearance.personality >= 2 and appearance.personality < 3:
			return "Бесхребетная"
		elif appearance.personality >= 3 and appearance.personality < 4:
			return "Слабохарактерная"
		elif appearance.personality >= 4 and appearance.personality < 5:
			return "Самостоятельная"
		elif appearance.personality >= 5 and appearance.personality < 6:
			return "Твёрдый характер"
		elif appearance.personality >= 6 and appearance.personality < 7:
			return "Волевая"
	if parametr == "Ловкость":
		if appearance.agility >= 1 and appearance.agility < 2:
			return "Скованна"
		elif appearance.agility >= 2 and appearance.agility < 3:
			return "Деревянная"
		elif appearance.agility >= 3 and appearance.agility < 4:
			return "Угловатая"
		elif appearance.agility >= 4 and appearance.agility < 5:
			return "Гибкая"
		elif appearance.agility >= 5 and appearance.agility < 6:
			return "Струйная"
		elif appearance.agility >= 6 and appearance.agility < 7:
			return "Змеиная"
	if parametr == "Сила":
		if appearance.strength >= 1 and appearance.strength < 2:
			return "Хилячка"
		elif appearance.strength >= 2 and appearance.strength < 3:
			return "Слабачка"
		elif appearance.strength >= 3 and appearance.strength < 4:
			return "Дохлячка"
		elif appearance.strength >= 4 and appearance.strength < 5:
			return "Нормальная"
		elif appearance.strength >= 5 and appearance.strength < 6:
			return "Типичный боец"
		elif appearance.strength >= 6 and appearance.strength < 7:
			return "Боевая машина"

func update_submission():
	condition.submission = condition.pain + condition.awareness - condition.pamperedness - appearance.mindness - appearance.personality

#func int_anatomy_to_string(obj, parametr):
	#if parametr == "Размер груди":
		#match boobs.size:
			#1, 2, 3:
				#obj.set_text("Минимальная грудь")
				#obj.add_theme_color_override("font_color", Color(1, 0, 0, 1))
			#4, 5, 6:
				#obj.set_text("Маленька грудь")
				#obj.add_theme_color_override("font_color", Color(1, 0.5, 0, 1))
			#7, 8, 9:
				#obj.set_text("Средняя грудь")
				#obj.add_theme_color_override("font_color", Color(1, 0.75, 0, 1))
			#10, 11, 12:
				#obj.set_text("Большая грудь")
				#obj.add_theme_color_override("font_color", Color(1, 1, 0, 1))
			#13, 14, 15:
				#obj.set_text("Очень большая грудь")
				#obj.add_theme_color_override("font_color", Color(0.5, 0.5, 0, 1))
			#16, 17, 18:
				#obj.set_text("Огромная грудь")
				#obj.add_theme_color_override("font_color", Color(0.75, 1, 0, 1))
			#19, 20, 21:
				#obj.set_text("Гигантская грудь")
				#obj.add_theme_color_override("font_color", Color(0.5, 1, 0, 1))
			#22, 23, 24:
				#obj.set_text("Грудь до пола")
				#obj.add_theme_color_override("font_color", Color(0, 0.8, 0, 1))
	#
	#if parametr == "Лактация":
		#match boobs.lactation:
			#1:
				#obj.set_text("Нет лактации")
				#obj.add_theme_color_override("font_color", Color(1, 0, 0))
			#2:
				#obj.set_text("Ужасная лактация")
				#obj.add_theme_color_override("font_color", Color(0.8, 0.2, 0))
			#3:
				#obj.set_text("Небольшая лактация")
				#obj.add_theme_color_override("font_color", Color(0.6, 0.4, 0))
			#4:
				#obj.set_text("Нормальная лактация")
				#obj.add_theme_color_override("font_color", Color(0.4, 0.6, 0))
			#5:
				#obj.set_text("Гиперлактация")
				#obj.add_theme_color_override("font_color", Color(0 ,0.6, 0.2))
			#6:
				#obj.set_text("Лактация как у коровы")
				#obj.add_theme_color_override("font_color", Color(0.2, 0.8, 0))
	#
	#if parametr == "Пирсинг груди":
		#match boobs.piercing:
			#0:
				#obj.set_text("Нет")
			#1:
				#obj.set_text("Есть")
	#
	#if parametr == "Модификация груди":
		#match boobs.modification:
			#0:
				#obj.set_text("Нет")
			#1:
				#obj.set_text("Есть")
	#
	#if parametr == "Возраст":
		#match anatomy.age:
			#0:
				#obj.set_text("Младенец")
			#1:
				#obj.set_text("Лоли")
			#2:
				#obj.set_text("Молодая")
			#3:
				#obj.set_text("Милфа")
	#
	#if parametr == "Влагалище":
		#match anatomy.vagina:
			#1:
				#obj.set_text("Целка")
				#obj.add_theme_color_override("font_color", Color(0, 0.8, 0))
			#2:
				#obj.set_text("Узкое")
				#obj.add_theme_color_override("font_color", Color(0.25, 1, 0))
			#3:
				#obj.set_text("Разработаенное")
				#obj.add_theme_color_override("font_color", Color(0.5, 1, 0))
			#4:
				#obj.set_text("Не рожавшая")
				#obj.add_theme_color_override("font_color", Color(0.75, 1, 0))
			#5:
				#obj.set_text("Эластичное")
				#obj.add_theme_color_override("font_color", Color(1, 1, 0))
			#6:
				#obj.set_text("Яйцерождение")
				#obj.add_theme_color_override("font_color", Color(1, 0.75, 0))
			#7:
				#obj.set_text("Рожавшая")
				#obj.add_theme_color_override("font_color", Color(1, 0.5, 0))
			#8:
				#obj.set_text("Растянуто")
				#obj.add_theme_color_override("font_color", Color(1, 0.25))
			#9:
				#obj.set_text("Порвано")
				#obj.add_theme_color_override("font_color", Color(1, 0, 0))
	#
	#if parametr == "Анус":
		#match anatomy.anus:
			#1:
				#obj.set_text("Узкий")
				#obj.add_theme_color_override("font_color", Color(1, 0, 0, 1))
				#obj.add_theme_color_override("font_hover_color", Color(1, 0, 0, 1))
			#2:
				#obj.set_text("Плотный")
				#obj.add_theme_color_override("font_color", Color(0.8, 0.2, 0, 1))
				#obj.add_theme_color_override("font_hover_color", Color(0.8, 0.2, 0, 1))
			#3:
				#obj.set_text("Разработан")
				#obj.add_theme_color_override("font_color", Color(0.6, 0.4, 0, 1))
				#obj.add_theme_color_override("font_hover_color", Color(0.6, 0.4, 0, 1))
			#4:
				#obj.set_text("Эластичный")
				#obj.add_theme_color_override("font_color", Color(0.4, 0.6, 0, 1))
				#obj.add_theme_color_override("font_hover_color", Color(0.4, 0.6, 0, 1))
			#5:
				#obj.set_text("Растянут")
				#obj.add_theme_color_override("font_color", Color(0,0.6,0.2))
				#obj.add_theme_color_override("font_hover_color", Color(0,0.6,0.2))
			#6:
				#obj.set_text("Порван")
				#obj.add_theme_color_override("font_color", Color(0.2, 0.8, 0, 1))
				#obj.add_theme_color_override("font_hover_color", Color(0.2, 0.8, 0, 1))
	#
	#if parametr == "Пирсинг влагалища":
		#match anatomy.vagina_piercing:
			#0:
				#obj.set_text("Нет")
			#1:
				#obj.set_text("Есть")
	#
	#if parametr == "Модификация влагалища":
		#match anatomy.vagina_modification:
			#0:
				#obj.set_text("Нет")
			#1:
				#obj.set_text("Есть")
	#
	#if parametr == "Метка":
		#match anatomy.mark:
			#1:
				#obj.set_text("Чужая")
				#obj.add_theme_color_override("font_color", Color(1, 0, 0))
			#0:
				#obj.set_text("Без метки")
				#obj.add_theme_color_override("font_color", Color(1, 1, 0))
			#2:
				#obj.set_text("Моя")
				#obj.add_theme_color_override("font_color", Color(0, 1, 0))

#func int_skills_to_string(obj, number):
	#if number >= 1 and number < 2:
		#obj.set_text("D")
		#obj.add_theme_color_override("font_color", Color(1, 0, 0))
	#elif number >= 2 and number < 3:
		#obj.set_text("D+")
		#obj.add_theme_color_override("font_color", Color(1, 0.25, 0))
	#elif number >= 3 and number < 4:
		#obj.set_text("C")
		#obj.add_theme_color_override("font_color", Color(1, 0.5, 0))
	#elif number >= 4 and number < 5:
		#obj.set_text("C+")
		#obj.add_theme_color_override("font_color", Color(1, 0.75, 0))
	#elif number >= 5 and number < 6:
		#obj.set_text("B")
		#obj.add_theme_color_override("font_color", Color(1, 1, 0))
	#elif number >= 6 and number < 7:
		#obj.set_text("B+")
		#obj.add_theme_color_override("font_color", Color(0.75, 1, 0))
	#elif number >= 7 and number < 8:
		#obj.set_text("A")
		#obj.add_theme_color_override("font_color", Color(0.5, 1, 0))
	#elif number >= 8 and number < 9:
		#obj.set_text("A+")
		#obj.add_theme_color_override("font_color", Color(0.25, 1, 0))
	#elif number >= 9 and number < 10:
		#obj.set_text("S")
		#obj.add_theme_color_override("font_color", Color(0, 0.6, 0.4))
	#elif number >= 10 and number < 11:
		#obj.set_text("S+")
		#obj.add_theme_color_override("font_color", Color(0, 0.8, 0))

func sex_skill_petting_average():
	return int((sexual.handjob + sexual.footsjob + sexual.paizuri) / 3)

func sex_skill_oral_sex_average():
	return int((sexual.blowjob + sexual.drink_sperm) / 2)

func sex_skill_penetration_average():
	return int((sexual.sex + sexual.anal_sex) / 2)

func sex_skill_group_sex_average():
	return int((sexual.group + sexual.bukkake + sexual.lesbian_sex) / 3)

func sex_skill_demonstration_average():
	return int((sexual.seduction + sexual.masturbate ) / 2)

func sex_skill_fetishism_average():
	return int((sexual.bdsm + sexual.fuck_in_boobs) / 2)

func sex_skill_xenophilia_average():
	return int((sexual.doggy + sexual.pig + sexual.arachnid + sexual.horse + sexual.tentacles) / 5)

func stats_to_string(parametr):
	if parametr == "Красота":
		if appearance.beauty >= 1 and appearance.beauty < 2:
			return "Изуродована"
		elif appearance.beauty >= 2 and appearance.beauty < 3:
			return "Дурнушка"
		elif appearance.beauty >= 3 and appearance.beauty < 4:
			return "Миловидная"
		elif appearance.beauty >= 4 and appearance.beauty < 5:
			return "Привлекательная"
		elif appearance.beauty >= 5 and appearance.beauty < 6:
			return "Красавица"
		elif appearance.beauty >= 6 and appearance.beauty < 7:
			return "Королева красоты"
	
	if parametr == "Выносливость":
		if appearance.endurance >= 1 and appearance.endurance < 2:
			return "Измождённый"
		elif appearance.endurance >= 2 and appearance.endurance< 3:
			return "Немощная"
		elif appearance.endurance >= 3 and appearance.endurance < 4:
			return "Слабое здоровье"
		elif appearance.endurance >= 4 and appearance.endurance < 5:
			return "Здорова"
		elif appearance.endurance >= 5 and appearance.endurance < 6:
			return "Выносливая"
		elif appearance.endurance >= 6 and appearance.endurance < 7:
			return "Как лошадь"
	
	if parametr == "Чуствительность":
		if appearance.softness >= 1 and appearance.softness < 2:
			return "Бесчуственная"
		elif appearance.softness >= 2 and appearance.softness < 3:
			return "Огрубевшая"
		elif appearance.softness >= 3 and appearance.softness < 4:
			return "Слегка огрубевшая"
		elif appearance.softness >= 4 and appearance.softness < 5:
			return "Чуствительная"
		elif appearance.softness >= 5 and appearance.softness < 6:
			return "Нежная"
		elif appearance.softness >= 6 and appearance.softness < 7:
			return "Нежная как цветок"
		
	if parametr == "Сообразительность":
		if appearance.mindness >=1 and appearance.mindness < 2:
			return "Дура"
		elif appearance.mindness >=2 and appearance.mindness < 3:
			return "Глупая"
		elif appearance.mindness >=3 and appearance.mindness < 4:
			return "Недалёкая"
		elif appearance.mindness >=4 and appearance.mindness < 5:
			return "Сообразительная"
		elif appearance.mindness >=5 and appearance.mindness < 6:
			return "Умная"
		elif appearance.mindness >=6 and appearance.mindness < 7:
			return "Интеллектуальная"
		
	if parametr == "Телосложение":
		if appearance.psysique >= 1 and appearance.psysique <2:
			return "Как спичка"
		elif appearance.psysique >= 2 and appearance.psysique <3:
			return "Худая"
		elif appearance.psysique >= 3 and appearance.psysique <4:
			return "Стройная"
		elif appearance.psysique >= 4 and appearance.psysique <5:
			return "Полная"
		elif appearance.psysique >= 5 and appearance.psysique <6:
			return "Жирная"
		elif appearance.psysique >= 6 and appearance.psysique <7:
			return "Подтянутая"
		
	if parametr == "Стиль":
		if appearance.style >= 1 and appearance.style < 2:
			return "Чумичка"
		elif appearance.style >= 2 and appearance.style < 3:
			return "Невзрачная"
		elif appearance.style >= 3 and appearance.style < 4:
			return "Ухоженная"
		elif appearance.style >= 4 and appearance.style < 5:
			return "Изящная"
		elif appearance.style >= 5 and appearance.style < 6:
			return "Элегантная"
		elif appearance.style >= 6 and appearance.style < 7:
			return "Икона стиля"
		
	if parametr == "Характер":
		if appearance.personality >= 1 and appearance.personality < 2:
			return "Безвольная"
		elif appearance.personality >= 2 and appearance.personality < 3:
			return "Бесхребетная"
		elif appearance.personality >= 3 and appearance.personality < 4:
			return "Слабохарактерная"
		elif appearance.personality >= 4 and appearance.personality < 5:
			return "Самостоятельная"
		elif appearance.personality >= 5 and appearance.personality < 6:
			return "Твёрдый характер"
		elif appearance.personality >= 6 and appearance.personality < 7:
			return "Волевая"
		
	if parametr == "Ловкость":
		if appearance.personality >= 1 and appearance.personality < 2:
			return "Королева ступора"
		elif appearance.personality >= 2 and appearance.personality < 3:
			return "Недотёпа"
		elif appearance.personality >= 3 and appearance.personality < 4:
			return "Заторможенная"
		elif appearance.personality >= 4 and appearance.personality < 5:
			return "Нормальная"
		elif appearance.personality >= 5 and appearance.personality < 6:
			return "Сноровистая"
		elif appearance.personality >= 6 and appearance.personality < 7:
			return "Пантера на ногах"
	
	if parametr == "Сила":
		if appearance.personality >= 1 and appearance.personality < 2:
			return "Хилячка"
		elif appearance.personality >= 2 and appearance.personality < 3:
			return "Слабачка"
		elif appearance.personality >= 3 and appearance.personality < 4:
			return "Дохлячка"
		elif appearance.personality >= 4 and appearance.personality < 5:
			return "Нормальная"
		elif appearance.personality >= 5 and appearance.personality < 6:
			return "Типичный боец"
		elif appearance.personality >= 6 and appearance.personality < 7:
			return "Боевая машина"
	
	if parametr == "Размер груди":
		match boobs.size:
			1, 2, 3:
				return "Минимальная грудь"
			4, 5, 6:
				return "Маленька грудь"
			7, 8, 9:
				return "Средняя грудь"
			10, 11, 12:
				return "Большая грудь"
			13, 14, 15:
				return "Очень большая грудь"
			16, 17, 18:
				return "Огромная грудь"
			19, 20, 21:
				return "Гигантская грудь"
			22, 23, 24:
				return "Грудь до пола"
	
	if parametr == "Лактация":
		match boobs.lactation:
			1:
				return "Нет лактации"
			2:
				return "Ужасная лактация"
			3:
				return "Небольшая лактация"
			4:
				return "Нормальная лактация"
			5:
				return "Гиперлактация"
			6:
				return "Лактация как у коровы"
	
	if parametr == "Пирсинг груди":
		match int(boobs.piercing):
			0:
				return "Отсутствует"
			1:
				return "Есть"
	
	if parametr == "Модификация груди":
		match int(boobs.modification):
			0:
				return "Отсутсвеут"
			1:
				return "Есть"
	
	if parametr == "Возраст":
		match anatomy.age:
			0:
				return "Младенец"
			1:
				return "Лоли"
			2:
				return "Молодая"
			3:
				return "Милфа"
	
	if parametr == "Влагалище":
		match anatomy.vagina:
			1,2,3:
				return "Целка"
			4,5,6:
				return "Узкое"
			7,8,9:
				return "Разработаенное"
			10,11,12:
				return "Эластичное"
			13,14,15:
				return "Яйцерождение"
			16,17,18:
				return "Рожавшая"
			19,20,21:
				return "Растянуто"
			22,23,24:
				return "Порвано"
	
	if parametr == "Матка":
		match anatomy.womb:
			0:
				return "Яйценоска"
			1:
				return "Девственно чиста"
			2:
				return "Чиста"
			3:
				return "Остатки спермы"
			4:
				return "Есть сперма"
			5:
				return "Полна спермы"
			6:
				return "Переполненна спермой"
			7:
				return "Беременна"
	
	if parametr == "Анус":
		match anatomy.anus:
			1:
				return "Узкий"
			2:
				return "Плотный"
			3:
				return "Разработан"
			4:
				return "Эластичный"
			5:
				return "Растянут"
			6:
				return "Порван"
	
	if parametr == "Пирсинг влагалища":
		match int(anatomy.vagina_piercing):
			0:
				return "Отсутствует"
			1:
				return "Есть"
	
	if parametr == "Модификация влагалища":
		match int(anatomy.vagina_modification):
			0:
				return "Отсутствует"
			1:
				return "Есть"
	
	if parametr == "Метка":
		match anatomy.mark:
			1:
				return "Чужая метка"
			0:
				return "Без метки"
			2:
				return "Моя метка"

func skills_to_picture(number):
	if number >= 1 and number < 2:
		return load("res://GameData/img/Game/Interface/Image stats/0.5 звезды.png")
	elif number >= 2 and number < 3:
		return load("res://GameData/img/Game/Interface/Image stats/1 звезда.png")
	elif number >= 3 and number < 4:
		return load("res://GameData/img/Game/Interface/Image stats/1.5 звезды.png")
	elif number >= 4 and number < 5:
		return load("res://GameData/img/Game/Interface/Image stats/2 звезды.png")
	elif number >= 5 and number < 6:
		return load("res://GameData/img/Game/Interface/Image stats/2.5 звезды.png")
	elif number >= 6 and number < 7:
		return load("res://GameData/img/Game/Interface/Image stats/3 звезды.png")
	elif number >= 7 and number < 8:
		return load("res://GameData/img/Game/Interface/Image stats/3.5 звезды.png")
	elif number >= 8 and number < 9:
		return load("res://GameData/img/Game/Interface/Image stats/4 звезды.png")
	elif number >= 9 and number < 10:
		return load("res://GameData/img/Game/Interface/Image stats/4.5 звезды.png")
	elif number >= 10 and number < 11:
		return load("res://GameData/img/Game/Interface/Image stats/5 звёзд.png")

func wear_slave(slave_body_part,index_wear_clothes):
	match slave_body_part:
		0:
			if index_wear_clothes != -1:
				if clothes.head != "Ничего":
					Globaldata.all_clothes[slave_body_part].append(clothes.head)
				clothes.head = Globaldata.all_clothes[slave_body_part][index_wear_clothes]
				Globaldata.all_clothes[slave_body_part].remove_at(index_wear_clothes)
			else:
				Globaldata.all_clothes[slave_body_part].append(clothes.head)
				clothes.head = "Ничего"
		1:
			if index_wear_clothes != -1:
				if clothes.ears != "Ничего":
					Globaldata.all_clothes[slave_body_part].append(clothes.ears)
				clothes.ears = Globaldata.all_clothes[slave_body_part][index_wear_clothes]
				Globaldata.all_clothes[slave_body_part].remove_at(index_wear_clothes)
			else:
				Globaldata.all_clothes[slave_body_part].append(clothes.ears)
				clothes.ears = "Ничего"
		2:
			if index_wear_clothes != -1:
				if clothes.neck != "Ничего":
					Globaldata.all_clothes[slave_body_part].append(clothes.neck)
				clothes.neck = Globaldata.all_clothes[slave_body_part][index_wear_clothes]
				Globaldata.all_clothes[slave_body_part].remove_at(index_wear_clothes)
			else:
				Globaldata.all_clothes[slave_body_part].append(clothes.neck)
				clothes.neck = "Ничего"
		3:
			if index_wear_clothes != -1:
				if clothes.body != "Ничего":
					Globaldata.all_clothes[slave_body_part].append(clothes.body)
				clothes.body = Globaldata.all_clothes[slave_body_part][index_wear_clothes]
				Globaldata.all_clothes[slave_body_part].remove_at(index_wear_clothes)
			else:
				Globaldata.all_clothes[slave_body_part].append(clothes.body)
				clothes.body = "Ничего"
		4:
			if index_wear_clothes != -1:
				if clothes.hands != "Ничего":
					Globaldata.all_clothes[slave_body_part].append(clothes.hands)
				clothes.hands = Globaldata.all_clothes[slave_body_part][index_wear_clothes]
				Globaldata.all_clothes[slave_body_part].remove_at(index_wear_clothes)
			else:
				Globaldata.all_clothes[slave_body_part].append(clothes.hands)
				clothes.hands = "Ничего"
		5:
			if index_wear_clothes != -1:
				if clothes.legs != "Ничего":
					Globaldata.all_clothes[slave_body_part].append(clothes.legs)
				clothes.legs = Globaldata.all_clothes[slave_body_part][index_wear_clothes]
				Globaldata.all_clothes[slave_body_part].remove_at(index_wear_clothes)
			else:
				Globaldata.all_clothes[slave_body_part].append(clothes.legs)
				clothes.legs = "Ничего"
		6:
			if index_wear_clothes != -1:
				if clothes.foot != "Ничего":
					Globaldata.all_clothes[slave_body_part].append(clothes.foot)
				clothes.foot = Globaldata.all_clothes[slave_body_part][index_wear_clothes]
				Globaldata.all_clothes[slave_body_part].remove_at(index_wear_clothes)
			else:
				Globaldata.all_clothes[slave_body_part].append(clothes.foot)
				clothes.foot = "Ничего"
		7:
			if index_wear_clothes != -1:
				if clothes.ring != "Ничего":
					Globaldata.all_clothes[slave_body_part].append(clothes.ring)
				clothes.ring = Globaldata.all_clothes[slave_body_part][index_wear_clothes]
				Globaldata.all_clothes[slave_body_part].remove_at(index_wear_clothes)
			else:
				Globaldata.all_clothes[slave_body_part].append(clothes.ring)
				clothes.ring = "Ничего"
		8:
			if index_wear_clothes != -1:
				if clothes.toy != "Ничего":
					Globaldata.all_clothes[slave_body_part].append(clothes.toy)
				clothes.toy = Globaldata.all_clothes[slave_body_part][index_wear_clothes]
				Globaldata.all_clothes[slave_body_part].remove_at(index_wear_clothes)
			else:
				Globaldata.all_clothes[slave_body_part].append(clothes.toy)
				clothes.toy = "Ничего"

func generate_parametrs():
	var file = FileAccess.open("res://GameData/json/Slaves_name.json", FileAccess.READ)
	var names = JSON.parse_string(file.get_as_text())
	file.close()
	
	slave_name = names[Globaldata.generate_number(0,96)]
	# Состояние
	condition.pain = 0
	condition.excitement = 0
	condition.fear = 0
	condition.despair = 0
	condition.awareness = 0
	condition.habit = 0
	condition.pamperedness = 0
	condition.loyalty = 0
	condition.love = 0
	condition.embarrassment = 0
	condition.submission = 0
	condition.jealousy = 0
	# Внешний вид
	appearance.beauty = Globaldata.generate_number(1,6)
	appearance.endurance = Globaldata.generate_number(1,6)
	appearance.softness = Globaldata.generate_number(1,6)
	appearance.mindness = Globaldata.generate_number(1,6)
	appearance.psysique = Globaldata.generate_number(1,6)
	appearance.style = Globaldata.generate_number(1,6)
	appearance.personality = Globaldata.generate_number(1,6)
	appearance.agility = Globaldata.generate_number(1,6)
	appearance.strength = Globaldata.generate_number(1,6)
	# Анатомия
	boobs.size = Globaldata.generate_number(1,24)
	boobs.lactation = Globaldata.generate_number(1,6)
	boobs.piercing = false
	boobs.modification = false
	anatomy.age = Globaldata.generate_number(0,3)
	anatomy.vagina = Globaldata.generate_number(1,24)
	anatomy.womb = Globaldata.generate_number(0,7)
	anatomy.anus = Globaldata.generate_number(1,6)
	anatomy.vagina_piercing = bool(Globaldata.generate_number(0,1))
	anatomy.vagina_modification = bool(Globaldata.generate_number(0,1))
	anatomy.mark = Globaldata.generate_number(0,1)
	if randf() > 0.5:
		anatomy.virgin = true
	else:
		anatomy.virgin = false
	
	#Навыки
	#Обычные
	common.housekeeping = Globaldata.generate_number(1,10)
	common.cooking = Globaldata.generate_number(1,10)
	common.medicine = Globaldata.generate_number(1,10)
	common.paperwork = Globaldata.generate_number(1,10)
	common.etiquette_and_rehetoric = Globaldata.generate_number(1,10)
	common.combat_traning = Globaldata.generate_number(1,10)
	common.dancer = Globaldata.generate_number(1,10)
	common.singer = Globaldata.generate_number(1,10)
	common.musician = Globaldata.generate_number(1,10)
	common.animal = Globaldata.generate_number(1,10)
	common.embroidery = Globaldata.generate_number(1,10)
	common.farming = Globaldata.generate_number(1,10)
	# Секс навыки
	sexual.handjob = Globaldata.generate_number(1,10)
	sexual.footsjob = Globaldata.generate_number(1,10)
	sexual.paizuri = Globaldata.generate_number(1,10)
	sexual.petting = sex_skill_petting_average()
	
	sexual.blowjob = Globaldata.generate_number(1,10)
	sexual.drink_sperm = Globaldata.generate_number(1,10)
	sexual.oral = sex_skill_oral_sex_average()
	
	sexual.sex = Globaldata.generate_number(1,10)
	sexual.anal_sex = Globaldata.generate_number(1,10)
	sexual.penetration = sex_skill_penetration_average()
	
	sexual.group = Globaldata.generate_number(1,10)
	sexual.bukkake = Globaldata.generate_number(1,10)
	sexual.lesbian_sex = Globaldata.generate_number(1,10)
	sexual.unique_sex = sex_skill_group_sex_average()
	
	sexual.seduction = Globaldata.generate_number(1,10)
	sexual.masturbate = Globaldata.generate_number(1,10)
	sexual.demonstration = sex_skill_demonstration_average()
	
	sexual.bdsm = Globaldata.generate_number(1,10)
	sexual.fuck_in_boobs = Globaldata.generate_number(1,10)
	sexual.fetishism = sex_skill_fetishism_average()
	
	sexual.doggy = Globaldata.generate_number(1,10)
	sexual.pig = Globaldata.generate_number(1,10)
	sexual.arachnid = Globaldata.generate_number(1,10)
	sexual.horse = Globaldata.generate_number(1,10)
	sexual.tentacles = Globaldata.generate_number(1,10)
	sexual.xenophilia = sex_skill_xenophilia_average()
	
	clothes.body = Globaldata.generate_number(1,2)
	match(clothes.body):
		1:
			clothes.body = "Ничего"
		2:
			clothes.body = "Роба раба"
	
	var number_to_path = Globaldata.generate_number(1,556)
	img.full = "res://GameData/img/Game/Girls/Full/Auctions/" + str(number_to_path) + ".png"
	img.boobs = int_anatomy_boobs_to_picture()
	img.pussy = int_anatomy_pussy_to_picture()
	img.pussy_in = int_anatomy_pussy_in_to_picture()
	
	file = FileAccess.open("res://GameData/json/Slaves/" + str(number_to_path) + ".txt", FileAccess.READ)
	var content = file.get_as_text()
	file.close()
	if type_size_boobs[boobs.size] != content:
		boobs.modification = true
	if boobs.size % 3 == 0:
		boobs.piercing = true
		match Globaldata.generate_number(1,3):
			1:
				clothes.nipples = "Иглы"
			2:
				clothes.nipples = "Кольца"
			3:
				clothes.nipples = "Цепочка"
	
	match(Globaldata.generate_number(1,3)):
		1:
			religiosity.belief = "Неверие"
			religiosity.belief_power = -1
		2:
			religiosity.belief = "Нейтральная"
			religiosity.belief_power = 0
		3:
			religiosity.belief = "Полная вера"
			religiosity.belief_power = 1
	
	match (Globaldata.generate_number(1,4)):
		1:
			worldview.vision = "Злое"
			worldview.view_power = -1
		2:
			worldview.vision = "Несправидливое"
			worldview.view_power = -0.5
		3:
			worldview.vision = "Справедливое"
			worldview.view_power = 0.5
		4:
			worldview.vision = "Доброе"
			worldview.view_power = 1
	

func generate_certian_parametrs(chossen_name,array_parametrs):
	# Проверка параметров
	if chossen_name != "":
		slave_name = chossen_name
	else:
		var file = FileAccess.open("res://GameData/json/Slaves_name.json", FileAccess.READ)
		var names = JSON.parse_string(file.get_as_text())
		file.close()
		slave_name = names[Globaldata.generate_number(0,96)]
	
	# Состояние
	condition.pain = Globaldata.generate_number(array_parametrs[1],array_parametrs[2])
	condition.excitement = Globaldata.generate_number(array_parametrs[3],array_parametrs[4])
	condition.fear = Globaldata.generate_number(array_parametrs[5],array_parametrs[6])
	condition.despair = Globaldata.generate_number(array_parametrs[7],array_parametrs[8])
	condition.awareness = Globaldata.generate_number(array_parametrs[9],array_parametrs[10])
	condition.habit = Globaldata.generate_number(array_parametrs[11],array_parametrs[12])
	condition.pamperedness = Globaldata.generate_number(array_parametrs[13],array_parametrs[14])
	condition.loyalty = Globaldata.generate_number(array_parametrs[15],array_parametrs[16])
	condition.love = Globaldata.generate_number(array_parametrs[17],array_parametrs[18])
	condition.embarrassment = Globaldata.generate_number(array_parametrs[19],array_parametrs[20])
	condition.submission = Globaldata.generate_number(array_parametrs[21],array_parametrs[22])
	condition.jealousy = Globaldata.generate_number(array_parametrs[23],array_parametrs[24])
	# Внешний вид
	appearance.beauty = Globaldata.generate_number(array_parametrs[25],array_parametrs[26])
	appearance.endurance = Globaldata.generate_number(array_parametrs[27],array_parametrs[28])
	appearance.softness = Globaldata.generate_number(array_parametrs[29],array_parametrs[30])
	appearance.mindness = Globaldata.generate_number(array_parametrs[31],array_parametrs[32])
	appearance.psysique = Globaldata.generate_number(array_parametrs[33],array_parametrs[34])
	appearance.style = Globaldata.generate_number(array_parametrs[35],array_parametrs[36])
	appearance.personality = Globaldata.generate_number(array_parametrs[37],array_parametrs[38])
	appearance.agility = Globaldata.generate_number(array_parametrs[39],array_parametrs[40])
	appearance.strength = Globaldata.generate_number(array_parametrs[41],array_parametrs[42])
	# Анатомия
	boobs.size = Globaldata.generate_number(array_parametrs[43],array_parametrs[44])
	boobs.lactation = Globaldata.generate_number(array_parametrs[45],array_parametrs[46])
	boobs.piercing = Globaldata.generate_number(array_parametrs[47],array_parametrs[48])
	boobs.modification = Globaldata.generate_number(array_parametrs[39],array_parametrs[50])
	anatomy.age = Globaldata.generate_number(array_parametrs[51],array_parametrs[52])
	anatomy.vagina = Globaldata.generate_number(array_parametrs[53],array_parametrs[54])
	anatomy.womb = Globaldata.generate_number(array_parametrs[55],array_parametrs[56])
	anatomy.anus = Globaldata.generate_number(array_parametrs[57],array_parametrs[58])
	anatomy.vagina_piercing = bool(Globaldata.generate_number(array_parametrs[59],array_parametrs[60]))
	anatomy.vagina_modification = bool(Globaldata.generate_number(array_parametrs[61],array_parametrs[62]))
	anatomy.mark = bool(Globaldata.generate_number(array_parametrs[63],array_parametrs[64]))
	anatomy.virgin = bool(Globaldata.generate_number(array_parametrs[65],array_parametrs[66]))
	
	#Навыки
	#Обычные
	common.housekeeping = Globaldata.generate_number(array_parametrs[67],array_parametrs[68])
	common.cooking = Globaldata.generate_number(array_parametrs[69],array_parametrs[70])
	common.medicine = Globaldata.generate_number(array_parametrs[71],array_parametrs[72])
	common.paperwork = Globaldata.generate_number(array_parametrs[73],array_parametrs[74])
	common.etiquette_and_rehetoric = Globaldata.generate_number(array_parametrs[75],array_parametrs[76])
	common.combat_traning = Globaldata.generate_number(array_parametrs[77],array_parametrs[78])
	common.dancer = Globaldata.generate_number(array_parametrs[79],array_parametrs[80])
	common.singer = Globaldata.generate_number(array_parametrs[81],array_parametrs[82])
	common.musician = Globaldata.generate_number(array_parametrs[83],array_parametrs[84])
	common.animal = Globaldata.generate_number(array_parametrs[85],array_parametrs[56])
	common.embroidery = Globaldata.generate_number(array_parametrs[87],array_parametrs[88])
	common.farming = Globaldata.generate_number(array_parametrs[89],array_parametrs[90])
	# Секс навыки
	sexual.handjob = Globaldata.generate_number(array_parametrs[91],array_parametrs[92])
	sexual.footsjob = Globaldata.generate_number(array_parametrs[93],array_parametrs[94])
	sexual.paizuri = Globaldata.generate_number(array_parametrs[95],array_parametrs[96])
	sexual.petting = sex_skill_petting_average()
	
	sexual.blowjob = Globaldata.generate_number(array_parametrs[97],array_parametrs[98])
	sexual.drink_sperm = Globaldata.generate_number(array_parametrs[99],array_parametrs[100])
	sexual.oral = sex_skill_oral_sex_average()
	
	sexual.sex = Globaldata.generate_number(array_parametrs[101],array_parametrs[102])
	sexual.anal_sex = Globaldata.generate_number(array_parametrs[103],array_parametrs[104])
	sexual.penetration = sex_skill_penetration_average()
	
	sexual.group = Globaldata.generate_number(array_parametrs[105],array_parametrs[106])
	sexual.bukkake = Globaldata.generate_number(array_parametrs[107],array_parametrs[108])
	sexual.lesbian_sex = Globaldata.generate_number(array_parametrs[109],array_parametrs[110])
	sexual.unique_sex = sex_skill_group_sex_average()
	
	sexual.seduction = Globaldata.generate_number(array_parametrs[111],array_parametrs[112])
	sexual.masturbate = Globaldata.generate_number(array_parametrs[113],array_parametrs[114])
	sexual.demonstration = sex_skill_demonstration_average()
	
	sexual.bdsm = Globaldata.generate_number(array_parametrs[115],array_parametrs[116])
	sexual.fuck_in_boobs = Globaldata.generate_number(array_parametrs[117],array_parametrs[118])
	sexual.fetishism = sex_skill_fetishism_average()
	
	sexual.doggy = Globaldata.generate_number(array_parametrs[119],array_parametrs[120])
	sexual.pig = Globaldata.generate_number(array_parametrs[121],array_parametrs[122])
	sexual.arachnid = Globaldata.generate_number(array_parametrs[123],array_parametrs[124])
	sexual.horse = Globaldata.generate_number(array_parametrs[125],array_parametrs[126])
	sexual.tentacles = Globaldata.generate_number(array_parametrs[127],array_parametrs[128])
	sexual.xenophilia = sex_skill_xenophilia_average()
	
	clothes.body = Globaldata.generate_number(array_parametrs[129],array_parametrs[130])
	match(clothes.body):
		1:
			clothes.body = "Ничего"
		2:
			clothes.body = "Роба раба"
	
	var number_to_path = Globaldata.generate_number(1,556)
	img.full = "res://GameData/img/Game/Girls/Full/Auctions/" + str(number_to_path) + ".png"
	img.boobs = int_anatomy_boobs_to_picture()
	img.pussy = int_anatomy_pussy_to_picture()
	img.pussy_in = int_anatomy_pussy_in_to_picture()
	
	var file_path = FileAccess.open("res://GameData/json/Slaves/" + str(number_to_path) + ".txt", FileAccess.READ)
	var content = file_path.get_as_text()
	file_path.close()
	if type_size_boobs[boobs.size] != content:
		boobs.modification = true
	if boobs.size % 3 == 0:
		boobs.piercing = true
		match Globaldata.generate_number(1,4):
			1:
				clothes.nipples = "Иглы"
			2:
				clothes.nipples = "Кольца"
			3:
				clothes.nipples = "Цепочка"

func print_stats():
	print(slave_name)
	print("---------------")
	# Состояние 
	print("Состояние ")
	print("---------------")
	print("Покорность " + str(condition.submission))
	print("Возбуждение " + str(condition.excitement))
	print("Страх " + str(condition.fear))
	print("Отчаяние " + str(condition.despair))
	print("Озонанность " + str(condition.awareness))
	print("Испольнительность " + str(condition.taming))
	print("Привычка " + str(condition.habit))
	print("Изблованость " + str(condition.pamperedness))
	print("Преданость " + str(condition.loyalty))
	print("Влюблённость " + str(condition.love))
	print("Ревность " + str(condition.jealousy))
	print("---------------")
	# Внешний вид
	print("Внешний вид")
	print("---------------")
	print("Красота " + str(appearance.beauty))
	
	print("Чуствительность " + str(appearance.softness))
	print("Ум " + str(appearance.mindness))
	print("Телосложение " + str(appearance.psysique))
	print("Стиль " + str(appearance.style))
	print("Характер " + str(appearance.personality))
	print("Выносливость " + str(appearance.endurance))
	print("Ловкость " + str(appearance.agility))
	print("Сила " + str(appearance.strength))
	print("---------------")
	# Анатомия
	print("Анатомия")
	print("---------------")
	print("Размер груди " + str(boobs.size))
	print("Лактация " + str(boobs.lactation))
	print("Пирсинг груди " + str(boobs.piercing))
	print("Модификация груди " + str(boobs.modification))
	print("Возраст " + str(anatomy.age))
	print("Статус пизды " + str(anatomy.vagina))
	print("Статус ануса " + str(anatomy.anus))
	print("Пирсинг пизды " + str(anatomy.vagina_piercing))
	print("Модификация пизды " + str(anatomy.vagina_modification))
	print("Метка " + str(anatomy.mark))
	print("---------------")
	#Навыки
	print("Навыки")
	print("---------------")
	#Обычные
	print("Обычные ")
	print("--------")
	print("Домоводство " + str(common.housekeeping))
	print("Готовка " + str(common.cooking))
	print("Медик " + str(common.medicine))
	print("Делопроизводство " + str(common.paperwork))
	print("Этикет и риторика " + str(common.etiquette_and_rehetoric))
	print("Боевая подготовка " + str(common.combat_traning))
	print("Танцор " + str(common.dancer))
	print("Певец " + str(common.singer))
	print("Музыкант " + str(common.musician))
	print("Животное " + str(common.animal))
	print("Вышивание " + str(common.embroidery))
	print("Фермерство " + str(common.farming))
	print("---------------")
	# Секс навыки
	print("Секс навыки ")
	print("---------------")
	print("Работа руками " + str(sexual.handjob))
	print("Работа ногами " + str(sexual.footsjob))
	print("--------")
	print("Минет " + str(sexual.blowjob))
	print("Употребление спермы " + str(sexual.drink_sperm))
	print("--------")
	print("Соблазнение " + str(sexual.seduction))
	print("Мастурбация " + str(sexual.masturbate))
	print("--------")
	print("Секс " + str(sexual.sex))
	print("Альный секс " + str(sexual.anal_sex))
	print("--------")
	print("Групповуха " + str(sexual.group))
	print("Буккаке " + str(sexual.bukkake))
	print("Лесбисекс " + str(sexual.lesbian_sex))
	print("--------")
	print("БДСМ " + str(sexual.bdsm))
	print("Трах в соски " + str(sexual.fuck_in_boobs))
	print("--------")
	print("Кобель " + str(sexual.doggy))
	print("Хряк " + str(sexual.pig))
	print("Арахнид " + str(sexual.arachnid))
	print("Жеребец " + str(sexual.horse))
	print("Тентакли " + str(sexual.tentacles))
	print("---------------")
	print("Одежда")
	print("---------------")
	print("Голова " + clothes.head)
	print("Уши " + clothes.ears)
	print("Язык " + clothes.tongue)
	print("Шея " + clothes.neck)
	print("Тело " + clothes.body)
	print("В пупке " + clothes.bellybutton)
	print("Руки " + clothes.hands)
	print("Соски " + clothes.nipples)
	print("Ноги " + clothes.legs)
	print("Клитор " + clothes.clitoris)
	print("Левое кольцо " + clothes.left_ring)
	print("Правое кольцо " + clothes.right_ring)

func save_slave():
	var data_to_send = {
		"Имя": slave_name,
		"Энергия":energy,
		"Время работы":time_work,
		"Путь к картинке":{
			"Лицо":img.img_face,
			"Всё тело":img.img_full,
			"Грудь":img.img_boobs,
			"Влагалище":img.img_pussy,
			"Матка":img.img_pussy_in},
		"Психика":{
			"Покорность":condition.submission,
			"Возбуждение":condition.excitement,
			"Страх":condition.fear,
			"Отчаяние":condition.despair,
			"Осознанность":condition.awareness,
			"Исполнительность":condition.taming,
			"Привычка":condition.habit,
			"Избалованность":condition.pamperedness,
			"Преданность":condition.loyalty,
			"Влюблённость":condition.love,
			"Ревность":condition.jealousy
		},
		"Внешний вид":{
			"Красота":appearance.beauty,
			"Нежность":appearance.softness,
			"Сообразительность":appearance.mindness,
			"Телосложение":appearance.psysique,
			"Стиль":appearance.style,
			"Характер":appearance.personality,
			"Выносливость":appearance.endurance,
			"Ловкость":appearance.agility,
			"Сила":appearance.strength
		},
		"Анатомия":{
			"Грудь":{
				"Размер":boobs.size,
				"Лактация":boobs.lactation,
				"Пирсинг":boobs.piercing,
				"Модификация":boobs.modification
			},
			"Возраст":anatomy.age,
			"Влагалище":anatomy.vagina,
			"Матка":anatomy.womb,
			"Анус":anatomy.anus,
			"Пирсинг влагалища":anatomy.vagina_piercing,
			"Модификация влагалища":anatomy.vagina_modification,
			"Метка":anatomy.mark,
			"Девстевнность":anatomy.virgin
		},
		"Навыки":{
			"Обычные":{
				"Уборка":common.housekeeping,
				"Готовка":common.cooking,
				"Медицина":common.medicine,
				"Бухгалтерия":common.paperwork,
				"Этикет и риторика":common.etiquette_and_rehetoric,
				"Боевая подготовка":common.combat_traning,
				"Танцовщица":common.dancer,
				"Певица":common.singer,
				"Музыкант":common.musician,
				"Животное":common.animal,
				"Вышивание":common.embroidery,
				"Ферма":common.farming,
			},
			"Сексуальные":{
				"Петтинг":sexual.petting,
				"Работа руками":sexual.handjob,
				"Работа ногами":sexual.footsjob,
				"Пайзури":sexual.paizuri,
				"Оральные услуги":sexual.oral,
				"Питье":sexual.drink_sperm,
				"Минет":sexual.blowjob,
				"Пенетрация":sexual.penetration,
				"Секс":sexual.sex,
				"Анальный секс":sexual.anal_sex,
				"Необычный секс":sexual.unique_sex,
				"Групповуха":sexual.group,
				"Буккаке":sexual.bukkake,
				"Лесби секс":sexual.lesbian_sex,
				"Демонстрация":sexual.demonstration,
				"Соблазнение":sexual.seduction,
				"Мастурбация":sexual.masturbate,
				"Фетишизм":sexual.fetishism,
				"БДСМ":sexual.bdsm,
				"Трах в соски":sexual.fuck_in_boobs,
				"Ксенофилия":sexual.xenophilia,
				"Кабель":sexual.doggy,
				"Свинья":sexual.pig,
				"Арахнид":sexual.arachnid,
				"Конь":sexual.horse,
				"Тентакли":sexual.tentacles,
			}
		},
		"Одежда":{
			"Голова":clothes.head,
			"Уши":clothes.ears,
			"Язык":clothes.tongue,
			"Шея":clothes.neck,
			"Тело":clothes.body,
			"Пупок":clothes.bellybutton,
			"Руки":clothes.hands,
			"Соски":clothes.nipples,
			"Ноги":clothes.legs,
			"Клитор":clothes.clitoris,
			"Левое кольцо":clothes.left_ring,
			"Правое кольцо":clothes.right_ring,
		}
	}
		#"":,
	return data_to_send

func update_pictures_anatomy():
	img.boobs = int_anatomy_boobs_to_picture()
	img.pussy = int_anatomy_pussy_to_picture()
	img.pussy_in = int_anatomy_pussy_in_to_picture()

func int_anatomy_pussy_in_to_picture():
	match anatomy.womb:
		0:
			return "res://GameData/img/Game/Girls/Body/Матка/Матка с яйцами.png"
		1,2:
			return "res://GameData/img/Game/Girls/Body/Матка/Пустая Матка.png"
		3:
			return "res://GameData/img/Game/Girls/Body/Матка/Матка с 1 вариантом спермы.png"
		4:
			return "res://GameData/img/Game/Girls/Body/Матка/Матка с 2 вариантом спермы.png"
		5:
			return "res://GameData/img/Game/Girls/Body/Матка/Матка с 3 вариантом спермы.png"
		6:
			return "res://GameData/img/Game/Girls/Body/Матка/Матка с 4 вариантом спермы.png"
		7:
			match Globaldata.generate_number(1,2):
				1:
					return "res://GameData/img/Game/Girls/Body/Матка/Беременность вариант 1.png"
				2:
					return "res://GameData/img/Game/Girls/Body/Матка/Беременность вариант 2.png"

func int_anatomy_boobs_to_picture():
	match boobs.size:
		1:
			return "res://GameData/img/Pic/boobs_A.jpg"
		2:
			return "res://GameData/img/Pic/boobs_AA.jpg"
		3:
			return "res://GameData/img/Pic/boobs_AP.jpg"
		4:
			return "res://GameData/img/Pic/boobs_B.jpg"
		5:
			return "res://GameData/img/Pic/boobs_BB.jpg"
		6:
			return "res://GameData/img/Pic/boobs_BP.jpg"
		7:
			return "res://GameData/img/Pic/boobs_C.jpg"
		8:
			return "res://GameData/img/Pic/boobs_CC.jpg"
		9:
			return "res://GameData/img/Pic/boobs_CP.jpg"
		10:
			return "res://GameData/img/Pic/boobs_D.jpg"
		11:
			return "res://GameData/img/Pic/boobs_DD.jpg"
		12:
			return "res://GameData/img/Pic/boobs_DP.jpg"
		13:
			return "res://GameData/img/Pic/boobs_E.jpg"
		14:
			return "res://GameData/img/Pic/boobs_EE.jpg"
		15:
			return "res://GameData/img/Pic/boobs_EP.jpg"
		16:
			return "res://GameData/img/Pic/boobs_F.jpg"
		17:
			return "res://GameData/img/Pic/boobs_FF.jpg"
		18:
			return "res://GameData/img/Pic/boobs_FP.jpg"
		19:
			return "res://GameData/img/Pic/boobs_G.jpg"
		20:
			return "res://GameData/img/Pic/boobs_GG.jpg"
		21:
			return "res://GameData/img/Pic/boobs_GP.jpg"
		22:
			return "res://GameData/img/Pic/boobs_H.jpg"
		23:
			return "res://GameData/img/Pic/boobs_HH.jpg"
		24:
			return "res://GameData/img/Pic/boobs_HP.jpg"

func int_anatomy_pussy_to_picture():
	# Недоработаны варианты со спермой
	if clothes.toy == "Ничего":
		if  (anatomy.womb < 2 or anatomy.womb == 6):
			match anatomy.vagina:
				1,2,3:
					return "res://GameData/img/Game/Girls/Body/Пизда/Целка и Узкое/Пусто.jpg"
				4,5,6:
					return "res://GameData/img/Game/Girls/Body/Пизда/Целка и Узкое/Пусто.jpg"
				7,8,9:
					return "res://GameData/img/Game/Girls/Body/Пизда/Разработанное/Пусто.jpg"
				10,11,12:
					return "res://GameData/img/Game/Girls/Body/Пизда/Эластичное и Яйцерождение/Пусто.jpg"
				13,14,15:
					return "res://GameData/img/Game/Girls/Body/Пизда/Эластичное и Яйцерождение/Пусто.jpg"
				16,17,18:
					return "res://GameData/img/Game/Girls/Body/Пизда/Растянуто/Пусто.jpg"
				19,20,21:
					return "res://GameData/img/Game/Girls/Body/Пизда/Надорвано/Пусто.jpg"
				22,23,24:
					return "res://GameData/img/Game/Girls/Body/Пизда/Разорвано/Пусто.jpg"
		else:
			match anatomy.vagina:
				1,2,3:
					return "res://GameData/img/Game/Girls/Body/Пизда/Целка и Узкое/Со спермой.jpg"
				4,5,6:
					return "res://GameData/img/Game/Girls/Body/Пизда/Целка и Узкое/Со спермой.jpg"
				7,8,9:
					return "res://GameData/img/Game/Girls/Body/Пизда/Разработанное/Со спермой.jpg"
				10,11,12:
					return "res://GameData/img/Game/Girls/Body/Пизда/Эластичное и Яйцерождение/Со спермой.jpg"
				13,14,15:
					return "res://GameData/img/Game/Girls/Body/Пизда/Эластичное и Яйцерождение/Со спермой.jpg"
				16,17,18:
					return "res://GameData/img/Game/Girls/Body/Пизда/Растянуто/Со спермой.jpg"
				19,20,21:
					return "res://GameData/img/Game/Girls/Body/Пизда/Надорвано/Со спермой.jpg"
				22,23,24:
					return "res://GameData/img/Game/Girls/Body/Пизда/Разорвано/Со спермой.jpg"
	else:
		match clothes.toy:
			"Яйцо":
				match anatomy.vagina:
					1,2,3:
						return "res://GameData/img/Game/Girls/Body/Пизда/Целка и Узкое/С яйцом.jpg"
					4,5,6:
						return "res://GameData/img/Game/Girls/Body/Пизда/Целка и Узкое/С яйцом.jpg"
					7,8,9:
						return "res://GameData/img/Game/Girls/Body/Пизда/Разработанное/С яйцом.jpg"
					10,11,12:
						return "res://GameData/img/Game/Girls/Body/Пизда/Эластичное и Яйцерождение/С яйцом.jpg"
					13,14,15:
						return "res://GameData/img/Game/Girls/Body/Пизда/Эластичное и Яйцерождение/С яйцом.jpg"
					16,17,18:
						return "res://GameData/img/Game/Girls/Body/Пизда/Растянуто/С яйцом.jpg"
					19,20,21:
						return "res://GameData/img/Game/Girls/Body/Пизда/Надорвано/С яйцом.jpg"
					22,23,24:
						return "res://GameData/img/Game/Girls/Body/Пизда/Разорвано/С яйцом.jpg"
			"Шарики":
				match anatomy.vagina:
					1,2,3:
						return "res://GameData/img/Game/Girls/Body/Пизда/Целка и Узкое/С шариками.jpg"
					4,5,6:
						return "res://GameData/img/Game/Girls/Body/Пизда/Целка и Узкое/С шариками.jpg"
					7,8,9:
						return "res://GameData/img/Game/Girls/Body/Пизда/Разработанное/С шариками.jpg"
					10,11,12:
						return "res://GameData/img/Game/Girls/Body/Пизда/Эластичное и Яйцерождение/С шариками.jpg"
					13,14,15:
						return "res://GameData/img/Game/Girls/Body/Пизда/Эластичное и Яйцерождение/С шариками.jpg"
					16,17,18:
						return "res://GameData/img/Game/Girls/Body/Пизда/Растянуто/С шариками.jpg"
					19,20,21:
						return "res://GameData/img/Game/Girls/Body/Пизда/Надорвано/С шариками.jpg"
					22,23,24:
						return "res://GameData/img/Game/Girls/Body/Пизда/Разорвано/С шариками.jpg"
			"Фаллоиметатор":
				match anatomy.vagina:
					1,2,3:
						return "res://GameData/img/Game/Girls/Body/Пизда/Целка и Узкое/С фаллоимитатором.jpg"
					4,5,6:
						return "res://GameData/img/Game/Girls/Body/Пизда/Целка и Узкое/С фаллоимитатором.jpg"
					7,8,9:
						return "res://GameData/img/Game/Girls/Body/Пизда/Разработанное/С фаллоимитатором.jpg"
					10,11,12:
						return "res://GameData/img/Game/Girls/Body/Пизда/Эластичное и Яйцерождение/С фаллоимитатором.jpg"
					13,14,15:
						return "res://GameData/img/Game/Girls/Body/Пизда/Эластичное и Яйцерождение/С фаллоимитатором.jpg"
					16,17,18:
						return "res://GameData/img/Game/Girls/Body/Пизда/Растянуто/С фаллоимитатором.jpg"
					19,20,21:
						return "res://GameData/img/Game/Girls/Body/Пизда/Надорвано/С фаллоимитатором.jpg"
					22,23,24:
						return "res://GameData/img/Game/Girls/Body/Пизда/Разорвано/С фаллоимитатором.jpg"
			4:
				match anatomy.vagina:
					1,2,3:
						return "res://GameData/img/Game/Girls/Body/Пизда/Целка и Узкое/С яйцом и шариками.jpg"
					4,5,6:
						return "res://GameData/img/Game/Girls/Body/Пизда/Целка и Узкое/С яйцом и шариками.jpg"
					7,8,9:
						return "res://GameData/img/Game/Girls/Body/Пизда/Разработанное/С яйцом и шариками.jpg"
					10,11,12:
						return "res://GameData/img/Game/Girls/Body/Пизда/Эластичное и Яйцерождение/С яйцом и шариками.jpg"
					13,14,15:
						return "res://GameData/img/Game/Girls/Body/Пизда/Эластичное и Яйцерождение/С яйцом и шариками.jpg"
					16,17,18:
						return "res://GameData/img/Game/Girls/Body/Пизда/Растянуто/С яйцом и шариками.jpg"
					19,20,21:
						return "res://GameData/img/Game/Girls/Body/Пизда/Надорвано/С яйцом и шариками.jpg"
					22,23,24:
						return "res://GameData/img/Game/Girls/Body/Пизда/Разорвано/С яйцом и шариками.jpg"
			5:
				match anatomy.vagina:
					1,2,3:
						return "res://GameData/img/Game/Girls/Body/Пизда/Целка и Узкое/С яйцом и фаллоимитатором.jpg"
					4,5,6:
						return "res://GameData/img/Game/Girls/Body/Пизда/Целка и Узкое/С яйцом и фаллоимитатором.jpg"
					7,8,9:
						return "res://GameData/img/Game/Girls/Body/Пизда/Разработанное/С яйцом и фаллоимитатором.jpg"
					10,11,12:
						return "res://GameData/img/Game/Girls/Body/Пизда/Эластичное и Яйцерождение/С яйцом и фаллоимитатором.jpg"
					13,14,15:
						return "res://GameData/img/Game/Girls/Body/Пизда/Эластичное и Яйцерождение/С яйцом и фаллоимитатором.jpg"
					16,17,18:
						return "res://GameData/img/Game/Girls/Body/Пизда/Растянуто/С яйцом и фаллоимитатором.jpg"
					19,20,21:
						return "res://GameData/img/Game/Girls/Body/Пизда/Надорвано/С яйцом и фаллоимитатором.jpg"
					22,23,24:
						return "res://GameData/img/Game/Girls/Body/Пизда/Разорвано/С яйцом и фаллоимитатором.jpg"

func show_if_aviability(obj,number):
	if number >= 0 and number < Globaldata.all_slaves.size():
		obj.set_visible(true)
		print(obj)
	else:
		obj.set_visible(false)

func count_time_work():
	if time_work != 0:
		time_work -= 1
		return true
	else:
		return false

func relationships_to_text(number):
	if number <= 100 and number > 75:
		return "Преданность"
	elif number <= 75 and number > 50:
		return "Дружба"
	elif number <= 50 and number > 25:
		return "Симпатия"
	elif number <= 25 and number > -25:
		return "Нейтральное"
	elif number > -25 and number <= -50:
		return "Подозрительность"
	elif number > -50 and number <= -75:
		return "Неприязнь"
	elif number > -75 and number <= -100:
		return "Вражда"
	

var condition = condition_class.new()
var appearance = appearance_class.new()
var anatomy = anatomy_class.new()
var boobs = anatomy_class.boobs_class.new()
var skills = skills_class.new()
var common = skills_class.common_class.new()
var sexual = skills_class.sexual_class.new()
var clothes = clothes_class.new()
var img = img_class.new()
var religiosity = religiosity_class.new()
var worldview = worldview_class.new()

func _init():
	generate_parametrs()
	#print_stats()
	

var slave_name = "Сакура"
var energy = 10
var time_work = 0


class img_class:
	var face = ""
	var full = ""
	var boobs = ""
	var pussy = ""
	var pussy_in = ""

# Психика 
class condition_class:
	var pain = 0
	var excitement = 0
	var fear = 0
	var despair = 0
	var awareness = 0
	var habit = 0
	var pamperedness = 0
	var loyalty = 0
	var love = 0
	var embarrassment = 0
	var submission = 0
	var jealousy = 0
	
# Внешний вид
class appearance_class:
	var beauty = 0
	var softness = 0
	var mindness = 0
	var psysique = 0
	var style = 0
	var personality = 0
	var endurance = 0
	var agility = 0
	var strength = 0
# Анатомия
class anatomy_class:
	class boobs_class:
		var size = 0
		var lactation = 0
		var piercing = false
		var modification = false
	var age = 0
	var vagina = 0
	var womb = 0
	var anus = 0
	var vagina_piercing = false
	var vagina_modification = false
	var mark = 0
	var virgin
#Навыки
class skills_class:
	#Обычные
	class common_class:
		var housekeeping = 0
		var cooking = 0
		var medicine = 0
		var paperwork = 0
		var etiquette_and_rehetoric = 0
		var combat_traning = 0
		var dancer = 0
		var singer = 0
		var musician = 0
		var animal = 0
		var embroidery = 0
		var farming = 0
	# Секс навыки
	class sexual_class:
		# Петтинг
		var petting = 0
		var handjob = 0
		var footsjob = 0
		var paizuri = 0
		# Оральные ласки
		var oral = 0
		var drink_sperm = 0
		var blowjob = 0
		# Пенетрация
		var penetration = 0
		var sex = 0
		var anal_sex = 0
		# Групповой секс
		var unique_sex = 0
		var group = 0
		var bukkake = 0
		var lesbian_sex = 0
		# Демонстрация
		var demonstration = 0
		var seduction = 0
		var masturbate = 0
		# Фетишизм
		var fetishism = 0
		var bdsm = 0
		var fuck_in_boobs = 0
		# Ксенофилия
		var xenophilia = 0
		var doggy = 0
		var pig = 0
		var arachnid = 0
		var horse = 0
		var tentacles = 0

# Одежда
class clothes_class:
	var head = "Ничего"
	var ears = "Ничего"
	var tongue = "Ничего"
	var neck = "Ничего"
	var body = "Ничего"
	var bellybutton = "Ничего"
	var hands = "Ничего"
	var nipples = "Ничего"
	var legs = "Ничего"
	var foot = "Ничего"
	var clitoris = "Ничего"
	var ring = "Ничего"
	var toy = "Ничего"


# Отношения
var relationships =  {}
var can_talk = true

# Религиозность
class religiosity_class:
	var belief = "Ничего"
	var belief_power = 0

# Мировозрение
class worldview_class:
	var vision = "Ничего"
	var view_power = 0
