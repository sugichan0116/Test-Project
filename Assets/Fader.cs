using UnityEngine;

public class Fader : MonoBehaviour
{

    [SerializeField]
    Material m_Material;

    void OnRenderImage(RenderTexture src, RenderTexture dest)
    {
        Graphics.Blit(src, dest, m_Material);
    }
}