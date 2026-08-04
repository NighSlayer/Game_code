class_name class_main_character

# Основные статы
func check_main_hero_health(obj):
	if main_stats.health >= 1 and main_stats.health < 2:
		obj.set_text("Критическое")
		obj.add_theme_color_override("font_color", Color(1, 0, 0, 1))
		obj.add_theme_color_override("font_hover_color", Color(1, 0, 0, 1))
	elif main_stats.health >= 2 and main_stats.health < 3:
		obj.set_text("Тяжёлое")
		obj.add_theme_color_override("font_color", Color(0.8, 0.2, 0, 1))
		obj.add_theme_color_override("font_hover_color", Color(0.8, 0.2, 0, 1))
	elif main_stats.health >= 3 and main_stats.health < 4:
		obj.set_text("Ослабленное")
		obj.add_theme_color_override("font_color", Color(0.6, 0.4, 0, 1))
		obj.add_theme_color_override("font_hover_color", Color(0.6, 0.4, 0, 1))
	elif main_stats.health >= 4 and main_stats.health < 5:
		obj.set_text("Удволитворительное")
		obj.add_theme_color_override("font_color", Color(0.4, 0.6, 0, 1))
		obj.add_theme_color_override("font_hover_color", Color(0.4, 0.6, 0, 1))
	elif main_stats.health >= 5 and main_stats.health < 6:
		obj.set_text("Хорошее")
		obj.add_theme_color_override("font_color", Color(0,0.6,0.2))
		obj.add_theme_color_override("font_hover_color", Color(0,0.6,0.2))
	elif main_stats.health >= 6 and main_stats.health < 7:
		obj.set_text("Здоров")
		obj.add_theme_color_override("font_color", Color(0.2, 0.8, 0, 1))
		obj.add_theme_color_override("font_hover_color", Color(0.2, 0.8, 0, 1))

func check_main_hero_dominance(obj):
	if main_stats.dominance >= 1 and main_stats.dominance < 2:
		obj.set_text("Пассивный")
		obj.add_theme_color_override("font_color", Color(1, 0, 0, 1))
		obj.add_theme_color_override("font_hover_color", Color(1, 0, 0, 1))
	elif main_stats.dominance >= 2 and main_stats.dominance < 3:
		obj.set_text("Покорный")
		obj.add_theme_color_override("font_color", Color(0.8, 0.2, 0, 1))
		obj.add_theme_color_override("font_hover_color", Color(0.8, 0.2, 0, 1))
	elif main_stats.dominance >= 3 and main_stats.dominance < 4:
		obj.set_text("Доминантный")
		obj.add_theme_color_override("font_color", Color(0.6, 0.4, 0, 1))
		obj.add_theme_color_override("font_hover_color", Color(0.6, 0.4, 0, 1))
	elif main_stats.dominance >= 4 and main_stats.dominance < 5:
		obj.set_text("Неприклонный")
		obj.add_theme_color_override("font_color", Color(0.4, 0.6, 0, 1))
		obj.add_theme_color_override("font_hover_color", Color(0.4, 0.6, 0, 1))
	elif main_stats.dominance >= 5 and main_stats.dominance < 6:
		obj.set_text("Несгибаемый")
		obj.add_theme_color_override("font_color", Color(0,0.6,0.2))
		obj.add_theme_color_override("font_hover_color", Color(0,0.6,0.2))
	elif main_stats.dominance >= 6 and main_stats.dominance < 7:
		obj.set_text("Властелин")
		obj.add_theme_color_override("font_color", Color(0.2, 0.8, 0, 1))
		obj.add_theme_color_override("font_hover_color", Color(0.2, 0.8, 0, 1))

func check_main_hero_endurance(obj):
	if main_stats.endurance >= 1 and main_stats.endurance < 2:
		obj.set_text("Измождённый")
		obj.add_theme_color_override("font_color", Color(1, 0, 0, 1))
		obj.add_theme_color_override("font_hover_color", Color(1, 0, 0, 1))
	elif main_stats.endurance >= 2 and main_stats.endurance < 3:
		obj.set_text("Немощный")
		obj.add_theme_color_override("font_color", Color(0.8, 0.2, 0, 1))
		obj.add_theme_color_override("font_hover_color", Color(0.8, 0.2, 0, 1))
	elif main_stats.endurance >= 3 and main_stats.endurance < 4:
		obj.set_text("Вне формы")
		obj.add_theme_color_override("font_color", Color(0.6, 0.4, 0, 1))
		obj.add_theme_color_override("font_hover_color", Color(0.6, 0.4, 0, 1))
	elif main_stats.endurance >= 4 and main_stats.endurance < 5:
		obj.set_text("В форме")
		obj.add_theme_color_override("font_color", Color(0.4, 0.6, 0, 1))
		obj.add_theme_color_override("font_hover_color", Color(0.4, 0.6, 0, 1))
	elif main_stats.endurance >= 5 and main_stats.endurance < 6:
		obj.set_text("Выносливый")
		obj.add_theme_color_override("font_color", Color(0,0.6,0.2))
		obj.add_theme_color_override("font_hover_color", Color(0,0.6,0.2))
	elif main_stats.endurance >= 6 and main_stats.endurance < 7:
		obj.set_text("Как конь")
		obj.add_theme_color_override("font_color", Color(0.2, 0.8, 0, 1))
		obj.add_theme_color_override("font_hover_color", Color(0.2, 0.8, 0, 1))

func check_main_hero_charisma(obj):
	if main_stats.charismatic >= 1 and main_stats.charismatic < 2:
		obj.set_text("Зомби")
		obj.add_theme_color_override("font_color", Color(1, 0, 0, 1))
		obj.add_theme_color_override("font_hover_color", Color(1, 0, 0, 1))
	elif main_stats.charismatic >= 2 and main_stats.charismatic < 3:
		obj.set_text("Бесхребетный")
		obj.add_theme_color_override("font_color", Color(0.8, 0.2, 0, 1))
		obj.add_theme_color_override("font_hover_color", Color(0.8, 0.2, 0, 1))
	elif main_stats.charismatic >= 3 and main_stats.charismatic < 4:
		obj.set_text("Лузер")
		obj.add_theme_color_override("font_color", Color(0.6, 0.4, 0, 1))
		obj.add_theme_color_override("font_hover_color", Color(0.6, 0.4, 0, 1))
	elif main_stats.charismatic >= 4 and main_stats.charismatic < 5:
		obj.set_text("Целеустремлённый")
		obj.add_theme_color_override("font_color", Color(0.4, 0.6, 0, 1))
		obj.add_theme_color_override("font_hover_color", Color(0.4, 0.6, 0, 1))
	elif main_stats.charismatic >= 5 and main_stats.charismatic < 6:
		obj.set_text("Волевой")
		obj.add_theme_color_override("font_color", Color(0,0.6,0.2))
		obj.add_theme_color_override("font_hover_color", Color(0,0.6,0.2))
	elif main_stats.charismatic >= 6 and main_stats.charismatic < 7:
		obj.set_text("Лидер")
		obj.add_theme_color_override("font_color", Color(0.2, 0.8, 0, 1))
		obj.add_theme_color_override("font_hover_color", Color(0.2, 0.8, 0, 1))

func check_main_hero_beauty(obj):
	if main_stats.beauty >= 1 and main_stats.beauty < 2:
		obj.set_text("Отвратительный")
		obj.add_theme_color_override("font_color", Color(1, 0, 0, 1))
		obj.add_theme_color_override("font_hover_color", Color(1, 0, 0, 1))
	elif main_stats.beauty >= 2 and main_stats.beauty < 3:
		obj.set_text("Неприятный")
		obj.add_theme_color_override("font_color", Color(0.8, 0.2, 0, 1))
		obj.add_theme_color_override("font_hover_color", Color(0.8, 0.2, 0, 1))
	elif main_stats.beauty >= 3 and main_stats.beauty < 4:
		obj.set_text("Невзрачный")
		obj.add_theme_color_override("font_color", Color(0.6, 0.4, 0, 1))
		obj.add_theme_color_override("font_hover_color", Color(0.6, 0.4, 0, 1))
	elif main_stats.beauty >= 4 and main_stats.beauty < 5:
		obj.set_text("Привлекательный")
		obj.add_theme_color_override("font_color", Color(0.4, 0.6, 0, 1))
		obj.add_theme_color_override("font_hover_color", Color(0.4, 0.6, 0, 1))
	elif main_stats.beauty >= 5 and main_stats.beauty < 6:
		obj.set_text("Импозатный")
		obj.add_theme_color_override("font_color", Color(0,0.6,0.2))
		obj.add_theme_color_override("font_hover_color", Color(0,0.6,0.2))
	elif main_stats.beauty >= 6 and main_stats.beauty < 7:
		obj.set_text("Очаровательный")
		obj.add_theme_color_override("font_color", Color(0.2, 0.8, 0, 1))
		obj.add_theme_color_override("font_hover_color", Color(0.2, 0.8, 0, 1))

func check_main_hero_libido(obj):
	if main_stats.libido >= 1 and main_stats.libido < 2:
		obj.set_text("Импотент")
		obj.add_theme_color_override("font_color", Color(1, 0, 0, 1))
		obj.add_theme_color_override("font_hover_color", Color(1, 0, 0, 1))
	elif main_stats.libido >= 2 and main_stats.libido < 3:
		obj.set_text("Вялый")
		obj.add_theme_color_override("font_color", Color(0.8, 0.2, 0, 1))
		obj.add_theme_color_override("font_hover_color", Color(0.8, 0.2, 0, 1))
	elif main_stats.libido >= 3 and main_stats.libido < 4:
		obj.set_text("Сексуальный")
		obj.add_theme_color_override("font_color", Color(0.6, 0.4, 0, 1))
		obj.add_theme_color_override("font_hover_color", Color(0.6, 0.4, 0, 1))
	elif main_stats.libido >= 4 and main_stats.libido < 5:
		obj.set_text("Страсный")
		obj.add_theme_color_override("font_color", Color(0.4, 0.6, 0, 1))
		obj.add_theme_color_override("font_hover_color", Color(0.4, 0.6, 0, 1))
	elif main_stats.libido >= 5 and main_stats.libido < 6:
		obj.set_text("Жеребец")
		obj.add_theme_color_override("font_color", Color(0,0.6,0.2))
		obj.add_theme_color_override("font_hover_color", Color(0,0.6,0.2))
	elif main_stats.libido >= 6 and main_stats.libido < 7:
		obj.set_text("Дикий Жеребец")
		obj.add_theme_color_override("font_color", Color(0.2, 0.8, 0, 1))
		obj.add_theme_color_override("font_hover_color", Color(0.2, 0.8, 0, 1))

func check_main_hero_mark(obj):
	if main_stats.mark >= 1 and main_stats.mark < 2:
		obj.set_text("Безвестное")
		obj.add_theme_color_override("font_color", Color(1, 0, 0, 1))
		obj.add_theme_color_override("font_hover_color", Color(1, 0, 0, 1))
	elif main_stats.mark >= 2 and main_stats.mark < 3:
		obj.set_text("Новичок")
		obj.add_theme_color_override("font_color", Color(0.8, 0.2, 0, 1))
		obj.add_theme_color_override("font_hover_color", Color(0.8, 0.2, 0, 1))
	elif main_stats.mark >= 3 and main_stats.mark < 4:
		obj.set_text("Профи")
		obj.add_theme_color_override("font_color", Color(0.6, 0.4, 0, 1))
		obj.add_theme_color_override("font_hover_color", Color(0.6, 0.4, 0, 1))
	elif main_stats.mark >= 4 and main_stats.mark < 5:
		obj.set_text("Известное")
		obj.add_theme_color_override("font_color", Color(0.4, 0.6, 0, 1))
		obj.add_theme_color_override("font_hover_color", Color(0.4, 0.6, 0, 1))
	elif main_stats.mark >= 5 and main_stats.mark < 6:
		obj.set_text("Знаменитое")
		obj.add_theme_color_override("font_color", Color(0,0.6,0.2))
		obj.add_theme_color_override("font_hover_color", Color(0,0.6,0.2))
	elif main_stats.mark >= 6 and main_stats.mark < 7:
		obj.set_text("Легендарное")
		obj.add_theme_color_override("font_color", Color(0.2, 0.8, 0, 1))
		obj.add_theme_color_override("font_hover_color", Color(0.2, 0.8, 0, 1))

func check_main_hero_reputation(obj):
	if main_stats.reputation >= 1 and main_stats.reputation < 2:
		obj.set_text("Козёл отпущения")
		obj.add_theme_color_override("font_color", Color(1, 0, 0, 1))
		obj.add_theme_color_override("font_hover_color", Color(1, 0, 0, 1))
	elif main_stats.reputation >= 2 and main_stats.reputation < 3:
		obj.set_text("Груша для битья")
		obj.add_theme_color_override("font_color", Color(0.8, 0.2, 0, 1))
		obj.add_theme_color_override("font_hover_color", Color(0.8, 0.2, 0, 1))
	elif main_stats.reputation >= 3 and main_stats.reputation < 4:
		obj.set_text("На побегушках")
		obj.add_theme_color_override("font_color", Color(0.6, 0.4, 0, 1))
		obj.add_theme_color_override("font_hover_color", Color(0.6, 0.4, 0, 1))
	elif main_stats.reputation >= 4 and main_stats.reputation < 5:
		obj.set_text("Мастер гильдии")
		obj.add_theme_color_override("font_color", Color(0.4, 0.6, 0, 1))
		obj.add_theme_color_override("font_hover_color", Color(0.4, 0.6, 0, 1))
	elif main_stats.reputation >= 5 and main_stats.reputation < 6:
		obj.set_text("Советник гильдии")
		obj.add_theme_color_override("font_color", Color(0,0.6,0.2))
		obj.add_theme_color_override("font_hover_color", Color(0,0.6,0.2))
	elif main_stats.reputation >= 6 and main_stats.reputation < 7:
		obj.set_text("Важная шишка")
		obj.add_theme_color_override("font_color", Color(0.2, 0.8, 0, 1))
		obj.add_theme_color_override("font_hover_color", Color(0.2, 0.8, 0, 1))

func check_main_hero_quality_of_life(obj):
	if main_stats.quality_of_life >= 1 and main_stats.quality_of_life < 2:
		obj.set_text("Нищий")
		obj.add_theme_color_override("font_color", Color(1, 0, 0, 1))
		obj.add_theme_color_override("font_hover_color", Color(1, 0, 0, 1))
	elif main_stats.quality_of_life >= 2 and main_stats.quality_of_life < 3:
		obj.set_text("Бедный")
		obj.add_theme_color_override("font_color", Color(0.8, 0.2, 0, 1))
		obj.add_theme_color_override("font_hover_color", Color(0.8, 0.2, 0, 1))
	elif main_stats.quality_of_life >= 3 and main_stats.quality_of_life < 4:
		obj.set_text("Малоимущий")
		obj.add_theme_color_override("font_color", Color(0.6, 0.4, 0, 1))
		obj.add_theme_color_override("font_hover_color", Color(0.6, 0.4, 0, 1))
	elif main_stats.quality_of_life >= 4 and main_stats.quality_of_life < 5:
		obj.set_text("Обеспеченный")
		obj.add_theme_color_override("font_color", Color(0.4, 0.6, 0, 1))
		obj.add_theme_color_override("font_hover_color", Color(0.4, 0.6, 0, 1))
	elif main_stats.quality_of_life >= 5 and main_stats.quality_of_life < 6:
		obj.set_text("Богатей")
		obj.add_theme_color_override("font_color", Color(0,0.6,0.2))
		obj.add_theme_color_override("font_hover_color", Color(0,0.6,0.2))
	elif main_stats.quality_of_life >= 6 and main_stats.quality_of_life < 7:
		obj.set_text("Элита")
		obj.add_theme_color_override("font_color", Color(0.2, 0.8, 0, 1))
		obj.add_theme_color_override("font_hover_color", Color(0.2, 0.8, 0, 1))

func check_main_hero_hygiene(obj):
	if main_stats.hygiene >= 1 and main_stats.hygiene < 2:
		obj.set_text("Покрыт коростой")
		obj.add_theme_color_override("font_color", Color(1, 0, 0, 1))
		obj.add_theme_color_override("font_hover_color", Color(1, 0, 0, 1))
	elif main_stats.hygiene >= 2 and main_stats.hygiene < 3:
		obj.set_text("Трубочист")
		obj.add_theme_color_override("font_color", Color(0.8, 0.2, 0, 1))
		obj.add_theme_color_override("font_hover_color", Color(0.8, 0.2, 0, 1))
	elif main_stats.hygiene >= 3 and main_stats.hygiene < 4:
		obj.set_text("Грязнуля")
		obj.add_theme_color_override("font_color", Color(0.6, 0.4, 0, 1))
		obj.add_theme_color_override("font_hover_color", Color(0.6, 0.4, 0, 1))
	elif main_stats.hygiene >= 4 and main_stats.hygiene < 5:
		obj.set_text("Пора мыться")
		obj.add_theme_color_override("font_color", Color(0.4, 0.6, 0, 1))
		obj.add_theme_color_override("font_hover_color", Color(0.4, 0.6, 0, 1))
	elif main_stats.hygiene >= 5 and main_stats.hygiene < 6:
		obj.set_text("Чистый")
		obj.add_theme_color_override("font_color", Color(0,0.6,0.2))
		obj.add_theme_color_override("font_hover_color", Color(0,0.6,0.2))
	elif main_stats.hygiene >= 6 and main_stats.hygiene < 7:
		obj.set_text("Чистюля")
		obj.add_theme_color_override("font_color", Color(0.2, 0.8, 0, 1))
		obj.add_theme_color_override("font_hover_color", Color(0.2, 0.8, 0, 1))

func check_main_hero_mood(obj):
	if main_stats.mood >= 1 and main_stats.mood < 2:
		obj.set_text("В отчаянии")
		obj.add_theme_color_override("font_color", Color(1, 0, 0, 1))
		obj.add_theme_color_override("font_hover_color", Color(1, 0, 0, 1))
	elif main_stats.mood >= 2 and main_stats.mood < 3:
		obj.set_text("Грустный")
		obj.add_theme_color_override("font_color", Color(0.8, 0.2, 0, 1))
		obj.add_theme_color_override("font_hover_color", Color(0.8, 0.2, 0, 1))
	elif main_stats.mood >= 3 and main_stats.mood < 4:
		obj.set_text("Печальный")
		obj.add_theme_color_override("font_color", Color(0.6, 0.4, 0, 1))
		obj.add_theme_color_override("font_hover_color", Color(0.6, 0.4, 0, 1))
	elif main_stats.mood >= 4 and main_stats.mood < 5:
		obj.set_text("Спокоен")
		obj.add_theme_color_override("font_color", Color(0.4, 0.6, 0, 1))
		obj.add_theme_color_override("font_hover_color", Color(0.4, 0.6, 0, 1))
	elif main_stats.mood >= 5 and main_stats.mood < 6:
		obj.set_text("Позитивен")
		obj.add_theme_color_override("font_color", Color(0,0.6,0.2))
		obj.add_theme_color_override("font_hover_color", Color(0,0.6,0.2))
	elif main_stats.mood >= 6 and main_stats.mood < 7:
		obj.set_text("Счастлив")
		obj.add_theme_color_override("font_color", Color(0.2, 0.8, 0, 1))
		obj.add_theme_color_override("font_hover_color", Color(0.2, 0.8, 0, 1))

# Навыки
# Обычные

func check_main_hero_mentor(obj):
	if common.mentor >= 1 and common.mentor < 2:
		obj.set_text("Не учитель")
		obj.add_theme_color_override("font_color", Color(1, 0, 0, 1))
		obj.add_theme_color_override("font_hover_color", Color(1, 0, 0, 1))
	elif common.mentor >= 2 and common.mentor < 3:
		obj.set_text("Воспитатель")
		obj.add_theme_color_override("font_color", Color(0.8, 0.2, 0, 1))
		obj.add_theme_color_override("font_hover_color", Color(0.8, 0.2, 0, 1))
	elif common.mentor >= 3 and common.mentor < 4:
		obj.set_text("Начальник")
		obj.add_theme_color_override("font_color", Color(0.6, 0.4, 0, 1))
		obj.add_theme_color_override("font_hover_color", Color(0.6, 0.4, 0, 1))
	elif common.mentor >= 4 and common.mentor < 5:
		obj.set_text("Учитель")
		obj.add_theme_color_override("font_color", Color(0.4, 0.6, 0, 1))
		obj.add_theme_color_override("font_hover_color", Color(0.4, 0.6, 0, 1))
	elif common.mentor >= 5 and common.mentor < 6:
		obj.set_text("Ментор")
		obj.add_theme_color_override("font_color", Color(0,0.6,0.2))
		obj.add_theme_color_override("font_hover_color", Color(0,0.6,0.2))
	elif common.mentor >= 6 and common.mentor < 7:
		obj.set_text("Мастер-учитель")
		obj.add_theme_color_override("font_color", Color(0.2, 0.8, 0, 1))
		obj.add_theme_color_override("font_hover_color", Color(0.2, 0.8, 0, 1))

func check_main_hero_steward(obj):
	if common.steward >= 1 and common.steward < 2:
		obj.set_text("Не дворецкий")
		obj.add_theme_color_override("font_color", Color(1, 0, 0, 1))
		obj.add_theme_color_override("font_hover_color", Color(1, 0, 0, 1))
	elif common.steward >= 2 and common.steward < 3:
		obj.set_text("Лакей")
		obj.add_theme_color_override("font_color", Color(0.8, 0.2, 0, 1))
		obj.add_theme_color_override("font_hover_color", Color(0.8, 0.2, 0, 1))
	elif common.steward >= 3 and common.steward < 4:
		obj.set_text("Мажордом")
		obj.add_theme_color_override("font_color", Color(0.6, 0.4, 0, 1))
		obj.add_theme_color_override("font_hover_color", Color(0.6, 0.4, 0, 1))
	elif common.steward >= 4 and common.steward < 5:
		obj.set_text("Дворецкий")
		obj.add_theme_color_override("font_color", Color(0.4, 0.6, 0, 1))
		obj.add_theme_color_override("font_hover_color", Color(0.4, 0.6, 0, 1))
	elif common.steward >= 5 and common.steward < 6:
		obj.set_text("Стюард")
		obj.add_theme_color_override("font_color", Color(0,0.6,0.2))
		obj.add_theme_color_override("font_hover_color", Color(0,0.6,0.2))
	elif common.steward >= 6 and common.steward < 7:
		obj.set_text("Мастер-стюард")
		obj.add_theme_color_override("font_color", Color(0.2, 0.8, 0, 1))
		obj.add_theme_color_override("font_hover_color", Color(0.2, 0.8, 0, 1))

func check_main_hero_art_director(obj):
	if common.art_director >= 1 and common.art_director < 2:
		obj.set_text("Вульгарный")
		obj.add_theme_color_override("font_color", Color(1, 0, 0, 1))
		obj.add_theme_color_override("font_hover_color", Color(1, 0, 0, 1))
	elif common.art_director >= 2 and common.art_director < 3:
		obj.set_text("Безвкусный")
		obj.add_theme_color_override("font_color", Color(0.8, 0.2, 0, 1))
		obj.add_theme_color_override("font_hover_color", Color(0.8, 0.2, 0, 1))
	elif common.art_director >= 3 and common.art_director < 4:
		obj.set_text("Некультурный")
		obj.add_theme_color_override("font_color", Color(0.6, 0.4, 0, 1))
		obj.add_theme_color_override("font_hover_color", Color(0.6, 0.4, 0, 1))
	elif common.art_director >= 4 and common.art_director < 5:
		obj.set_text("Культурный")
		obj.add_theme_color_override("font_color", Color(0.4, 0.6, 0, 1))
		obj.add_theme_color_override("font_hover_color", Color(0.4, 0.6, 0, 1))
	elif common.art_director >= 5 and common.art_director < 6:
		obj.set_text("Артист")
		obj.add_theme_color_override("font_color", Color(0,0.6,0.2))
		obj.add_theme_color_override("font_hover_color", Color(0,0.6,0.2))
	elif common.art_director >= 6 and common.art_director < 7:
		obj.set_text("Мастер-артист")
		obj.add_theme_color_override("font_color", Color(0.2, 0.8, 0, 1))
		obj.add_theme_color_override("font_hover_color", Color(0.2, 0.8, 0, 1))

func check_main_hero_medic(obj):
	if common.medic >= 1 and common.medic < 2:
		obj.set_text("Не врач")
		obj.add_theme_color_override("font_color", Color(1, 0, 0, 1))
		obj.add_theme_color_override("font_hover_color", Color(1, 0, 0, 1))
	elif common.medic >= 2 and common.medic < 3:
		obj.set_text("Медбрат")
		obj.add_theme_color_override("font_color", Color(0.8, 0.2, 0, 1))
		obj.add_theme_color_override("font_hover_color", Color(0.8, 0.2, 0, 1))
	elif common.medic >= 3 and common.medic < 4:
		obj.set_text("Плохой врач")
		obj.add_theme_color_override("font_color", Color(0.6, 0.4, 0, 1))
		obj.add_theme_color_override("font_hover_color", Color(0.6, 0.4, 0, 1))
	elif common.medic >= 4 and common.medic < 5:
		obj.set_text("Врач")
		obj.add_theme_color_override("font_color", Color(0.4, 0.6, 0, 1))
		obj.add_theme_color_override("font_hover_color", Color(0.4, 0.6, 0, 1))
	elif common.medic >= 5 and common.medic < 6:
		obj.set_text("Хороший врач")
		obj.add_theme_color_override("font_color", Color(0,0.6,0.2))
		obj.add_theme_color_override("font_hover_color", Color(0,0.6,0.2))
	elif common.medic >= 6 and common.medic < 7:
		obj.set_text("Врач хирург")
		obj.add_theme_color_override("font_color", Color(0.2, 0.8, 0, 1))
		obj.add_theme_color_override("font_hover_color", Color(0.2, 0.8, 0, 1))

func check_main_hero_combat_traning(obj):
	if common.combat_traning >= 1 and common.combat_traning < 2:
		obj.set_text("Не боец")
		obj.add_theme_color_override("font_color", Color(1, 0, 0, 1))
		obj.add_theme_color_override("font_hover_color", Color(1, 0, 0, 1))
	elif common.combat_traning >= 2 and common.combat_traning < 3:
		obj.set_text("Оруженосец")
		obj.add_theme_color_override("font_color", Color(0.8, 0.2, 0, 1))
		obj.add_theme_color_override("font_hover_color", Color(0.8, 0.2, 0, 1))
	elif common.combat_traning >= 3 and common.combat_traning < 4:
		obj.set_text("Плохой боец")
		obj.add_theme_color_override("font_color", Color(0.6, 0.4, 0, 1))
		obj.add_theme_color_override("font_hover_color", Color(0.6, 0.4, 0, 1))
	elif common.combat_traning >= 4 and common.combat_traning < 5:
		obj.set_text("Боец")
		obj.add_theme_color_override("font_color", Color(0.4, 0.6, 0, 1))
		obj.add_theme_color_override("font_hover_color", Color(0.4, 0.6, 0, 1))
	elif common.combat_traning >= 5 and common.combat_traning < 6:
		obj.set_text("Воин")
		obj.add_theme_color_override("font_color", Color(0,0.6,0.2))
		obj.add_theme_color_override("font_hover_color", Color(0,0.6,0.2))
	elif common.combat_traning >= 6 and common.combat_traning < 7:
		obj.set_text("Мастер меча")
		obj.add_theme_color_override("font_color", Color(0.2, 0.8, 0, 1))
		obj.add_theme_color_override("font_hover_color", Color(0.2, 0.8, 0, 1))

func check_main_hero_magician(obj):
	if common.magician >= 1 and common.magician < 2:
		obj.set_text("Не маг")
		obj.add_theme_color_override("font_color", Color(1, 0, 0, 1))
		obj.add_theme_color_override("font_hover_color", Color(1, 0, 0, 1))
	elif common.magician >= 2 and common.magician < 3:
		obj.set_text("Ученик")
		obj.add_theme_color_override("font_color", Color(0.8, 0.2, 0, 1))
		obj.add_theme_color_override("font_hover_color", Color(0.8, 0.2, 0, 1))
	elif common.magician >= 3 and common.magician < 4:
		obj.set_text("Слабый")
		obj.add_theme_color_override("font_color", Color(0.6, 0.4, 0, 1))
		obj.add_theme_color_override("font_hover_color", Color(0.6, 0.4, 0, 1))
	elif common.magician >= 4 and common.magician < 5:
		obj.set_text("Маг")
		obj.add_theme_color_override("font_color", Color(0.4, 0.6, 0, 1))
		obj.add_theme_color_override("font_hover_color", Color(0.4, 0.6, 0, 1))
	elif common.magician >= 5 and common.magician < 6:
		obj.set_text("Магистр")
		obj.add_theme_color_override("font_color", Color(0,0.6,0.2))
		obj.add_theme_color_override("font_hover_color", Color(0,0.6,0.2))
	elif common.magician >= 6 and common.magician < 7:
		obj.set_text("Архимаг")
		obj.add_theme_color_override("font_color", Color(0.2, 0.8, 0, 1))
		obj.add_theme_color_override("font_hover_color", Color(0.2, 0.8, 0, 1))

func check_main_hero_spanking(obj):
	if common.spanking >= 1 and common.spanking < 2:
		obj.set_text("Не умеет пороть")
		obj.add_theme_color_override("font_color", Color(1, 0, 0, 1))
		obj.add_theme_color_override("font_hover_color", Color(1, 0, 0, 1))
	elif common.spanking >= 2 and common.spanking < 3:
		obj.set_text("Азы порки")
		obj.add_theme_color_override("font_color", Color(0.8, 0.2, 0, 1))
		obj.add_theme_color_override("font_hover_color", Color(0.8, 0.2, 0, 1))
	elif common.spanking >= 3 and common.spanking < 4:
		obj.set_text("Умеет пороть")
		obj.add_theme_color_override("font_color", Color(0.6, 0.4, 0, 1))
		obj.add_theme_color_override("font_hover_color", Color(0.6, 0.4, 0, 1))
	elif common.spanking >= 4 and common.spanking < 5:
		obj.set_text("Больно порет")
		obj.add_theme_color_override("font_color", Color(0.4, 0.6, 0, 1))
		obj.add_theme_color_override("font_hover_color", Color(0.4, 0.6, 0, 1))
	elif common.spanking >= 5 and common.spanking < 6:
		obj.set_text("Знаток порки")
		obj.add_theme_color_override("font_color", Color(0,0.6,0.2))
		obj.add_theme_color_override("font_hover_color", Color(0,0.6,0.2))
	elif common.spanking >= 6 and common.spanking < 7:
		obj.set_text("Мастер кнута")
		obj.add_theme_color_override("font_color", Color(0.2, 0.8, 0, 1))
		obj.add_theme_color_override("font_hover_color", Color(0.2, 0.8, 0, 1))

func check_main_hero_tortue(obj):
	if common.tortue >= 1 and common.tortue < 2:
		obj.set_text("Не палач")
		obj.add_theme_color_override("font_color", Color(1, 0, 0, 1))
		obj.add_theme_color_override("font_hover_color", Color(1, 0, 0, 1))
	elif common.tortue >= 2 and common.tortue < 3:
		obj.set_text("Плохой палач")
		obj.add_theme_color_override("font_color", Color(0.8, 0.2, 0, 1))
		obj.add_theme_color_override("font_hover_color", Color(0.8, 0.2, 0, 1))
	elif common.tortue >= 3 and common.tortue < 4:
		obj.set_text("Палач")
		obj.add_theme_color_override("font_color", Color(0.6, 0.4, 0, 1))
		obj.add_theme_color_override("font_hover_color", Color(0.6, 0.4, 0, 1))
	elif common.tortue >= 4 and common.tortue < 5:
		obj.set_text("Умелый палач")
		obj.add_theme_color_override("font_color", Color(0.4, 0.6, 0, 1))
		obj.add_theme_color_override("font_hover_color", Color(0.4, 0.6, 0, 1))
	elif common.tortue >= 5 and common.tortue < 6:
		obj.set_text("Старательный палач")
		obj.add_theme_color_override("font_color", Color(0,0.6,0.2))
		obj.add_theme_color_override("font_hover_color", Color(0,0.6,0.2))
	elif common.tortue >= 6 and common.tortue < 7:
		obj.set_text("Инквизитор")
		obj.add_theme_color_override("font_color", Color(0.2, 0.8, 0, 1))
		obj.add_theme_color_override("font_hover_color", Color(0.2, 0.8, 0, 1))

func check_main_hero_binding(obj):
	if common.binding >= 1 and common.binding < 2:
		obj.set_text("Не умеет вязать")
		obj.add_theme_color_override("font_color", Color(1, 0, 0, 1))
		obj.add_theme_color_override("font_hover_color", Color(1, 0, 0, 1))
	elif common.binding >= 2 and common.binding < 3:
		obj.set_text("Новичок бондажа")
		obj.add_theme_color_override("font_color", Color(0.8, 0.2, 0, 1))
		obj.add_theme_color_override("font_hover_color", Color(0.8, 0.2, 0, 1))
	elif common.binding >= 3 and common.binding < 4:
		obj.set_text("Неплохо вяжет")
		obj.add_theme_color_override("font_color", Color(0.6, 0.4, 0, 1))
		obj.add_theme_color_override("font_hover_color", Color(0.6, 0.4, 0, 1))
	elif common.binding >= 4 and common.binding < 5:
		obj.set_text("Умело вяжет")
		obj.add_theme_color_override("font_color", Color(0.4, 0.6, 0, 1))
		obj.add_theme_color_override("font_hover_color", Color(0.4, 0.6, 0, 1))
	elif common.binding >= 5 and common.binding < 6:
		obj.set_text("Отлично вяжет")
		obj.add_theme_color_override("font_color", Color(0,0.6,0.2))
		obj.add_theme_color_override("font_hover_color", Color(0,0.6,0.2))
	elif common.binding >= 6 and common.binding < 7:
		obj.set_text("Мастер верёвки")
		obj.add_theme_color_override("font_color", Color(0.2, 0.8, 0, 1))
		obj.add_theme_color_override("font_hover_color", Color(0.2, 0.8, 0, 1))

# Секс
func main_hero_skills(number):
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



func _init():
	pass

var main_stats = main_stats_class.new()
var skills = skills_class.new()
var common = skills_class.common_class.new()
var sexual = skills_class.sexual_class.new()



var name_hero = "Безымянный"
var emblem_main_hero = 1
var karma = 50

#Знание мест 
var place_know = [0,0,0,0,0,0]
var place_buisness_district = [0,0,0,0]
var place_elite_district = [0,0,0,0]
var place_merchant_distirct = [0,0,0,0] 
var place_poor_district = [0,0,0,0]
var place_rich_district = [0,0,0,0]
var place_slum_district = [0,0,0,0,0]
var place_suburb_district = [0,0,0]
	
	
# Основные характеритики
class main_stats_class:
	var health = 1
	var dominance = 1
	var endurance = 1
	var charismatic = 1
	var beauty = 1
	var libido = 1
	var mark = 1
	var reputation = 1
	var quality_of_life = 1
	var hygiene = 1
	var mood = 1
# Навыки
class skills_class:
	class common_class:
		var mentor = 1
		var steward = 1
		var art_director = 1
		var medic = 1
		var combat_traning = 1
		var magician = 1
		var spanking = 1
		var tortue = 1
		var binding = 1
	# Секс навыки
	class sexual_class:
		var petting = 1
		var oral_sex = 1
		var penetration = 1
		var fetishism = 1
