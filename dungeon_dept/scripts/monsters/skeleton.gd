class_name Skeleton
extends Monster


@onready var damage_taken_indicator: Label = $DamageTaken
var _death: bool = false
var dam_ind_delay: int = 0
var prev_damage_taken: int = 0


func _init() -> void:
	cost = 20
	type = MonsterFactory.MonsterType.SKELETON



func _ready() -> void:
	melee_range = 40
	damage_taken_indicator.text = " "
	super()


func _process(_delta: float) -> void:
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
		# FIXME: do stuff like remove when dies. make death funct?
