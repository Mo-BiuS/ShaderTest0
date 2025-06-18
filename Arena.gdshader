shader_type canvas_item;

uniform sampler2D bitcodeMap;
varying vec2 vertex_local;

void vertex() {
	VERTEX.x+=sin(TIME);
	VERTEX.y+=cos(TIME);
	vertex_local = VERTEX;
}

void fragment() {
	vec4 tex_color = texture(TEXTURE, UV);
	COLOR = vec4(tex_color.r-(vertex_local.x/2000.0),tex_color.g,tex_color.b,.8);
}
