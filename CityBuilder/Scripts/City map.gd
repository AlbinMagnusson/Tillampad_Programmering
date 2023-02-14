extends Node2D

var option_spawned = false

var velocity := 500
var direction := Vector2.LEFT

var map_entered = false

func _ready():
	pass # Replace with function body.

		
func _building_placement():
	
	pass
	

"""
func _on_tavern_toggled(button_pressed):
	if map_entered and Input.is_action_pressed("left_click"):
		add_child($"Construction menu/GridContainer2/tavern")
	elif Input.is_action_pressed("right_click"):
		return false
	
"""


func _on_MapArea_area_entered(area):
	map_entered = true
	
func _on_MapArea_area_exited(area):
	map_entered = false



func _on_Research_menu_toggled(button_pressed):
	if visible:
		visible = false
	else:
		visible = true


func _on_Construction_menu_toggled(button_pressed):
	if get_node("Construction menu").visible:
		get_node("Construction menu").visible = false
	else:
		get_node("Construction menu").visible = true
