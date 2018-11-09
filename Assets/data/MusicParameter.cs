using UnityEngine;
using System.Collections.Generic;

[CreateAssetMenu( menuName = "MyGame/Create MusicParameter", fileName = "MusicParameter" )]
public class MusicParameter : ScriptableObject
{
    [SerializeField]
    public string m_title = "Music";
    [SerializeField]
    public string m_genre = "Speed Core";
    [SerializeField]
    public string m_composer = "nagureo";
    [SerializeField]
    public Vector2 m_bpm = new Vector2(120, 0);
    [SerializeField]
    public List<int> m_difficulty = new List<int>(){1,1,12};

} // class ParameterTable