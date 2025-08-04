extends Node2D
const bullet = preload("res://Scenes/Game/Enemy/enemy_bullet.tscn")
@onready var player = $"/root/Base/Player"

# Called every frame. 'delta' is the elapsed time since the previous frame.
var firing = false
func _process(delta: float) -> void:
	look_at(player.position)
	rotation_degrees = wrap(rotation_degrees, 0, 360)

	if firing:
		var bullet_instance = bullet.instantiate()
		get_tree().root.add_child(bullet_instance)
		bullet_instance.global_position = global_position
		bullet_instance.rotation = rotation
		firing = false


func _on_timer_timeout() -> void:
	if (firing):
		firing = false
	elif (!firing):
		firing = true


func _on_enemyhitbox_area_shape_entered(area_rid: RID, area: Area2D, area_shape_index: int, local_shape_index: int) -> void:
	queue_free()
