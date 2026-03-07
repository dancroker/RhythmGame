extends Area2D
@onready var sprite_2d_2: Sprite2D = $Sprite2D2

@export var speed : float
@export var path : int
@export var type : int
var in_hit_area : int
var timer : int = 0
var score : int = 0
@export var scaleValue : float
var pos_start
var pos_start_x

# Called when the node enters the scene tree for the first time.
func ready_() -> void:
	pos_start = position.y
	pos_start_x = position.x
	if type == 1:
		sprite_2d_2.self_modulate = Color.AQUA
	elif type == 2:
		sprite_2d_2.self_modulate = Color.CRIMSON
	scaleValue = 0;
	sprite_2d_2.scale = Vector2(scaleValue,scaleValue)
	sprite_2d_2.hide()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func process_(delta: float) -> void:
	#print(timer)
	if timer > 220:
			timer = 0;
			position.y = pos_start
			position.x = pos_start_x
			scaleValue = 0
			sprite_2d_2.scale = Vector2(scaleValue,scaleValue)
			print("Out of time!")
			score = 1
			hide_all()
	if sprite_2d_2.visible == true:
		scaleValue += 0.001
		sprite_2d_2.scale = Vector2(scaleValue,scaleValue)
		timer += 1
		#print(timer)
		if (path == 0):
			position.y -= (speed*1.5) * delta
			scaleValue += 0.0006
		elif (path == 1):
			position.y -= speed * delta
			position.x += speed/1.2 * delta
			scaleValue += 0.0007
		elif (path == 2):
			#position.y -= speed * delta
			position.x += (speed*1.5) * delta
			scaleValue += 0.0007
		elif (path == 3):
			position.y += speed * delta
			position.x += speed/1* delta
			scaleValue += 0.0011
		elif (path == 4):
			position.y += (speed*1.5) * delta
			scaleValue += 0.0006
		elif (path == 5):
			position.y += speed * delta
			position.x -= speed/1.2 * delta
			scaleValue += 0.0007
		elif (path == 6):
			position.x -= (speed*1.5) * delta
			scaleValue += 0.0006
		elif (path == 7):
			position.y -= speed * delta
			position.x -= speed/1* delta
			scaleValue += 0.0013
		if type == 1:
			sprite_2d_2.self_modulate = Color.AQUA
		elif type == 2:
			sprite_2d_2.self_modulate = Color.CRIMSON
	else:
		timer = 0

func hit(type_hit : int):
	if (type_hit == type):
		print("Note Hit!")
		scaleValue = 0;
		sprite_2d_2.scale = Vector2(scaleValue,scaleValue)
		
		if timer > 120:
			print("Perfet!")
			score = 3
		elif timer > 90:
			print("Close!")
			score = 2
		else:
			print("Miss!")
			score = 1
		
		timer = 0;
		
		position.y = pos_start
		position.x = pos_start_x
		hide_all()
	else:
		print("Wrong Hit!")

func set_x_pos(pos : int):
	position.x = pos

func _on_area_2d_2_area_shape_entered(area_rid: RID, area: Area2D, area_shape_index: int, local_shape_index: int) -> void:
	in_hit_area = true
	

func _on_area_2d_2_area_shape_exited(area_rid: RID, area: Area2D, area_shape_index: int, local_shape_index: int) -> void:
	in_hit_area= false;
	#timer = 0;

func hide_all():
	sprite_2d_2.hide()
	
func show_all():
	#print("Done")
	sprite_2d_2.show()
	
func set_type(type_select):
	type = type_select
	
func launch(type_select):
	set_type(type_select)
	show_all()
	
func getscore():
	if score != 0:
		var score_temp = score
		score = 0
		return score_temp
