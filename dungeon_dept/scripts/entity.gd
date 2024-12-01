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


const DEFAULT_MOVE_VELOCITY: float = 300.0


@export var health: float = 100.0
@export var damage: float = 1.0
@export var type: AttackType

@export var movement_speed: float = DEFAULT_MOVE_VELOCITY
@export var target: CharacterBody2D

@onready var navigation_agent_2d: NavigationAgent2D = $NavigationAgent2D
@onready var calc_timer: Timer = $calcTimer


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
	
	calc_timer.timeout.connect(_on_timer_timeout)
	navigation_agent_2d.path_desired_distance = 4.0
	navigation_agent_2d.target_desired_distance = 4.0
	call_deferred("actor_setup")


func actor_setup() -> void:
	await get_tree().physics_frame
	set_target_position(target.position)
	

func set_target_position(target_pos: Vector2) -> void:
	print("target_pos: ", target_pos)
	navigation_agent_2d.target_position = target_pos


func _physics_process(delta: float) -> void: 
	#_apply_movement(delta)
	if navigation_agent_2d.is_navigation_finished():
		#print("finished")
		return
		
	var cur_pos = global_position
	var next_pos = navigation_agent_2d.get_next_path_position()
	
	var direction = cur_pos.direction_to(next_pos)
	velocity = direction * movement_speed * delta
	print("velocity: ", velocity)
	move_and_slide()

#func _apply_movement(_delta: float):
	#
	#move_and_slide()

func _on_spacer_range_area_entered(area):
	var space_target = area.owner
	print("space_target: ", space_target.position)
	
	var cur_pos = global_position
	var tar_pos = space_target.global_position
	var direction = cur_pos.direction_to(tar_pos)
	velocity = (-direction * 0.5) * movement_speed
	print("space_velocity: ", velocity)
	move_and_slide()


func change_facing(new_facing: Facing) -> void:
	facing = new_facing


#This function is meant to be called in the AnimationController after the each relevant anmiation has concluded.
func clear_action_state() -> void:
	attacking = false
	summoning = false


func command_callback(_name:String) -> void:
	pass
	
func _on_timer_timeout() -> void:
	set_target_position(target.position)
