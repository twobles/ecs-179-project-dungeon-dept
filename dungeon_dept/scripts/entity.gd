class_name Entity
extends CharacterBody2D


enum Facing { 
	LEFT,
	RIGHT,
}


enum AttackType {
	PHYSICAL,
	MAGIC,
}


const DEFAULT_MOVE_VELOCITY = 300

@export var health: float = 100.0
@export var damage: float = 1.0
@export var type: AttackType

var movement_speed = DEFAULT_MOVE_VELOCITY

#var right_cmd : Command
#var left_cmd : Command
#var up_cmd : Command
#var fire1 : Command
#var fire2 : Command
#var idle : Command

var facing:Facing = Facing.RIGHT

var attacking : bool: 
	set(value): 
		attacking = value
	get():
		return attacking

var summoning : bool:
	set(value):
		summoning = value
	get():
		return summoning
		

#@onready var animation_player: AnimationPlayer = $AnimationPlayer
#@onready var sprite: Sprite2D = $Sprite2D


func _ready() -> void:
	attacking = false
	summoning = false
	change_facing(facing)


func _physics_process(delta: float) -> void: 
	_apply_movement(delta)


func _apply_movement(_delta: float):
	move_and_slide()


func change_facing(new_facing: Facing) -> void:
	facing = new_facing


#This function is meant to be called in the AnimationController after the each relevant anmiation has concluded.
func clear_action_state() -> void:
	attacking = false
	summoning = false


func command_callback(_name:String) -> void:
	pass
