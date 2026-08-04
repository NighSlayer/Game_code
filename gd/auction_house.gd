extends Node2D


func _ready():
	$Actions.set_visible(true)
	$Auction_quality.set_visible(false)

func _on_exit_pressed() -> void:
	get_tree().change_scene_to_file("res://scen/rich_district.tscn")


func _auction_start() -> void:
	get_tree().change_scene_to_file("res://scen/slave_auction.tscn")


func _on_buy_ticket_pressed() -> void:
	$Auction_quality/ScrollContainer.set_deferred("scroll_vertical", 0)
	$Actions.set_visible(false)
	$Auction_quality.set_visible(true)


func _on_back_pressed() -> void:
	$Actions.set_visible(true)
	$Auction_quality.set_visible(false)
