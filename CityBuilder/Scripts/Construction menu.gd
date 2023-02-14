extends Node2D

var church = false
var hospital = false
var tavern = false
var house = false
var blacksmit = false
var trade_hall = false
var university = false
var unlocked_buildings = [house]
var mouse_on_map = false

func _ready():
	pass
	# if mouse_on_map and 

func _spawn_structure():
	pass

func _on_Area2D_mouse_entered():
	mouse_on_map = true

func _on_MapArea_mouse_exited():
	mouse_on_map = false


func _on_tavern_toggled(button_pressed):
	while get_node("Tavern").position != global_position:
		get_node("Tavern").position
