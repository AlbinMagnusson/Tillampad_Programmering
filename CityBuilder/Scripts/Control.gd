extends Control


func _ready():
	pass # Replace with function body.


func _on_Research_menu_toggled(button_pressed):
	if visible:
		visible = false
	else:
		visible = true



var true_level = 1
var level = pow(2, true_level)

func _on_Main_Research_increased():
	$research_progress.value += 10/level
	if $research_progress.value >= 100:
		true_level += 1
		level = pow(3, true_level)
		$research_progress.value = 0
		print(level)


func _on_Startstop_research_toggled(button_pressed):
	if $"Startstop research".text != "Stop research":
		$"Startstop research".text = "Stop research"
	else:
		$"Startstop research".text = "Start research"
