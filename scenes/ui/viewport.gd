extends PanelContainer


@onready var Camera : Camera2D = get_node("SubViewportContainer/SubViewport/Camera2D")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	


func _on_gui_input(event: InputEvent) -> void:
	if event.is_pressed():
		if event is InputEventMouseButton:
			if event.button_index == MOUSE_BUTTON_WHEEL_UP:
				Camera.zoom += Vector2(0.05, 0.05)
			elif event.button_index == MOUSE_BUTTON_WHEEL_DOWN:
				Camera.zoom -= Vector2(0.05, 0.05)
		
