extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -50.0
var newgravity = 490

func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += newgravity * delta

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept"):
		velocity.y = JUMP_VELOCITY

	move_and_slide()


func _on_death_zone_body_entered(body):
	if body == "Zeppellin":
		get_tree().quit()
