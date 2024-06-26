extends CharacterBody2D

var speed = 0
var rng = RandomNumberGenerator.new()
var randomY = rng.randf_range(100.0, 400.0)
var spawn_started = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(_delta):
	if get_node("../../Zeppellin").release_controls == true && spawn_started == false:
		$"OnzeSpawner".start()
		spawn_started = true
	position.x += speed

func _on_onze_area_body_entered(body):
	if body.name == "Zeppellin":
		speed = 0
		position.x = -100
		$"OnzeSpawner".start()

func _spawn(spawnspeed, height):
	speed = spawnspeed
	position.y = height
	$"OnzeSpawner".stop()
	print("onze")

func _on_onze_spawner_timeout():
	_spawn(3, randomY)
	randomY = rng.randf_range(100.0, 300.0)

func _on_powerup_exit_body_entered(body):
	if body.name == "SuperOnze":
		speed = 0
		position.x = 1160
		$"OnzeSpawner".start()
		print("onze morreu")
