// Invert Color Shader
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

void main()
{
    vec4 OC = v_vColour * texture2D( gm_BaseTexture, v_vTexcoord );
	gl_FragColor = vec4(0.06, 0.06, 0.3, OC.a);
}