extends TextEdit

export(String) var hover_text = ""

var mouse_inside = false

func _on_TextEdit_mouse_entered():
	print("inside")
	if mouse_inside == false and get_parent().get_parent().has_node("hintbox_") == false:
		var hb = load("res://hintbox.tscn").instance()
		hb.text = hover_text
		hb.name = "hintbox_"
		hb.rect_position = get_parent().get_parent().get_local_mouse_position()
		get_parent().get_parent().add_child(hb)
	mouse_inside = true


func _on_TextEdit_mouse_exited():
	mouse_inside = false
	if get_parent().get_parent().has_node("hintbox_"):
		if mouse_inside == false:
			get_parent().get_parent().get_node("hintbox_").queue_free()
	pass # Replace with function body.
