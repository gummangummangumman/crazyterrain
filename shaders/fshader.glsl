// Other attributes and uniforms are supposed to be filled in by Three.js
// To avoid it being filled in automatically, use RawShaderMaterial

uniform vec3 color;

void main()
{
	gl_FragColor = vec4(color, 1.0);
}