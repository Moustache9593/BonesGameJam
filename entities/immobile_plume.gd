extends Area2D

@export var TIME_START = 0.0
@export var COOL_DOWN_TIME = 1.0
@export var CHARGE_TIME = 4.0
@export var ACTIVE_TIME = 2.0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_body_entered(body):
	if body.is_in_group("player") and true:
		pass
		
	pass # Replace with function body.
