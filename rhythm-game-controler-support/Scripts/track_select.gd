extends Control
@onready var button_2: Button = $Button2
@onready var button_3: Button = $Button3
@onready var button: Button = $Button
@onready var label_2: Label = $Label2
@onready var label_5: Label = $Label5 #
@onready var label_6: Label = $Label6
@onready var label_4: Label = $Label4
@onready var label_7: Label = $Label7
@onready var sprite_2d: Sprite2D = $Sprite2D #
@onready var sprite_2d_2: Sprite2D = $Sprite2D2
@onready var sprite_2d_3: Sprite2D = $Sprite2D3
@onready var label_3: Label = $Label3 #
@onready var panel_2: Panel = $Panel2 #
@onready var h_box_container: HBoxContainer = $HBoxContainer
@onready var labelchar: Label = $Labelchar
@onready var v_box_container_2: VBoxContainer = $VBoxContainer2
@onready var charport: Sprite2D = $charport


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	panel_2.hide()
	h_box_container.hide()
	labelchar.hide()
	v_box_container_2.hide()
	charport.hide()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_button_2_pressed() -> void:
	button.hide()
	button_3.hide()
	label_2.hide()
	#label_3.hide()
	#label_5.hide()
	label_4.hide()
	label_6.hide()
	label_7.hide()
	#sprite_2d.hide()
	sprite_2d_2.hide()
	sprite_2d_3.hide()
	button_2.hide()
	
	
	panel_2.show()
	labelchar.show()
	h_box_container.show()
	label_5.position = Vector2(label_5.get_screen_position().x,100)
	label_3.position = Vector2(label_3.get_screen_position().x,90)
	sprite_2d.position = Vector2(sprite_2d.position.x,125)
	pass # Replace with function body.

func difficulty():
	h_box_container.hide()
	charport.show()
	labelchar.text = "Select Difficulty:"
	v_box_container_2.show()

func _on_button_char_pressed() -> void:
	difficulty()


func _on_button_char_2_pressed() -> void:
	difficulty()
	pass # Replace with function body.


func _on_button_char_3_pressed() -> void:
	difficulty()
	pass # Replace with function body.


func _on_button_char_4_pressed() -> void:
	difficulty()
	pass # Replace with function body.


func _on_button_char_5_pressed() -> void:
	difficulty()
	pass # Replace with function body.


func _on_button_diff_pressed() -> void:
	get_tree().change_scene_to_file("res://gameplay.tscn")


func _on_button_diff_2_pressed() -> void:
	get_tree().change_scene_to_file("res://gameplay.tscn")


func _on_button_diff_3_pressed() -> void:
	get_tree().change_scene_to_file("res://gameplay.tscn")
