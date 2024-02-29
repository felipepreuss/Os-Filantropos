extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -150.0
var newgravity = 290

func _ready():
	$GravChanger.start()

func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += newgravity * delta

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept"):
		velocity.y = JUMP_VELOCITY

	move_and_slide()


func _on_death_zone_body_entered(body):
	pass


func _on_grav_changer_timeout():
	newgravity += 5
