extends Path2D
@export var SPEED = 100
@onready var speed = SPEED
var velocity = Vector2.ZERO
var last_pos = Vector2.ZERO
var progress_ratio_margin = .02;
var max_progress = 50

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func bounce():
	pass

func _physics_process(delta):
	if $CoolDownTimer.is_stopped():
		$PathFollow2D.progress += speed * delta
		var velocity_dir = ($PathFollow2D/Platform.global_position - last_pos).limit_length(1)
		velocity = velocity_dir * speed
		last_pos = $PathFollow2D/Platform.global_position
		if $PathFollow2D.progress_ratio >= 1 - progress_ratio_margin:
			$CoolDownTimer.start()
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass



func _on_platform_body_entered(body):
	if body.is_in_group("player"):
		body.die()
	pass # Replace with function body.



func _on_cool_down_time_timeout():
	$PathFollow2D.progress_ratio = 0
	pass # Replace with function body.
