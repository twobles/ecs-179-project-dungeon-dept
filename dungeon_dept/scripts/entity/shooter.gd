class_name Shooter
extends Node2D


@onready var projectile = load("res://scenes/projectile.tscn")
#@onready var boss:Boss = %Boss
@onready var entity:Node2D = get_parent()

var can_fire = true
var wait_time = 1
var position_offset = Vector2(0, -30)

func _ready() -> void:							#Area2D node that is used to generate spells for boss
	position = entity.global_position + position_offset
	
func _physics_process(delta: float) -> void:
	position = entity.global_position + position_offset

func _on_slime_shoot_projectile(enemy: Node2D) -> void:
	look_at(enemy.position)		#Locks onto character position
	rotation_degrees += 90
	
	var room = entity.room
	
	if can_fire:
		#print("firing")
		#print("room: ", room)
		can_fire = false
		fire(room, enemy)
		get_tree().create_timer(wait_time).timeout.connect(func(): can_fire = true)
	

func fire(room: Node, enemy: Node2D):
	var p = projectile.instantiate()
	p.dir = rotation
	p.spawn_pos = position
	p.spawn_rot = rotation
	#p.team = enemy.team
	room.add_child.call_deferred(p)
