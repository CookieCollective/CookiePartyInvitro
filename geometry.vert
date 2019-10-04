precision mediump float;

attribute vec4 position;
attribute vec4 seed;
uniform mat4 viewProjection;
uniform float time;
uniform vec2 resolution;

const float PI = 3.1415;

mat2 rotation (float a) { float c=cos(a),s=sin(a); return mat2(c,-s,s,c); }

void main () {
	vec4 pos = position;
	float t = time * 0.5 + seed.w*.2 + 164.;//(seed.w * 0.1 + 0.5 + 0.5);
	float delay = 3.0;
	float ratio = mod(t, delay)/delay;
	float fade = smoothstep(0.0,0.1,ratio)*smoothstep(1.0,0.9,ratio);
	float wave = pow(ratio, 4.0);
	float range = (mod(ratio+seed.w*1.5,1.) * 2. - 1.)*20.;
	pos.yz *= rotation(PI/2.);
	pos.z += range;
	pos.y += sin(pos.z*.5)*.5;
	pos.xy *= rotation(pos.z * .1);
	// pos.xz *= rotation(time*seed.w);
	// pos.yz *= rotation(time*seed.w);
	// pos.yx *= rotation(time*seed.w);
	// pos.xyz *= 0.2 + seed.z * 0.1 + 0.2 * smoothstep(0.5,1.0,seed.x*0.5+0.5);
	// pos.xyz *= fade * (1.-wave);
	// pos.xyz += seed.xyz * (pow(ratio,0.5)*2.);
	// pos.xz *= rotation(t*.687);
	// pos.yz *= rotation(t*.57468);
	// pos.yx *= rotation(t*.132);
	gl_Position = viewProjection * pos;
}