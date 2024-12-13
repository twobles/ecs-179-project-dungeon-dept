class_name HitBox
extends Area2D

@export var damage: int = 10
@export var give_damage_layer: int = 8
@export var take_damage_layer: int = 0

func _init() -> void:
	# take damage layer
	collision_layer = take_damage_layer
	# give damage layer
	collision_mask = give_damage_layer
	area_entered.connect(_on_area_entered)


func _on_area_entered(hurtbox: HurtBox) -> void:
	if hurtbox.get_owner().has_method("take_damage"):
		hurtbox.owner.take_damage(damage)
