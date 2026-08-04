extends Node

var place_music



func return_name_place_music():
	return $Placemusic


func click_button():
	$Click_buttons.play()

func pause_all_music(proverka):
	$Placemusic.set_stream_paused(proverka)
	$Door.set_stream_paused(proverka)

func play_music(volume):
	$Music.set_volume_db(volume)
	$Music.play()

func play_steps(steps):
	$Steps.set_stream(load(steps))
	$Steps.play()
	
func stop_play_music():
	$Music.stop()

func stop_play_place_music(franc):
	$Placemusic.set_playing(false)
	#$Placemusic.set_stream_paused(proverka)

func place_play_music(volume):
	$Placemusic.stream = load(place_music)
	$Music.set_volume_db(volume)
	$Placemusic.play()


func open_door_music():
	stop_play_place_music(true)
	$Door.play()

func _on_door_finished():
	$Placemusic.stream = load(place_music)
	#$Placemusic.play()

func character_voice_play(path):
	$Character_voice.stream = load(path)
	$Character_voice.play()

func _sound_button_pressed():
	$Press_sound_buttons.play()

# Звуки мини-игры
func correct_choose():
	$"Mini-game_correct".play()

func incorrect_choose():
	$"Mini-game_incorrect".play()
