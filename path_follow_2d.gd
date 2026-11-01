extends PathFollow2D

@export var speed: int = 400
@export var health: int = 10

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	progress += speed * delta

	if progress_ratio >= 1.0:
		queue_free()

func take_damage(amount: int) -> void:
	health -= amount

	if health <= 0:
		queue_free()
