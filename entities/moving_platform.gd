extends Path2D
@export var SPEED = 100
@onready var speed = SPEED


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func bounce():
	pass

func _physics_process(delta):
	$PathFollow2D.progress += speed * delta
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
