extends Node2D



# State-stats:
var gold = 50
var notoriety = 0
var glory = 0
var reputation = notoriety + glory
var development = 0

var state_stats = {gold:50, notoriety:0, glory:0, reputation:0, 
development:0}

# Production:
var lumber = 0
var stone = 0
var wheat = 0
var meat = 0
var barrley = 0
var brick = 0
var grapes = 0
var water = 0

var reasources = {"lumber":0, "stone":0, "wheat":0, "meat":0, 
"barrley":0, "grapes":0, "water":0}

# Secondary production:
var planks = 0
var beer = 0
var wine = 0

var secondary_production = {"planks":0, "beer":0, "whine":0,
"brick":0}

# Personal-stats
var age = 18

var character_stats = {"age":0}

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
	pass

