class_name Skeleton
extends Monster

@onready var skeleton_sfx: AudioStreamPlayer = AudioStreamPlayer.new()
@onready var damage_taken_indicator: Label = $DamageTaken
var dam_ind_delay: int = 0
var prev_damage_taken: int = 0
var alignment: int = 0


func _init() -> void:
	cost = 20
	type = MonsterFactory.MonsterType.SKELETON



func _ready() -> void:
	add_child(skeleton_sfx)
	skeleton_sfx.stream = preload("res://sounds/SFX/skeleton_sfx.wav")
	skeleton_sfx.play()
	melee_range = 40
	damage_taken_indicator.text = " "
	super()


func _process(_delta: float) -> void:
	super(_delta)
	
	if dam_ind_delay > 0:
		damage_taken_indicator.text = str(prev_damage_taken)
		dam_ind_delay -= 1
	else:
		damage_taken_indicator.text = " "


func take_damage(d: int) -> void:
	print("skelly hit!")
	health -= d
	prev_damage_taken = d
	dam_ind_delay = 30
	if 0 >= health:
		_death = true
		print("skelly DEAD")
		skeleton_sfx.stream = preload("res://sounds/SFX/skeleton_sfx.wav")
		skeleton_sfx.play()
