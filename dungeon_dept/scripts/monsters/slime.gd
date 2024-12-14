class_name Slime
extends Monster

@onready var slime_sfx: AudioStreamPlayer = AudioStreamPlayer.new()
@onready var damage_taken_indicator: Label = $DamageTaken
var _death: bool = false
var dam_ind_delay: int = 0
var prev_damage_taken: int = 0


func _init() -> void:
	cost = 10
	type = MonsterFactory.MonsterType.SLIME
	
	
func _ready() -> void:
	add_child(slime_sfx)
	slime_sfx.stream = preload("res://sounds/SFX/slime_sfx.wav")
	slime_sfx.play()
	melee_range = 90
	damage_taken_indicator.text = " "
	super()
	
	
func _process(_delta: float) -> void:
	if _death:
		visible = false
		$HurtBox/CollisionShape2D.disabled = true
		$HitBox/CollisionShape2D.disabled = true
		return
	
	if dam_ind_delay > 0:
		damage_taken_indicator.text = str(prev_damage_taken)
		dam_ind_delay -= 1
	else:
		damage_taken_indicator.text = " "


func take_damage(d: int) -> void:
	print("slime hit!")
	health -= d
	prev_damage_taken = d
	dam_ind_delay = 30
	if 0 >= health:
		_death = true
		print("slime DEAD")
		slime_sfx.stream = preload("res://sounds/SFX/slime_sfx.wav")
		slime_sfx.play()
