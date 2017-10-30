// Other attributes and uniforms are supposed to be filled in by Three.js
// To avoid it being filled in automatically, use RawShaderMaterial

// Instanced attribute, updated only when a new instance is drawn (ie. when all vertices have been drawn and
// we're going to draw a slightly different one.
attribute vec3 translate;
attribute float scale;

varying vec2 vUv;

void main() {

	vec4 mvPosition = modelViewMatrix * vec4( translate + position * scale, 1.0 );

	vUv = uv;

	gl_Position = projectionMatrix * mvPosition;

}