extends CharacterBody2D

var release_controls = false
@export var JUMP_VELOCITY = -75.0
@export var newgravity = 130
@export var gravadder = 1.2
var can_press_right = true
var can_press_a = true
var moneycounter = 10000000
var moneythrown = 1
const inflationtimer = 10
const deflationtimer = 10
const maetimer = 10
const onzetimer = 10
var realinflationtimer = 0
var realdeflationtimer = 0
var realmaetimer = 0
var realonzetimer = 0
var infthrown = 1
var defthrown = 1
var maegrav = 1
var onzegrav = 1
var zeppelin_hp = 3
var rng = RandomNumberGenerator.new()
var debug = false

func _ready():
	pass

func _physics_process(delta):
	if Input.is_action_just_pressed("debug"):
		debug = true

	if release_controls:

		if debug == false && not is_on_floor():
			velocity.y += newgravity * delta * maegrav / onzegrav

		if Input.is_action_just_pressed("A") && can_press_a == true:
			velocity.y = JUMP_VELOCITY
			can_press_a = false
			can_press_right = true

		if Input.is_action_just_pressed("Direita") && can_press_right == true:
			velocity.y = JUMP_VELOCITY
			can_press_a = true
			can_press_right = false

		if realinflationtimer > 0:
			infthrown = 2
		else:
			infthrown = 1

		if realdeflationtimer > 0:
			defthrown = 2
		else:
			defthrown = 1

		if realmaetimer > 0:
			maegrav = 1.5
		else:
			maegrav = 1

		if realonzetimer > 0:
			onzegrav = 1.5
		else:
			onzegrav = 1

		if moneycounter <= 0:
			get_tree().change_scene_to_file("res://anita_max_wynn.tscn")

		if Input.is_action_just_pressed("Pneis"):
			get_tree().change_scene_to_file("res://anita_max_wynn.tscn")

		if zeppelin_hp <= 0:
			get_tree().change_scene_to_file("res://gameover.tscn")

		move_and_slide()
	else:
		if Input.is_action_just_pressed("A") || Input.is_action_just_pressed("Direita"):
			release_controls = true
			$GravChanger.start()
			$PowerupTimer.start()
			$MoneyTick.start()

func _on_death_zone_body_entered(body):
	if body.name == "Zeppellin":
		get_tree().change_scene_to_file("res://gameover.tscn")

func _on_grav_changer_timeout():
	newgravity *= gravadder
	moneythrown *= 2

func _on_safe_zone_body_entered(body):
	if body.name == "Zeppellin":
		JUMP_VELOCITY = JUMP_VELOCITY/2

func _on_safe_zone_body_exited(body):
	if body.name == "Zeppellin":
		JUMP_VELOCITY *= 2

func _on_safe_zone_2_body_entered(body):
	if body.name == "Zeppellin":
		JUMP_VELOCITY = JUMP_VELOCITY/5

func _on_safe_zone_2_body_exited(body):
	if body.name == "Zeppellin":
		JUMP_VELOCITY *= 5

func _on_inf_area_body_entered(body):
	if body.name == "Zeppellin":
		realinflationtimer = inflationtimer

func _on_def_area_body_entered(body):
	if body.name == "Zeppellin":
		realdeflationtimer = deflationtimer

func _on_mae_area_body_entered(body):
	if body.name == "Zeppellin":
		realmaetimer = maetimer

func _on_onze_area_body_entered(body):
	if body.name == "Zeppellin":
		realonzetimer = onzetimer

func _on_bico_do_bird_body_entered(body):
	if body.name == "Zeppellin":
		zeppelin_hp -= 1

func _on_powerup_timer_timeout():
	if realinflationtimer > 0:
		realinflationtimer -= 1

	if realdeflationtimer > 0:
		realdeflationtimer -= 1

	if realmaetimer > 0:
		realmaetimer -= 1

	if realonzetimer > 0:
		realonzetimer -= 1

func _on_money_tick_timeout():
	moneycounter -= moneythrown * defthrown / infthrown
