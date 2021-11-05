// Upgrade NOTE: replaced '_Object2World' with 'unity_ObjectToWorld'

Shader "BeatSaber/Lit Glow Normals"
{
	Properties
	{
		_Color ("Color", Color) = (1,1,1,1)
		[MaterialToggle] _CustomColors("Custom Colors", Float) = 0
		_MainTex ("Texture", 2D) = "white" {}
		_NormalMap ("Normals map", 2D) = "white" {}
		_Glow ("Glow", Range (0, 1)) = 0
		_Ambient ("Ambient Lighting", Range (0, 1)) = 0
		_LightDir ("Light Direction", Vector) = (-1,-1,0,1)
        _HiddenDistance		("Hidden Distance", Range(0,10)) = 0
		[MaterialToggle] _HiddenReverse ("Hidden Distance Reverse", Float) = 0
	}
	SubShader
	{
		Tags { "RenderType"="Opaque" }
		LOD 100

		Pass
		{
			CGPROGRAM
			#pragma vertex vert
			#pragma fragment frag
			// make fog work
			#pragma multi_compile_fog
			
			#include "UnityCG.cginc"

			struct appdata
			{
				float4 vertex : POSITION;
				float2 uv : TEXCOORD0;
				float3 normal : NORMAL;
			};

			struct v2f
			{
				float2 uv : TEXCOORD0;
				float4 vertex : SV_POSITION;
				float4 worldPos : TEXCOORD1;
				float3 viewDir : TEXCOORD2;
				float3 normal : NORMAL;
				float4 tangent : TEXCOORD3;
			};

			float4 _Color;
			float _Glow;
			float _Ambient;
			float4 _LightDir;

			sampler2D _MainTex;
			uniform sampler2D _NormalMap;
			float4 _MainTex_ST;

			float _HiddenReverse;
			float _HiddenDistance;

			void HiddenDistance(v2f IN)
			{
				// カメラとオブジェクトの距離(長さ)を取得
				float dist = length(_WorldSpaceCameraPos - IN.worldPos);
				if (_HiddenReverse <= 0.5f)
				{
					if (dist <= _HiddenDistance)
						clip(-1);
				}
				else
				{
					if (dist >= _HiddenDistance)
						clip(-1);
				}
			}

			v2f vert (appdata_full v)
			{
				v2f o;
				o.vertex = UnityObjectToClipPos(v.vertex);
				/* o.uv = v.uv; */
				o.uv = TRANSFORM_TEX(v.texcoord, _MainTex);
				o.worldPos = mul(unity_ObjectToWorld, v.vertex);
				o.viewDir = normalize(UnityWorldSpaceViewDir(o.worldPos));
				o.normal = UnityObjectToWorldNormal(v.normal);
				o.tangent = float4(UnityObjectToWorldDir(v.tangent.xyz), v.tangent.w);
				return o;
			}
			
			fixed4 frag (v2f i) : SV_Target
			{
				HiddenDistance(i);

				float3 lightDir = normalize(_LightDir.xyz) * -1.0;
				float3 tangentSpaceNormal = UnpackNormal(tex2D(_NormalMap, i.uv));
				
				float binormal = cross(i.normal, i.tangent.xyz) * i.tangent.w;		
						
				i.normal = normalize(
					tangentSpaceNormal.x * i.tangent +
					tangentSpaceNormal.y * binormal +
					tangentSpaceNormal.z * i.normal
				);
				
				float shadow = max(dot(lightDir,i.normal),0);
				// sample the texture
				fixed4 col = _Color * tex2D(_MainTex, TRANSFORM_TEX(i.uv, _MainTex));

				col = col * clamp(col * _Ambient + shadow,0.0,1.0);

				return col * float4(1.0,1.0,1.0,_Glow);
			}


			ENDCG
		}
	}
}
