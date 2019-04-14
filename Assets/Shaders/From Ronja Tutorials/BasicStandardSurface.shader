﻿Shader "Tutorial/005_surface" {
	Properties {
		_Color ("Tint", Color) = (0, 0, 0, 1)
		_MainTex ("Texture", 2D) = "white" {}
		_Smoothness ("Smoothness", Range(0,1)) = 0
		_Metallic ("Metalness", Range(0, 1)) = 0
		[HDR] _Emission ("Emission", Color) = (0, 0, 0)
	}
	SubShader {
		Tags{ "RenderType"="Opaque" "Queue"="Geometry"}

		CGPROGRAM
		
		#pragma surface surf Standard fullforwardshadows
		#pragma target 3.0
		
		struct Input {
		    float2 uv_MainTex;
		};

        half _Smoothness;
        half _Metallic;
		sampler2D _MainTex;
		fixed4 _Color;
		half3 _Emission;

		void surf(Input i, inout SurfaceOutputStandard o) {
			fixed4 col = tex2D(_MainTex, i.uv_MainTex);
			col *= _Color;
			o.Albedo = col.rgb;
			o.Metallic = _Metallic;
			o.Smoothness = _Smoothness;
			o.Emission = _Emission;
		}
		
		ENDCG
	}
	FallBack "Standard"
}