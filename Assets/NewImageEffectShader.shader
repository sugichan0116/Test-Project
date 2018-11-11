Shader "Hidden/NewImageEffectShader"
{
    Properties
    {
        _MainTex ("Texture", 2D) = "white" {}
    }
    SubShader
    {
        // No culling or depth
        Cull Off ZWrite Off ZTest Always

        Pass
        {
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag

            #include "UnityCG.cginc"

            struct appdata
            {
                float4 vertex : POSITION;
                float2 uv : TEXCOORD0;
            };

            struct v2f
            {
                float2 uv : TEXCOORD0;
                float4 vertex : SV_POSITION;
            };

            v2f vert (appdata v)
            {
                v2f o;
                o.vertex = UnityObjectToClipPos(v.vertex);
                o.uv = v.uv;
                return o;
            }

            sampler2D _MainTex;

			fixed4 frag(v2f i) : SV_Target
			{
				fixed4 col = tex2D(_MainTex, i.uv);

				float s = 0.05;
				fixed2 r, R;
				fixed2 ap = fixed2(1, _ScreenParams.y / _ScreenParams.x);
				r = i.uv * ap;
				R = r;
				R.y = ap.y- R.y;
				R = round(R/s);
				r %= s;
				r -= fixed2(s, s) / 2;

				float t = (sin(_Time.y) * 30 - R.x*s*3 - R.y) * 0.2;
				
				if(abs(abs(r.x) + abs(r.y)) < s * t)
				col *= 0.5;

				return col;
			}
            ENDCG
        }
    }
}
