extends Panel

var level = 1

var rng = RandomNumberGenerator.new()

var church = "res://Images/Structure_textures/Golden cross.png"
var hospital = "res://Images/Structure_textures/Red_cross.png"
var tavern = "res://Images/Structure_textures/Tavern.png"
var house
var blacksmith
var trade_hall

var unlocked_buildings = get_node("Main_script").get("unlocked_buildings")

var roof_tiles = [preload("res://Images/Structure_textures/classicroofing1/ClassicRoofing_1 (1).png"),
preload("res://Images/Structure_textures/classicroofing1/ClassicRoofing_1 (2).png"), 
preload("res://Images/Structure_textures/classicroofing1/ClassicRoofing_1 (3).png"),
preload("res://Images/Structure_textures/classicroofing1/ClassicRoofing_1 (4).png"),
preload("res://Images/Structure_textures/classicroofing1/ClassicRoofing_1 (5).png"),
preload("res://Images/Structure_textures/classicroofing1/ClassicRoofing_1 (6).png"),
preload("res://Images/Structure_textures/classicroofing1/ClassicRoofing_1 (7).png"),
preload("res://Images/Structure_textures/classicroofing1/ClassicRoofing_1 (8).png"),
preload("res://Images/Structure_textures/classicroofing1/ClassicRoofing_1 (9).png")]

var roof_tile_len = len(roof_tiles)

func _ready():
	pass # Replace with function body.

func generate_textures():
	for i in range(len(unlocked_buildings)):
		var current_building = unlocked_buildings.pop_front()
		if current_building:
			var roof = TextureRect.new()
			roof = rng.randomize(1, roof_tile_len)
			var symbol = TextureRect.new()
			symbol = current_building
			var sprite = Sprite.new()
			sprite = symbol + roof
			$Structure_scene.add_child(sprite)
		else:
			pass
	
	
	
	
# Plans:
# Every farm, house etc. are stored as a seperate court(ck3 style),
# with the man(who has largest most familymembers living there) of
# the house/farm being the owner of the court
# 
