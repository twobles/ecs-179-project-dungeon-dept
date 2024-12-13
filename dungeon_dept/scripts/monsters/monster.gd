class_name Monster
extends Entity

# cost to deploy
@export var cost: float = 0.0

var type: MonsterFactory.MonsterType

func _ready() -> void:
	cost = 100.0
	#movement_speed = 4000.0
	team = 1
	facing = Facing.LEFT
	super()

func face_target() -> void:
	var cur_pos = global_position
	var direction = cur_pos.direction_to(enemy.global_position)
	if direction.x < 0:
		#print("left")
		sprite.flip_h = false
		change_facing(Facing.LEFT)
	else:
		#print("right")
		sprite.flip_h = true
		change_facing(Facing.RIGHT)
