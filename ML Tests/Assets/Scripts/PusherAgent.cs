using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class PusherAgent : MonoBehaviour
{
    public Rigidbody rBody;

    // Start is called before the first frame update
    void Start()
    {
        rBody = GetComponent<Rigidbody>();
    }

    // Update is called once per frame
    void Update()
    {
        if(Input.GetKey(KeyCode.W))
        {
            rBody.AddForce(transform.forward * 20.0f);
        }
        else if(Input.GetKey(KeyCode.S))
        {
            rBody.AddForce(transform.forward * -20.0f);
        }

        if(Input.GetKey(KeyCode.A))
        {
            rBody.AddRelativeTorque(new Vector3(0.0f, -10.0f, 0.0f));
        }
        else if(Input.GetKey(KeyCode.D))
        {
            rBody.AddRelativeTorque(new Vector3(0.0f, 10.0f, 0.0f));
        }
    }
}
