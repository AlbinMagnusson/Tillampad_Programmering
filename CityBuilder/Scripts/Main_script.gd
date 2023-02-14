extends Node2D

signal Research_increased

# State-stats:
var state_stats = {"gold":50, "notoriety":0, "glory":0, 
"reputation":0, "development":0}
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
var character_stats = {"age":18}
# Daily change stats:
var income = {"gold":1, "notoriety":0.1, "glory":0.1}
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
var stats = ["gold", "notoriety", "glory", 
"reputation", "development"]

func _ready():
	pass

func _on_Time_timeout():
	if researching:
		emit_signal("Research increased")
	for i in range(state_stats.len()):
		state_stats[stats[i-1]] += income[stats[i-1]]
	state_stats["notoriety"] += income["notoriety"]
	# glory += income.get("glory")
	# reputation += glory + notoriety
	character_stats["age"] += 1/12
	if research_progress.value >= research_progress.max_value:
		level = level_up()
		research_progress.max_value = 10*pow(2, level[researched_object])
		research_progress.value = 0

func level_up():
	level[researched_object] += 1
	if level[researched_object] == 1:
		unlocked_buildings.append(level[researched_object])
	else:
		pass
	return level

func _on_Startstop_reasearch_toggled(button_pressed):
	if researching:
		researching = false
		print(Time.wait_time)
	else:
		researching = true
		print(Time.wait_time)
