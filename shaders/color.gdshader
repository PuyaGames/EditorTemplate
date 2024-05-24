shader_type canvas_item;


uniform vec4 pure_color : source_color = vec4(1.0);


void fragment() {
	COLOR = pure_color;
}
