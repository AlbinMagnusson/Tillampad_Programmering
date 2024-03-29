extends Node2D

signal Research_increased

var church_toggled = false
var hospital_toggled = false
var tavern_toggled = false
var house_toggled = false
var blacksmith_toggled = false
var tradehall_toggled = false
var university_toggled = false

var structure_toggled = [church_toggled, hospital_toggled, 
tavern_toggled, house_toggled, blacksmith_toggled, 
tradehall_toggled, university_toggled]
# State-stats:
var state_stats = {"gold":50, "development":0}
# Resources owned:
var resources = {"lumber":0, "stone":0, "wheat":0, "meat":0, 
"barrley":0, "grapes":0, "water":0}
# Reasource production:
var production = {"lumber":0, "stone":0, "wheat":0, "meat":0, 
"barrley":0, "grapes":0, "water":0}
# Resources made from resources:
var Tier2_resources = {"planks":0, "beer":0, "whine":0,
"brick":0}
# Secondary production:
var Tier2_production = {"planks":0, "beer":0, "whine":0,
"brick":0}
# Personal-stats
var character_stats = {"age":18, "notoriety":0, "glory":0, 
"reputation":0}
# Daily change stats:
var income = {"gold":1, "development":0} 
# Buildings
var church = "res://Images/Structure_textures/Golden cross.png"
var hospital = "res://Images/Structure_textures/Red_cross.png"
var tavern = "res://Images/Structure_textures/Tavern.png"
var house
var blacksmith
var trade_hall
var university
var unlocked_buildings = []
# Research

onready var research_progress = get_node("HUD/Control/reasearch_progress")
var research_speed = 1
var church_level = 1
var hospital_level = 1
var tavern_level = 1
var university_level = 0
var house_level = 0
var blacksmith_level = 0
var trade_hall_level = 0
var researched_object = church
var researching = false

"""
func Startstop_research_toggled(button_pressed):
	if researching:
		gold_income -= 1
"""
var level = [church_level, hospital_level, tavern_level, house_level, 
blacksmith_level, trade_hall_level]


func _ready():
	pass



func _on_Time_timeout():
	if researching:
		emit_signal("Research_increased")
	# print("works")
	state_stats["gold"] += income["gold"]
	state_stats["development"] += income["development"]
		# state_stats[stats[i-1]] += income[stats[i-1]]
	# state_stats["notoriety"] += income["notoriety"]
	# glory += income.get("glory")
	# reputation += glory + notoriety
	character_stats["age"] += 0.014
	if character_stats["age"] >= RandomNumberGenerator.new().randf_range(55, 70):
		print("Dead")
	# print(character_stats["age"])
	# if $HUD/Control/research_progress.value >= $HUD/Control/research_progress.max_value:
		#level = level_up()
		# $HUD/Control/research_progress.max_value = 10*pow(2, level[researched_object])
		#$HUD/Control/research_progress.value = 0
	
"""
func level_up():
	level[researched_object] += 1
	if level[researched_object] == 1:
		unlocked_buildings.append(level[researched_object])
	else:
		pass
	return level
"""

func _on_Startstop_reasearch_toggled(button_pressed):
	# print("works")
	if researching:
		researching = false
	else:
		researching = true



func _on_City_map_tavern_toggled():
	if tavern_toggled:
		tavern_toggled = false
	else:
		tavern_toggled = true
#		$"Construction menu/Tavern".position = get_local_mouse_position()
"""
func _physics_process(delta):
	while tavern_toggled:
		$"City map/Construction menu/Tavern".move((get_global_mouse_position() - $"City map/Construction menu/Tavern".get_pos()).normalized() * 500 * delta)
"""
var speed = 1
func _on_Speed_toggle_button_up():
	if $Time.wait_time > 0.3126 and not $Time.paused:
		$Time.wait_time /= 2
		speed += 1
		$"HUD/Speed toggle".text = "Toggle speed: " + str(speed)
	elif $Time.wait_time < 0.3126 and not $Time.paused:
		$Time.paused = true
		$"HUD/Speed toggle".text = "Paused"
	else:
		$Time.paused = false
		$Time.wait_time = 2.5
		speed = 1
		$"HUD/Speed toggle".text = "Toggle speed: " + str(speed)
		
	print($Time.wait_time)

