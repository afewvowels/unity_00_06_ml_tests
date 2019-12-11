using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class CameraControls : MonoBehaviour
{
    public int activeIndex;
    public List<GameObject> arenas = new List<GameObject>();

    public void Start()
    {
        foreach (GameObject soccerArena in GameObject.FindGameObjectsWithTag("soccerarena"))
        {
            arenas.Add(soccerArena);
        }

        activeIndex = 0;
    }

    public void Update()
    {
        if (Input.GetKeyDown(KeyCode.Space))
        {
            activeIndex++;
            if (activeIndex > arenas.Count - 1)
            {
                activeIndex = 0;
            }
            this.transform.position = arenas[activeIndex].transform.position;
        }
        else if (Input.GetKeyDown(KeyCode.Q))
        {
            this.transform.Rotate(0.0f, 90.0f, 0.0f);
        }
        else if (Input.GetKeyDown(KeyCode.E))
        {
            this.transform.Rotate(0.0f, -90.0f, 0.0f);
        }
    }
}
