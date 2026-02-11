extends CharacterBody2D
@onready var collision_shape_2d: CollisionShape2D = $CollisionShape2D
@onready var note: Area2D = $"../../Note/Note"
@onready var sprite_2d: Sprite2D = $Sprite2D

@export var max_delay : int

var is_mouse_inside: bool = false
enum{
	None = 0,
	Single = 1,
	Hold = 2,
}
var note_collide : int = None
var collision_point
var collision_info
var blue_time_delay : int = 0
var red_time_delay : int = 0
@export var path : int

# Called when the node enters the scene tree for the first time.
func ready_() -> void:
	if path == 1:
		note.set_x_pos(position.x)
	pass
	#mouse_entered.connect(_on_mouse_entered)
	#mouse_exited.connect(_on_mouse_exited)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func process_(delta: float) -> void:
	collision_info = move_and_collide(velocity)
	if collision_info:
		collision_point = collision_info.get_position()
	else:
		collision_point = 0
		
	if collision_point != 0:
		print("Note")
		

	sprite_2d.modulate = Color(1,1,1)
	if (blue_time_delay >  0):
		sprite_2d.modulate = Color.AQUA
		blue_time_delay -= 1
	if (red_time_delay > 0):
		sprite_2d.modulate = Color.CRIMSON
		red_time_delay -= 1


	
func input_(event: InputEvent) -> void:
	if is_mouse_inside:
		if event.is_action_pressed("Inner"):
			print("1")
			
			if (blue_time_delay ==  0):
				blue_time_delay = max_delay
				
			if note_collide != None:
				note.hit(1)
		elif event.is_action_pressed("Outer"):
			print("2")
			if (red_time_delay ==  0):
				red_time_delay = max_delay
			if note_collide != None:
				note.hit(2)


func _on_area_2d_area_entered(area: Area2D) -> void:
	if area.name == "Note":
		print("Note is inside hit zone!")
		note_collide = Single


func _on_area_2d_mouse_entered() -> void:
	is_mouse_inside = true


func _on_area_2d_mouse_exited() -> void:
	is_mouse_inside = false


func _on_area_2d_area_exited(area: Area2D) -> void:
	if area.name == "Note":
		print("Note left hit zone!")
		note_collide = None
