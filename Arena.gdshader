shader_type canvas_item;

uniform int[32*32] bitcodeMap;
uniform vec2 offSet;
uniform vec2 tileSize;

void fragment() {
	ivec2 tilePos = ivec2(((FRAGCOORD.xy)/tileSize/2.)) ;
	int code = bitcodeMap[tilePos.x*32+tilePos.y];
	
	
	if (code > 0) {
		vec4 tex_color = texture(TEXTURE, UV);
		if(mod(float(code), 2.) >= 1.)tex_color.r+=.2;
		if(mod(float(code)/2., 2.) >= 1.)tex_color.r+=.2;;
		if(mod(float(code)/4., 2.) >= 1.)tex_color.r+=.2;;
		if(mod(float(code)/8., 2.) >= 1.)tex_color.r+=.2;;
		COLOR = vec4(tex_color.rgb, 1.0);
	}
}
