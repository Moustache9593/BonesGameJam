extends Path2D
@export var SPEED = 100
@onready var speed = SPEED
var velocity = Vector2.ZERO
var last_pos = Vector2.ZERO



# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func bounce():
	pass

func _physics_process(delta):
	$PathFollow2D.progress += speed * delta
	var velocity_dir = ($PathFollow2D/Platform.global_position - last_pos).limit_length(1)
	velocity = velocity_dir * speed
	last_pos = $PathFollow2D/Platform.global_position
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

