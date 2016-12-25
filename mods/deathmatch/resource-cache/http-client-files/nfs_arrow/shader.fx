//	NFS_arrow script by bartekPL
//	
//	All Rights Reserved


texture gOrigTexure0 : TEXTURE0;
texture gCustomTex0 : CUSTOMTEX0;
float gTime : TIME;

float3x3 getTextureTransform ()
{
    float posU = -fmod( gTime/2 ,1 ); 
    float posV = 0;

    return float3x3(
                    1, 0, 0,
                    0, 1, 0,
                    posU, posV, 1
                    );
}

technique hello
{
    pass P0
    {
        Texture[0] = gCustomTex0;     
        TextureTransform[0] = getTextureTransform ();

        TextureTransformFlags[0] = Count2;

        AlphaBlendEnable = true;
        SrcBlend = SrcAlpha;
        DestBlend = InvSrcAlpha;
    }
}
