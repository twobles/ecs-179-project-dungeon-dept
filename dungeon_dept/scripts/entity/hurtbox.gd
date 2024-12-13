class_name HurtBox
extends Area2D

var damage: int

@export var give_damage_layer: int = 8
@export var take_damage_layer: int = 0

func _init() -> void:
	# give damage layer
	collision_layer = give_damage_layer
	# take damage layer
	collision_mask = take_damage_layer
	area_entered.connect(_on_area_entered)
	
	
func _on_area_entered(hitbox: HitBox) -> void:
	if owner.has_method("take_damage"):
		owner.take_damage(damage)
