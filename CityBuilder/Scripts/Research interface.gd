extends Control

# var reasearching = Main_script.reasearching


func _on_Research_menu_toggled(button_pressed): # Ready function
	if visible:
		visible = false
	else:
		visible = true

"""
func _on_Startstop_research_toggled(button_pressed):
	$ProgressBar
"""

# 


func _on_Startstop_reasearch_toggled(button_pressed):
	get_node("reasearch_progress").value += 1
	
