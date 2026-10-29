extends Node2D

@export var Airpods: PackedScene
@export var Blanket: PackedScene
@export var Book: PackedScene
@export var Milk: PackedScene
@export var Picture: PackedScene
@export var Pillow: PackedScene
@export var Sleep_Mask: PackedScene

var selected_tower: PackedScene = null

func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("select_Airpods"):
		print("Airpods detected!")
		selected_tower = Airpods

	if Input.is_action_just_pressed("select_Blanket"):
		selected_tower = Blanket

	if Input.is_action_just_pressed("select_Book"):
		selected_tower = Book

	if Input.is_action_just_pressed("select_Milk"):
		selected_tower = Milk

	if Input.is_action_just_pressed("select_Picture"):
		selected_tower = Picture

	if Input.is_action_just_pressed("select_Pillow"):
		selected_tower = Pillow

	if Input.is_action_just_pressed("select_Sleep_Mask"):
		selected_tower = Sleep_Mask
	
		
func _unhandled_input(event: InputEvent) -> void:
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
			print("Map Clicked!")
			place_tower()
			
func place_tower() -> void:
	if selected_tower == null:
		print("No tower selected")
		return
		
	var tower = selected_tower.instantiate();
	add_child(tower)
	
	tower.global_position = get_global_mouse_position()
	tower.z_index = 10
	
	print("Tower Placed!")
