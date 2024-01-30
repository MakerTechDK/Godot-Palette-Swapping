shader_type canvas_item;

uniform vec4 newPalette[32];
uniform int paletteSize;

void fragment() {
	vec4 indexColor = texture(TEXTURE, UV);
	if(int(indexColor.r * 255.0) == 0){
		COLOR = vec4(0.0);
	}
	else{
		int index = int(indexColor.r * 255.0) - 1;
		vec4 color = newPalette[index];
		COLOR = color;
	}
}