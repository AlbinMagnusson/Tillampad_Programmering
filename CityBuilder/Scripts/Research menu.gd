extends Button

func _ready():
	pass # Replace with function body.



func _on_Construction_menu_toggled(button_pressed):
	if visible:
		visible = false
	else:
		visible = true
