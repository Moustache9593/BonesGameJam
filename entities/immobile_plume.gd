extends Area2D

@export var TIME_START = 0.1
@export var COOL_DOWN_TIME = 1.0
@export var CHARGE_TIME = 4.0
@export var ACTIVE_TIME = 2.0

var active = false
var player_in = false
var player = null
const final_frame = 3
const first_frame = 0
const frames = 4.0
const margin = 0
# Called when the node enters the scene tree for the first time.
func _ready():
	$TIME_START.wait_time = TIME_START
	$COOL_DOWN_TIME.wait_time = COOL_DOWN_TIME
	$CHARGE_TIME.wait_time = CHARGE_TIME
	$ACTIVE_TIME.wait_time = ACTIVE_TIME
	$TIME_START.start()
	$AnimatedSprite2D.speed_scale = frames/CHARGE_TIME-margin
	print("playing speed: " + str($AnimatedSprite2D.get_playing_speed()))
	print("playing speed_scale: " + str($AnimatedSprite2D.speed_scale))


func _physics_process(delta):
	if player_in and active:
		player.die()



func _on_body_entered(body):
	if body.is_in_group("player"):
		player_in = true
		player = body


func charge():
	$CHARGE_TIME.start()
	$AnimatedSprite2D.frame = first_frame+1
	print("charge")

func _on_time_start_timeout():
	charge()



func _on_cool_down_time_timeout():
	charge()

func activate():
	active = true
	$AnimatedSprite2D.frame = final_frame;
	$ACTIVE_TIME.start()
	print("activate")

func _on_charge_time_timeout():
	activate()

func deactivate():
	active = false
	$AnimatedSprite2D.frame = first_frame;
	$COOL_DOWN_TIME.start()
	print("deactivate")


func _on_active_time_timeout():
	deactivate()



func _on_body_exited(body):
	if body.is_in_group("player"):
		player_in = false
		player = null
	pass # Replace with function body.
