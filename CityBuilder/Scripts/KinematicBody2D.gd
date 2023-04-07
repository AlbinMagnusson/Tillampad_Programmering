extends KinematicBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


const MAX_VELOCITY = 350
const ACCELERATION = 500

var is_dead := false
var velocity := Vector2.ZERO
var direction_to_player := Vector2.ZERO

var player = null

# var alienGreenExplosion_scene = $"../Tavern"


func _physics_process(delta: float) -> void:
	if player == null:
		return
	else:
		direction_to_player = player.global_position - global_position
		var desired_velocity = direction_to_player.normalized() * MAX_VELOCITY
		velocity = velocity.move_toward(desired_velocity, ACCELERATION * delta)
		
		velocity = move_and_slide(velocity)

func _on_City_map_tavern_toggled():
	if player == null:
		player = true
	else:
		player = null
