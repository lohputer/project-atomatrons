shader_type canvas_item;

uniform sampler2D screen_texture : hint_screen_texture;

void fragment() {
	vec2 uv = SCREEN_UV;
    uv.x += sin(SCREEN_UV.y * 10.0 + TIME) * 1; 
    uv.y += sin(SCREEN_UV.x * 10.0 + TIME) * 1;

    COLOR = texture(screen_texture, uv);
}
