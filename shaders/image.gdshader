shader_type canvas_item;

uniform sampler2D image;

void fragment() {
	vec4 image_color = texture(image, UV);
	COLOR.rgba = image_color;
}
