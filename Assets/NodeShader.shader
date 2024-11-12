Shader "Custom/NodeShader"
{
    Properties  
    {  
        _Color ("Color", Color) = (1, 1, 1, 1)  
        _Cutoff("Alpha Cutoff",Range(0,1)) = 1

    }  
    SubShader  
    {  
            Tags
        {
	        "Queue"="AlphaTest"
	        "IgnoreProjector"="True"
        }

        LOD 200  
      
        
        Pass  
        {  
            CGPROGRAM  
            #pragma vertex vert  
            #pragma fragment frag 
            float _Cutoff;


        struct appdata_t
        {
            float4 vertex : POSITION;
            float4 color : COLOR;
        };

        struct v2f
        {
            float4 pos : SV_POSITION;
            float4 color : COLOR;
        };

        v2f vert(appdata_t v)
        {
            v2f o;
            o.pos = UnityObjectToClipPos(v.vertex); // ������ת��Ϊ�ü��ռ�  
            o.color = v.color; // ����ɫ���ݵ�Ƭ����ɫ��  
            return o;
        }

        fixed4 frag(v2f i) : SV_TARGET
        {
                        //�����Ѿ��趨����ֵ�����Ƿ���ɫ
            if (i.color.a < _Cutoff)
            {
                discard;
            }
            return i.color; // ���ݴ�����ɫ������ɫ  
        }
                        ENDCG  
                    }  
      }  
    FallBack"Diffuse"  
}
