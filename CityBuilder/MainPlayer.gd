extends Node2D

const ACCELERATION = 1500


var max_velocity := 500
var direction := Vector2.RIGHT
var velocity := Vector2.ZERO
var player_rotation := 0

func _ready() -> void:
	#Startposition på skärmen
	global_position = Vector2(300, 300)
	
func _walk_up(delta: float) -> void:
	# Move up
	if Input.is_action_pressed("Move up") and global_position.y > 0:
		player_rotation = 0
		var desired_velocity := direction.rotated(rotation) * max_velocity
		velocity = velocity.move_toward(desired_velocity, ACCELERATION * delta)
	elif Input.is_action_pressed("Move down") and global_position.y < 600:
		player_rotation = 180
		var desired_velocity := direction.rotated(rotation) * max_velocity
		velocity = velocity.move_toward(desired_velocity, ACCELERATION * delta)
	elif Input.is_action_pressed("Move right") and global_position.x < 1024:
		player_rotation = 90
		var desired_velocity := direction.rotated(rotation) * max_velocity
		velocity = velocity.move_toward(desired_velocity, ACCELERATION * delta)
	elif Input.is_action_pressed("Move left") and global_position.x > 0:
		player_rotation = 270
		var desired_velocity := direction.rotated(rotation) * max_velocity
		velocity = velocity.move_toward(desired_velocity, ACCELERATION * delta)
	else:
		velocity = velocity.move_toward(Vector2.ZERO, ACCELERATION * delta)

