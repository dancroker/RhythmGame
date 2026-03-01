extends Area2D
@onready var sprite_2d_2: Sprite2D = $Sprite2D2

@export var speed : float
@export var path : int
@export var type : int
@export var in_hit_area : int
@export var scaleValue : float
var pos_start

# Called when the node enters the scene tree for the first time.
func ready_() -> void:
	pos_start = position.y
	if type == 1:
		sprite_2d_2.self_modulate = Color.AQUA
	elif type == 2:
		sprite_2d_2.self_modulate = Color.CRIMSON
	scaleValue = 0.1;
	sprite_2d_2.scale = Vector2(scaleValue,scaleValue)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func process_(delta: float) -> void:
	scaleValue += 0.001
	sprite_2d_2.scale = Vector2(scaleValue,scaleValue)
	if (path == 0):
		position.y -= speed * delta
	elif (path == 1):
		position.y -= speed * delta
		position.x += speed/1.2 * delta
		scaleValue += 0.0003
	if type == 1:
		sprite_2d_2.self_modulate = Color.AQUA
	elif type == 2:
		sprite_2d_2.self_modulate = Color.CRIMSON

func hit(type_hit : int):
	if (type_hit == type and in_hit_area):
		print("Note Hit!")
		scaleValue = 0.1;
		sprite_2d_2.scale = Vector2(scaleValue,scaleValue)
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


func _on_area_2d_2_area_shape_entered(area_rid: RID, area: Area2D, area_shape_index: int, local_shape_index: int) -> void:
	in_hit_area = true
	


func _on_area_2d_2_area_shape_exited(area_rid: RID, area: Area2D, area_shape_index: int, local_shape_index: int) -> void:
	in_hit_area= false;
