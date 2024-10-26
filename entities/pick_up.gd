extends Area2D
const UP_POS = 64
@export var transformation = preload("res://entities/player_with_arms.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func change():
	pass

func _on_body_entered(body):
	if body.is_in_group("player"):
		var player = body
		var pos = player.position - Vector2(0,UP_POS)
		var parent = player.get_parent()
		player.queue_free()
		var new_player = transformation.instantiate()
		new_player.position = pos
		get_parent().add_child(new_player)
		queue_free()

