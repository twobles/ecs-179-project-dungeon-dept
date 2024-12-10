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


const DEFAULT_MOVE_VELOCITY: float = 3000.0


@export var health: float = 100.0
@export var damage: float = 1.0
@export var type: AttackType

@export var movement_speed: float = DEFAULT_MOVE_VELOCITY
@export var target: Entity
@export var space: float = 50.0
@export var separation_force: float = 500.0

@onready var navigation_agent_2d: NavigationAgent2D = $NavigationAgent2D
@onready var calc_timer: Timer = $calcTimer
@onready var animations = $AnimationPlayer


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
	navigation_agent_2d.target_desired_distance = 50.0
	call_deferred("actor_setup")


func actor_setup() -> void:
	if target != null:
		await get_tree().physics_frame
		set_target_position(target.position)
	else:
		print("Target is not set!")
		return
	

func set_target_position(target_pos: Vector2) -> void:
	#print("target_pos: ", target_pos)
	navigation_agent_2d.target_position = target_pos


func _physics_process(delta: float) -> void: 
	if navigation_agent_2d.is_navigation_finished():
		#print("finished")
		return
		
	var cur_pos = global_position
	var next_pos = navigation_agent_2d.get_next_path_position()
	
	var direction = cur_pos.direction_to(next_pos)
	
	var separation = Vector2()
			
	velocity = direction * movement_speed * delta
	
	#print("locals: ", _local_entities)
	#print("velocity: ", velocity)
	_apply_movement(delta)
	#move_and_slide()

func _apply_movement(_delta: float):
	move_and_slide()
	#print(velocity.length())
	#print(velocity.length() > 5.0)
	if velocity.length() > 5.0:
		animations.play("walking")
	else:
		animations.play("attack")


func change_facing(new_facing: Facing) -> void:
	facing = new_facing


#This function is meant to be called in the AnimationController after the each relevant anmiation has concluded.
func clear_action_state() -> void:
	attacking = false
	summoning = false


func command_callback(_name:String) -> void:
	pass
	
func _on_timer_timeout() -> void:
	if target != null:
		set_target_position(target.position)
	else:
		return
