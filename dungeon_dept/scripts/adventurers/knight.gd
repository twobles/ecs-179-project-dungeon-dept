class_name Knight
extends Adventurer


@onready var knight_sfx: AudioStreamPlayer = AudioStreamPlayer.new()
@onready var damage_taken_indicator: Label = $DamageTaken
var _death: bool = false
var dam_ind_delay: int = 0
var prev_damage_taken: int = 0


func _ready() -> void:
	melee_range = 40
	damage_taken_indicator.text = " "
	movement_speed = 1000
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
	print("knight hit!")
	health -= d
	money_engine.earn_money(money_engine.EarnType.HURT_ADVENTURER)
	prev_damage_taken = d
	dam_ind_delay = 30
	if 0 >= health:
		_death = true
		print("knight DEAD")
		knight_sfx.stream = preload("res://sounds/Click Sound Pack/Click5.ogg")
		knight_sfx.play()
