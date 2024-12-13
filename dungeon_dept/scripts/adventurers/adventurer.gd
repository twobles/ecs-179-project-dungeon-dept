class_name Adventurer
extends Entity


func _ready() -> void:
	team = 0
	melee_range = 30
	super()

func face_target() -> void:
	var cur_pos = global_position
	var direction = cur_pos.direction_to(enemy.global_position)
	if direction.x < 0:
		#print("left")
		sprite.flip_h = true
		change_facing(Facing.LEFT)
	else:
		#print("right")
		sprite.flip_h = false
		change_facing(Facing.RIGHT)
