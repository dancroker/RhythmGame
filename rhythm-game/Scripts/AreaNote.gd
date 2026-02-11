extends Area2D
@onready var sprite_2d_2: Sprite2D = $Sprite2D2

@export var speed : float
@export var path : int
@export var type : int
var pos_start

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pos_start = position.y
	if type == 1:
		sprite_2d_2.self_modulate = Color.AQUA
	elif type == 2:
		sprite_2d_2.self_modulate = Color.CRIMSON
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if (path == 0):
		position.y += speed * delta
	if type == 1:
		sprite_2d_2.self_modulate = Color.AQUA
	elif type == 2:
		sprite_2d_2.self_modulate = Color.CRIMSON

func hit(type_hit : int):
	if (type_hit == type):
		print("Note Hit!")
		if (path == 0):
			position.y = pos_start
			if (type == 1):
				type = 2
			else:
				type = 1
	else:
		print("Wrong Hit!")

func set_x_pos(pos : int):
	position.x = pos
