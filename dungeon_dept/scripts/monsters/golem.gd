class_name Golem
extends Monster

@onready var golem_sfx: AudioStreamPlayer = AudioStreamPlayer.new()
@onready var damage_taken_indicator: Label = $DamageTaken
var _death: bool = false
var dam_ind_delay: int = 0
var prev_damage_taken: int = 0


func _init() -> void:
	cost = 40
	type = MonsterFactory.MonsterType.GOLEM
	
	
func _ready() -> void:
	add_child(golem_sfx)
	golem_sfx.stream = preload("res://sounds/SFX/golem_sfx.wav")
	golem_sfx.play()
	melee_range = 60
	damage_taken_indicator.text = " "
	super()


func _process(_delta: float) -> void:
	if dam_ind_delay > 0:
		damage_taken_indicator.text = str(prev_damage_taken)
		dam_ind_delay -= 1
	else:
		damage_taken_indicator.text = " "


func take_damage(d: int) -> void:
	print("golem hit!")
	health -= d
	prev_damage_taken = d
	dam_ind_delay = 30
	if 0 >= health:
		_death = true
		print("golem DEAD")
		# FIXME: do stuff like remove when dies. make death funct?
