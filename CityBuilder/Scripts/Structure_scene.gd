extends Node2D

var rng = RandomNumberGenerator.new()

var church = "res://Images/Structure_textures/Golden cross.png"
var hospital = "res://Images/Structure_textures/Red_cross.png"
var tavern = "res://Images/Structure_textures/Tavern.png"

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

var structures = [church, hospital, tavern]

func _ready():
	pass # Replace with function body.

func generate_texture():
	var placeholder_name1 = []
	for i in range(len(structures)):
		placeholder_name1.append(rng.randomize(1, roof_tile_len))
	for i in range(len(structures)):
		var sprite = Sprite.new()
		$Structure_scene.add_child(sprite)
		var symbol = TextureRect.new()
		symbol = structures.pop_front()
		var roof = TextureRect.new()
		roof = placeholder_name1.pop_front()
		
	
	
