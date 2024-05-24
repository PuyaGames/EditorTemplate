extends PanelContainer


@onready var editor_camera : Camera2D = get_node("SubViewportContainer/SubViewport/Camera2D")
@onready var editor_canvas : EditorCanvas = get_node("SubViewportContainer/SubViewport/Canvas")

var right_mouse_button_pressed : bool = false;
var camera_zoom_velocity : Vector2 = Vector2(0.05, 0.05)


func _ready() -> void:
	editor_camera.position = editor_canvas.get_center()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass
	

func _input(event: InputEvent) -> void:
	if Input.is_action_just_pressed("RMB"):
		right_mouse_button_pressed = true;
	elif Input.is_action_just_released("RMB"):
		right_mouse_button_pressed = false;

	if Input.is_action_pressed("MWU"):
		var new_zoom = editor_camera.zoom + camera_zoom_velocity
		new_zoom.x = min(new_zoom.x, 100)
		new_zoom.y = min(new_zoom.y, 100)
		editor_camera.zoom = new_zoom
	elif Input.is_action_pressed("MWD"):
		var new_zoom = editor_camera.zoom - camera_zoom_velocity
		new_zoom.x = max(new_zoom.x, 0.1)
		new_zoom.y = max(new_zoom.y, 0.1)
		editor_camera.zoom = new_zoom

	# Pan the canvas
	if event is InputEventMouseMotion:
		if right_mouse_button_pressed:
			editor_camera.position -= event.relative
		
