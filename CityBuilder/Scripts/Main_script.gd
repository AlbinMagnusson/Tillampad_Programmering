extends Node2D

# ck3 convertability
var development = 0

# State-stats:
var gold = 50
var notoriety = 0
var glory = 0
var reputation = notoriety + glory

# Production:
var lumber = 0
var stone = 0
var wheat = 0
var meat = 0
var barrley = 0
var brick = 0
var grapes = 0
var water = 0

# Secondary production:
var planks = 0
var beer = 0
var wine = 0


# Personal-stats
var age = 18

# Daily change stats:
var income = {"gold":1, "notoriety":0.1, "glory":0.1}

var church = "res://Images/Structure_textures/Golden cross.png"
var hospital = "res://Images/Structure_textures/Red_cross.png"
var tavern = "res://Images/Structure_textures/Tavern.png"
var house
var blacksmith
var trade_hall
var university
var unlocked_buildings = []

var reasearch = 0
var reasearch_speed = 1
var church_level = 1
var hospital_level = 1
var tavern_level = 1
var university_level = 0
var house_level = 0
var blacksmith_level = 0
var trade_hall_level = 0

var reasearched_object = null
var reasearching = false

"""
func Startstop_research_toggled(button_pressed):
	if researching:
		gold_income -= 1
"""

var level = [church_level, hospital_level, tavern_level, house_level, 
blacksmith_level, trade_hall_level]

func _ready():
	
	pass # Replace with function body.

func _on_Time_timeout():
	if reasearching:
		reasearch += reasearch_speed
	gold += income.get("gold")
	notoriety += income.get("notoriety")
	glory += income.get("glory")
	reputation = glory + notoriety
	age += 1/12
	if reasearch == 10*pow(2, level[reasearched_object]):
		level = level_up()
		reasearch = 0
	


func level_up():
	level[reasearched_object] += 1
	if level[reasearched_object] == 1:
		unlocked_buildings.append(level[reasearched_object])
	else:
		pass
	return level



func _on_Research_menu_toggled(button_pressed):
	var research_menu = load("res://Scenes/Research interface.tscn")
	add_child(research_menu)

