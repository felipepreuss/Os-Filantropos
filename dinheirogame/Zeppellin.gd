extends CharacterBody2D


const SPEED = 300.0
var JUMP_VELOCITY = -75.0
var newgravity = 290
var can_press_right = true
var can_press_a = true

func _ready():
	$GravChanger.start()

func _physics_process(delta):
	if not is_on_floor():
		velocity.y += newgravity * delta

	#if Input.is_action_just_pressed("ui_accept"):
		#velocity.y = JUMP_VELOCITY

	if Input.is_action_just_pressed("A") && can_press_a == true:
		velocity.y = JUMP_VELOCITY
		can_press_a = false
		can_press_right = true

	if Input.is_action_just_pressed("Direita") && can_press_right == true:
		velocity.y = JUMP_VELOCITY
		can_press_a = true
		can_press_right = false

	move_and_slide()


func _on_death_zone_body_entered(body):
	get_tree().change_scene_to_file("res://gameover.tscn")
	
func _on_grav_changer_timeout():
	newgravity *= 1.1

func _on_safe_zone_body_entered(body):
	JUMP_VELOCITY = JUMP_VELOCITY/2

func _on_safe_zone_body_exited(body):
	JUMP_VELOCITY *= 2

func _on_safe_zone_2_body_entered(body):
	JUMP_VELOCITY = JUMP_VELOCITY/5

func _on_safe_zone_2_body_exited(body):
	JUMP_VELOCITY *= 5
