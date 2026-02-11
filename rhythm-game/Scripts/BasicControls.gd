extends CharacterBody2D
@onready var collision_shape_2d: CollisionShape2D = $CollisionShape2D

var is_mouse_inside: bool = false
enum{
	None = 0,
	Note = 1,
	Hold = 2,
}
var note_collide : int = None
var collision_point
var collision_info
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass
	#mouse_entered.connect(_on_mouse_entered)
	#mouse_exited.connect(_on_mouse_exited)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	collision_info = move_and_collide(velocity)
	if collision_info:
		collision_point = collision_info.get_position()
	else:
		collision_point = 0
		
	if collision_point != 0:
		print("Note")
		
#func _on_mouse_entered() -> void:
	#is_mouse_inside = true
#
#func _on_mouse_exited() -> void:
	#is_mouse_inside = false
	
func _input(event: InputEvent) -> void:
	if is_mouse_inside:
		if event.is_action_pressed("Inner"):
			print("1")
			if note_collide != None:
				print("Note Hit!")
		elif event.is_action_pressed("Outer"):
			print("2")
			if note_collide != None:
				print("Note Hit!")


func _on_area_2d_area_entered(area: Area2D) -> void:
	if area.name == "Note":
		print("Note is inside hit zone!")
		note_collide = Note


func _on_area_2d_mouse_entered() -> void:
	is_mouse_inside = true


func _on_area_2d_mouse_exited() -> void:
	is_mouse_inside = false


func _on_area_2d_area_exited(area: Area2D) -> void:
	if area.name == "Note":
		print("Note left hit zone!")
		note_collide = None
