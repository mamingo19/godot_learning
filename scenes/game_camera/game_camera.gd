extends Camera2D

var TARGET_POSITION = Vector2.ZERO

func _ready() -> void:
	make_current()

func _process(delta):
	acquire_target()
	global_position = global_position.lerp(
		TARGET_POSITION,
		1.0 - exp(-delta * 10)
	)

func acquire_target():
	var player_nodes = get_tree().get_nodes_in_group("player")
	if player_nodes.size() > 0:
		var player = player_nodes[0] as Node2D
		TARGET_POSITION = player.global_position
