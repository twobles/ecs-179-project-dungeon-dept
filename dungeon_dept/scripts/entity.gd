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
@export var space: float = 50.0
@export var separation_force: float = 500.0

@onready var navigation_agent_2d: NavigationAgent2D = $NavigationAgent2D
@onready var calc_timer: Timer = $calcTimer
@onready var animations = $AnimationPlayer

var _local_entities = []

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
	navigation_agent_2d.target_desired_distance = 50.0
	call_deferred("actor_setup")


func actor_setup() -> void:
	await get_tree().physics_frame
	set_target_position(target.position)
	

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
	for entity in _local_entities:
		var direction_away = cur_pos - entity.position
		var distance = cur_pos.distance_to(entity.position)
		if distance < space:
			separation += direction_away.normalized() / distance
			
	velocity = direction * movement_speed * delta
	if not _local_entities.is_empty():
		velocity += separation.normalized() * movement_speed * 0.8 * delta
	
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
	set_target_position(target.position)


func _on_spacer_radius_body_entered(body: Node2D) -> void:
	if body == self:
		return
	print("self: ", is_instance_of(self, Monster))
	print("other: ", body is Monster)
	if is_instance_of(self, Monster) and body is Monster:
		_local_entities.push_back(body)
		print("entered: ", _local_entities)


func _on_spacer_radius_body_exited(body: Node2D) -> void:
	_local_entities.erase(body)
