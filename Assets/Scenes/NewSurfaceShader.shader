Shader "Custom/MyShader"
{
    Properties
    {
        // [HideInInspector]_Color("Main Color",Color) = (1,1,1,1)
        _Color("Main Color",Color) = (1,1,1,1)
        _Value("Intensity", Range(1,5)) = 1
    }

    SubShader
    {
        pass
        {
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #include "UnityCG.cginc"

            fixed4 _Color;
            float _Value;

            struct appdata
            {
                float4 vertex:POSITION;
                float4 color :COLOR;
            };

            struct v2f
            {
                float4 pos:SV_POSITION;
            };

            v2f vert(appdata data)
            {
                v2f o = (v2f)0;
                float4 pos = UnityObjectToClipPos(data.vertex);
                o.pos = pos;
                return o;
            }

            float4 frag(v2f i):SV_TARGET
            {
                return _Color*_Value;
            }
            ENDCG
        }
    }
    FallBack "Diffuse"
}
