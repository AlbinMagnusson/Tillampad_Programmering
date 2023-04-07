extends Node2D

var option_spawned = false

var velocity := 500

signal tavern_toggled

var map_entered = false
var tavern = false

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

# var mouse_position = get_global_mouse_position()
var place_tavern

func _move_toward_mouse():
	pass
	# direction_to_mouse = mouse_position - 
"""
	else:
		direction_to_player = player.global_position - global_position
		var desired_velocity = direction_to_player.normalized() * MAX_VELOCITY
		velocity = velocity.move_toward(desired_velocity, ACCELERATION * delta)
		
		velocity = move_and_slide(velocity)
"""
		
var Building = "res://Scenes/Buildings.tscn"



func _on_MapArea_mouse_entered():
	map_entered = true

func _on_MapArea_mouse_exited():
	map_entered = false


func _on_tavern_toggled(button_pressed):
	if $"Construction menu/Tavern".visible:
		$"Construction menu/Tavern".visible = false
		emit_signal("tavern_toggled")
	else:
		$"Construction menu/Tavern".visible = true
		emit_signal("tavern_toggled")
	print($"Construction menu/Tavern".visible)


