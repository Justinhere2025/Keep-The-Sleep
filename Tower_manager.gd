extends Node2D

@export var Airpods: PackedScene
@export var Blanket: PackedScene
@export var Book: PackedScene
@export var Milk: PackedScene
@export var Picture: PackedScene
@export var Pillow: PackedScene
@export var Sleep_Mask: PackedScene

@onready var cash_label: Label = $CanvasLayer/CashLabel
var selected_tower: PackedScene = null
var cash: int = 1000
var selected_tower_cost:int = 0

func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("select_Airpods"):
		print("Airpods detected!")
		selected_tower = Airpods
		selected_tower_cost = 100

	if Input.is_action_just_pressed("select_Blanket"):
		selected_tower = Blanket
		selected_tower_cost = 200

	if Input.is_action_just_pressed("select_Book"):
		selected_tower = Book
		selected_tower_cost = 150

	if Input.is_action_just_pressed("select_Milk"):
		selected_tower = Milk
		selected_tower_cost = 300

	if Input.is_action_just_pressed("select_Picture"):
		selected_tower = Picture
		selected_tower_cost = 500

	if Input.is_action_just_pressed("select_Pillow"):
		selected_tower = Pillow
		selected_tower_cost = 200

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
	
	if cash < selected_tower_cost:
		print("Not enough Money")
		return
		
	cash -= selected_tower_cost
	
		
	var tower = selected_tower.instantiate();
	add_child(tower)
	tower.scale = Vector2(13, 13)
	tower.global_position = get_global_mouse_position()
	tower.z_index = 10
	
	print("Tower Placed!")
	print("Cash Remaining: $", cash)
