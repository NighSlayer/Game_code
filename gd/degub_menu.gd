extends CanvasLayer

var skip = false


func _on_check_box_toggled(toggled_on: bool) -> void:
	skip = toggled_on
	pass # Replace with function body.


func _on_add_slave_pressed() -> void:
	Globaldata.all_slaves.append(class_slave.new())
	pass # Replace with function body.
