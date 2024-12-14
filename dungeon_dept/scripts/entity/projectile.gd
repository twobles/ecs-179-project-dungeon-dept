class_name Projectile
extends Area2D

@export var damage: int = 30

var speed = 250
var dir : float
var spawn_pos : Vector2
var spawn_rot : float
var life_time = 4

func _init() -> void:
	#damage = 30
	collision_layer = 0
	collision_mask = 8
	area_entered.connect(_on_area_entered)

func _ready():
	global_position = spawn_pos + Vector2(0, -20).rotated(dir)
	global_rotation = spawn_rot

func _physics_process(delta):
	var velocity = Vector2(0, -speed).rotated(dir)
	global_position += velocity * delta
	if velocity == Vector2(0, 0):
		queue_free()
	get_tree().create_timer(life_time).timeout.connect(func(): queue_free())
	
func _on_area_entered(hurtbox:HurtBox) -> void:
	print("hit: ", hurtbox.owner)
	print("shooter: ", owner)
	hurtbox.owner.take_damage(damage)
	queue_free()
		
	
	
