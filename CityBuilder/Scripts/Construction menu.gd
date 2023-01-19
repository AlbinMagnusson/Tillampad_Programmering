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
	pass # Replace with function body.

func _spawn_structure():
	for i in range(unlocked_buildings.len()):
		if not unlocked_buildings[i]:
			
			unlocked_buildings[i] = true
		else:
			pass

func _on_Area2D_mouse_entered():
	mouse_on_map = true
