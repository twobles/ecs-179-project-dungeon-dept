class_name BuildMenu
extends Node2D

# REPLACE SECOND_ICON_SCENE AND SECOND_ICON_INSTANCE WITH SECOND MONSTER
# ALSO CAN ADD THIRD MONSTER WITH SAME LOGIC
#var second_icon_instance:CharacterBody2D = null 

@onready var ui_test = $UI_test
@onready var ready_button = $ReadyButton
@onready var boundary = $Boundary
@onready var capacity = $Capacity

#@onready var skeleton_icon = $SkeletonIcon
#@onready var skeleton_info = $SkeletonInfo
#@onready var skeleton_name = $SkeletonName

var is_dragging: bool = false  # Track if the icon is being dragged
var is_inside_boundary: bool # Track if icon is inside boundary
var is_ready: bool = false # Track if ready has been pressed
var is_skeleton: bool = false # Track if last selected monster is skeleton
#var is_second:bool = false # Track if last selected monster is second


var monster_icon: Sprite2D = null  # Reference to the currently spawned icon
var monster_factory := MonsterFactory.new()

		
func _on_button_pressed() -> void:
	is_ready = true
	ui_test.hide()
	ready_button.hide()
	capacity.hide()
	boundary.hide()
	
	
	
func _input(event):
	if is_ready == false and event.is_action_pressed("skeleton_select") and monster_icon == null:  
		_remove_current_icon()
		var mouse_position = get_global_mouse_position()
		monster_icon = Sprite2D.new()
		monster_icon.texture = load("res://assets/skeleton2.png")
		monster_icon.scale = Vector2(0.35, 0.35)
		
		monster_icon.position = mouse_position
		add_child(monster_icon)
		is_dragging = true
		is_skeleton = true
#		is_second = false
		
		
#	if event.is_action_pressed("second_select") and second_icon_instance == null:
#		_remove_current_icon()		
#		var mouse_position = get_global_mouse_position()
#		second_icon_instance = second_icon_scene.instantiate() as CharacterBody2D
#		second_icon_instance.scale = Vector2(0.65, 0.65)
#		
#		second_icon_instance.position = mouse_position
#		add_child(second_icon_instance)
#		is_dragging = true
#		is_skeleton = false
#		is_second = true
	
	
	# Drop the icon when the left mouse button is pressed
	if event.is_action_pressed("mouse_left") and is_dragging:
		if is_inside_boundary == false:
			return
		else:
			if is_skeleton:
				if Autoscript.capacity - 6 < 0: # Capacity cap
					return
				var monster_instance := monster_factory.spawn(MonsterFactory.MonsterType.SKELETON)
				monster_instance.scale = Vector2(0.35, 0.35)
				monster_instance.position = get_global_mouse_position()
				monster_instance.target = get_tree().get_nodes_in_group("adventurers").pick_random()
				monster_instance.add_to_group("monsters")
				get_parent().add_child(monster_instance)
				Autoscript.capacity -= 6
				_remove_current_icon()
#			elif is_second:
#				if Autoscript.capacity - 10 < 0:
#					return
#				Autoscript.capacity -= 10
			
			is_dragging = false
			monster_icon = null
#			second_icon_instance = null
	
	
func _process(_delta):
	capacity.text = "Capacity: " + str(Autoscript.capacity)
	if is_dragging and monster_icon != null:
		monster_icon.position = get_global_mouse_position()
#	if is_dragging and second_icon_instance != null:
#		second_icon_instance.position = get_global_mouse_position()


# Function to remove icon when switching 
func _remove_current_icon():
	if monster_icon != null:
		monster_icon.queue_free()
		monster_icon = null
#	if second_icon_instance != null:
#		second_icon_instance.queue_free()
#		second_icon_instance = null


func _on_boundary_mouse_exited() -> void:
	is_inside_boundary = false


func _on_boundary_mouse_entered() -> void:
	is_inside_boundary = true
