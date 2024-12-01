class_name Monster
extends Entity

# cost to deploy
@export var cost: float = 0.0

func _ready() -> void:
	cost = 100.0
	movement_speed = 3000.0
	super()
	
