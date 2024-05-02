extends CharacterBody2D

var speed = 0
var rng = RandomNumberGenerator.new()
var randomY = rng.randf_range(100.0, 400.0)
var spawn_started = false
@onready var screech = $BirdScreech as AudioStreamPlayer

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(_delta):
	if get_node("../../Zeppellin").release_controls == true && spawn_started == false:
		await get_tree().create_timer(rng.randf_range(5, 10)).timeout
		$"BirdNest".start()
		spawn_started = true
	position.x += speed

func _on_BicoDoBird_area_body_entered(body):
	if body.name == "Zeppellin":
		speed = 0
		position.x = -90
		$"BirdNest".start()

func _spawn(spawnspeed, height):
	screech.play()
	speed = spawnspeed
	position.y = height
	$"BirdNest".stop()

func _on_bird_nest_timeout():
	_spawn(7, randomY)
	randomY = rng.randf_range(100.0, 300.0)

func _on_bird_killing_body_entered(body):
	if body.name == "NormalBird":
		speed = 0
		position.x = -162
		$"BirdNest".start()
