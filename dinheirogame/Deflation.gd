extends CharacterBody2D

var speed = 0
var rng = RandomNumberGenerator.new()
var randomY = rng.randf_range(100.0, 300.0)

# Called when the node enters the scene tree for the first time.
func _ready():
	$"../../UI/DeflationSpawner".start()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	position.x -= speed

func _on_def_area_body_entered(body):
	if body.name == "Zeppellin":
		speed = 0
		position.x = 1160
		$"../../UI/DeflationSpawner".start()

func _spawn(spawnspeed, height):
	speed = spawnspeed
	position.y = height
	$"../../UI/DeflationSpawner".stop()

func _on_deflation_spawner_timeout():
	_spawn(2, randomY)

func _on_powerup_exit_body_entered(body):
	if body.name == "Deflation":
		speed = 0
		position.x = 1160
		$"../../UI/DeflationSpawner".start()
