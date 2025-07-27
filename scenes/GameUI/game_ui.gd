extends Control


const MAIN = preload("res://Main/main.tscn")

@onready var level_label: Label = $MarginContainer/VB/LevelLabel
@onready var attempts_label: Label = $MarginContainer/VB/AttemptsLabel
@onready var game_sound: AudioStreamPlayer = $GameSound
@onready var vb_2: VBoxContainer = $MarginContainer/VB2



func _ready() -> void:
	level_label.text = "LEVEL %s" % ScoreManager.get_level_selected()
	update_attempts(0)
	SignalManager.on_score_updated.connect(update_attempts)
	SignalManager.on_level_complete.connect(on_level_complete)

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("Menu") == true:
		get_tree().change_scene_to_packed(MAIN)
		
func update_attempts(attempts: int):
	attempts_label.text = "Attempts %s" % attempts
	
func on_level_complete():
	vb_2.show()
	game_sound.play()
		
