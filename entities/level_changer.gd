#@tool

extends Area2D
const UP_POS = 64
@export var type = "level_changer"
@export var texture = preload("res://assets/textures/pickup.png")
@export var level_path = "NULL"
# Called when the node enters the scene tree for the first time.
func _ready():
	$Sprite2D.texture = texture



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Engine.is_editor_hint():
		$Sprite2D.texture = texture


func change():
	pass

func _on_body_entered(body):
	if body.is_in_group("player"):
		get_tree().change_scene_to_file(level_path)

