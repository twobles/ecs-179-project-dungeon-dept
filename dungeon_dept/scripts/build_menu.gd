class_name BuildMenu
extends Node2D

# REPLACE SECOND_ICON_SCENE AND SECOND_ICON_INSTANCE WITH SECOND MONSTER
# ALSO CAN ADD THIRD MONSTER WITH SAME LOGIC

@export var skeleton_icon_scene:PackedScene  # Preload the Skeleton Icon scene
#@export var second_icon_scene:PackedScene  # Preload the Skeleton Icon scene

var skeleton_icon_instance:CharacterBody2D = null  # Reference to the currently spawned icon
#var second_icon_instance:CharacterBody2D = null 

@onready var ui_test = $UI_test
@onready var ready_button = $ReadyButton
@onready var boundary = $Boundary
@onready var capacity = $Capacity

var is_dragging:bool = false  # Track if the icon is being dragged
var is_inside_boundary:bool # Track if icon is inside boundary
var is_ready:bool = false # Track if ready has been pressed
var is_skeleton:bool = false # Track if last selected monster is skeleton
#var is_second:bool = false # Track if last selected monster is second


func _on_button_pressed() -> void:
	ui_test.hide()
	ready_button.hide()
	capacity.hide()
	is_ready = true
	
	
func _input(event):
	if is_ready == false and event.is_action_pressed("skeleton_select") and skeleton_icon_instance == null:  
		_remove_current_icon()
		var mouse_position = get_global_mouse_position()
		skeleton_icon_instance = skeleton_icon_scene.instantiate() as CharacterBody2D
		skeleton_icon_instance.scale = Vector2(0.35, 0.35)
		
		skeleton_icon_instance.position = mouse_position
		add_child(skeleton_icon_instance)
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
				Autoscript.capacity -= 6
#			elif is_second:
#				if Autoscript.capacity - 10 < 0:
#					return
#				Autoscript.capacity -= 10
			is_dragging = false
			skeleton_icon_instance = null
#			second_icon_instance = null
	
	
func _process(delta):
	capacity.text = "Capacity: " + str(Autoscript.capacity)
	if is_dragging and skeleton_icon_instance != null:
		skeleton_icon_instance.position = get_global_mouse_position()
#	if is_dragging and second_icon_instance != null:
#		second_icon_instance.position = get_global_mouse_position()

# Function to remove icon when switching 
func _remove_current_icon():
	if skeleton_icon_instance != null:
		skeleton_icon_instance.queue_free()
		skeleton_icon_instance = null
#	if second_icon_instance != null:
#		second_icon_instance.queue_free()
#		second_icon_instance = null


func _on_boundary_mouse_exited() -> void:
	is_inside_boundary = false


func _on_boundary_mouse_entered() -> void:
	is_inside_boundary = true
