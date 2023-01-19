extends Control

var reasearching = Main_script.reasearching

func _on_Research_menu_toggled(button_pressed): # Ready function
	var research_menu = load("res://Scenes/Research interface.tscn")
	add_child(research_menu)
	visible = true

func _on_Startstop_research_toggled(button_pressed):
	$ProgressBar
