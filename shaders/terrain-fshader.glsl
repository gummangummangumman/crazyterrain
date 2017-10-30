// Other attributes and uniforms are supposed to be filled in by Three.js
// To avoid it being filled in automatically, use RawShaderMaterial

varying vec2 vUv;

uniform sampler2D heightMap;

uniform sampler2D seabed;
uniform sampler2D grass;
uniform sampler2D rock;
uniform sampler2D snow;

uniform vec2 terrainTextureScale;

uniform float grassLevel;
uniform float rockLevel;
uniform float snowLevel;

void main()
{
      //float height = 0.3;
      float height = texture2D(heightMap, vUv).r;

      vec2 scaledUv = vUv * terrainTextureScale;

      vec3 finalColor = vec3(0.0, 0.0, 0.0);

      if (height < grassLevel) {
                finalColor = texture2D(seabed, scaledUv).rgb;
      } else if (height < rockLevel) {
                finalColor = texture2D(grass, scaledUv).rgb;
      } else if (height < snowLevel){
                finalColor = texture2D(rock, scaledUv).rgb;
      } else {
                finalColor = texture2D(snow, scaledUv).rgb;
      }

	  gl_FragColor = vec4(finalColor, 1.0);

}