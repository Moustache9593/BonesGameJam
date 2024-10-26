extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0
var has_arms = false
var has_legs = false
const CLIMB_VELOCITY = -200
const UP_POS = 16;
const CLIMB_FALL_SPEED = 0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var current_type = "skull"
var climbing_areas = []
var moving_platforms = []


func can_climb():
	if has_arms and !climbing_areas.is_empty():
		#print("Can Climb")
		return true
	else:
		return false

func is_climbing():
	if can_climb() and Input.is_action_pressed("up"):
		print("Climbing")
		return true
	else:
		return false

func can_jump():
	if has_legs and is_on_floor():
		return true
	else:
		return false

func add_gravity(delta):
	velocity.y += gravity

func get_gravity():
	return gravity


func _physics_process(delta):
	var direction = float(Input.is_action_pressed("right")) - float(Input.is_action_pressed("left"))
	var desired_velcity = Vector2.ZERO
	if not is_on_floor() and not is_climbing():
		if not can_climb():
			desired_velcity.y += get_gravity()
	if is_on_floor() and !moving_platforms.is_empty():
		print("Moving Platforms")
		desired_velcity += moving_platforms.back().get_parent().get_parent().velocity
	if direction:
		desired_velcity.x += direction * SPEED 
	# Handle jump.
	if can_jump() and Input.is_action_just_pressed("ui_accept"):
		desired_velcity.y += JUMP_VELOCITY
	# Handle climb
	elif is_climbing():
		desired_velcity.y += CLIMB_VELOCITY
	elif can_climb() and !is_climbing():
		desired_velcity.y += 0
	print(desired_velcity)
	velocity = velocity.move_toward(desired_velcity,delta*2000)
	move_and_slide()


func transformation(type):
	match type:
		"arms":
			
			#$SkullCollision.disabled = true;
			#$ArmsCollision.disabled = false;
			#$SkullPlusArmsSprite.visible = true
			#$SkullSprite.visible = false
			#position.y -= UP_POS
			
			$SkullCollision.call_deferred("set_disabled", true)
			$ArmsCollision.call_deferred("set_disabled", false)
			$SkullPlusArmsSprite.visible = true
			$SkullSprite.visible = false
			
			position.y -= UP_POS
			has_arms = true
	pass


func _on_climb_box_body_entered(body):
	pass # Replace with function body.


func _on_climb_box_area_entered(area):
	if(area.is_in_group("climable")):
		
		climbing_areas.append(area)
		print("added climable")

func _on_climb_box_area_exited(area):
	if(area.is_in_group("climable")):
		climbing_areas.erase(area)
		print("removed climable")


func _on_moving_platform_checker_body_entered(body):
	if body.is_in_group("moving_platform"):
		moving_platforms.append(body)
func _on_moving_platform_checker_body_exited(body):
	if body.is_in_group("moving_platform"):
		moving_platforms.erase(body)
