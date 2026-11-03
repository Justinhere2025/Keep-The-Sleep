extends Node2D

@onready var SceneTransitionAnimation = $"."

var current_wave: int
@export var Sun_scene: PackedScene
@export var Angry_Clock_scene: PackedScene
@export var ANGRY_DAD_scene: PackedScene
@export var Computer_scene: PackedScene
@export var Disco_Ball_scene: PackedScene
@export var Farmer_scene: PackedScene


var starting_nodes: int
var current_nodes: int
var wave_spawn_ended
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	current_wave = 0
	Global.current_wave = current_wave
	starting_nodes = get_child_count()
	current_nodes = get_child_count()
	postion_to_next_wave()
	
func positon_to_next_wave():
	if current_nodes == starting_nodes:
		if current_wave != 0:
			Global.moving_into_next_wave = true
		SceneTransitionAnimation.play("between_wave")
		current_wave += 1
		Global.current_wave = current_wave
		await get_tree().create_timer(.5).timeout
		prepare_spawn("Sun", 2, 2)
		print(current_wave)
		
func prepare_spawn(type, multiplier, mob_spawns):
	var mob_amount = float(current_wave) * multiplier
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
