class_name Knight
extends Adventurer


@onready var damage_taken_indicator: Label = $DamageTaken
var _death: bool = false
var dam_ind_delay: int = 0
var prev_damage_taken: int = 0


func _ready() -> void:
	melee_range = 40
	super()
	damage_taken_indicator.text = " "


func _process(_delta: float) -> void:
	if dam_ind_delay > 0:
		damage_taken_indicator.text = str(prev_damage_taken)
		dam_ind_delay -= 1
	else:
		damage_taken_indicator.text = " "


func take_damage(d: int) -> void:
	print("knight hit!")
	health -= d
	money_engine.earn_money(money_engine.EarnType.HURT_ADVENTURER)
	prev_damage_taken = d
	dam_ind_delay = 30
	if 0 >= health:
		_death = true
		print("knight DEAD")
		# FIXME: do stuff like remove knight when knight dies. make death funct?
