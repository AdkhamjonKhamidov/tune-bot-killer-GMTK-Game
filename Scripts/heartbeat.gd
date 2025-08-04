extends Node2D

signal beep_fire
signal take_damage(dmg)

var bpm := 120
var beat_interval := 60.0 / bpm
var beat_timer := 0.0
var current_beat := 0

func _ready() -> void:
	beat_timer = 0.0
	set_process(true)
	
func _process(delta: float) -> void:
	beat_timer += delta
	
	if beat_timer >= beat_interval:
		beat_timer -= beat_interval
		play_beat()
		print(current_beat)
		current_beat = (current_beat + 1)

func play_beat() -> void:
	$BeepPlayer.play()
	beep_fire.emit(bpm)


func _on_take_damage(dmg: Variant) -> void:
	print("Damage taken " + str(dmg))
	bpm -= dmg
	beat_interval = 60.0 / bpm
	if (bpm <= 70):
		print("u died")
		get_tree().change_scene_to_file("res://Scenes/Menu/main_menu.tscn")
