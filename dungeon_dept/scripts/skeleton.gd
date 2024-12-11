class_name Skeleton
extends Monster

func _ready() -> void:
	health = 100.0

func take_damage(damage: int):
	health -= damage
