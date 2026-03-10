extends Area2D

var IsControlerUsed : bool
var startx : int 
var starty : int
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	IsControlerUsed = false
	hide()
	
	startx = position.x
	starty = position.y
	
	
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if IsControlerUsed:

		var x = Input.get_joy_axis(0, JOY_AXIS_LEFT_X)
		var y = Input.get_joy_axis(0, JOY_AXIS_LEFT_Y)

		#print("X:", x, "Y:", y)
		
		
		position.x = startx + (100*x)
		position.y = starty + (100*y)
		
		
		
		
		
	
func _input(event: InputEvent) -> void:
	if event is InputEventMouseMotion:
		if IsControlerUsed == false:
			Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
			
	if event is InputEventMouseButton:
			Input.mouse_mode = Input.MOUSE_MODE_VISIBLE

	if event is InputEventJoypadMotion or event is InputEventJoypadButton:
		Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
		IsControlerUsed = true
		show()

func control():
	pass
