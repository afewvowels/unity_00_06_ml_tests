using UnityEngine;
using UnityEngine.UI;
using System.Collections;

public class SoccerBallController : MonoBehaviour
{
    [HideInInspector]
    public SoccerFieldArea area;

    private Rigidbody sbrBody;
    public AgentSoccer lastTouchedBy; //who was the last to touch the ball
    public string agentTag; //will be used to check if collided with a agent
    public string purpleGoalTag; //will be used to check if collided with red goal
    public string blueGoalTag; //will be used to check if collided with blue goal

    public GameObject purpleGoalieWall;
    public GameObject purpleStrikerWall;
    public GameObject blueGoalieWall;
    public GameObject blueStrikerWall;

    public AgentSoccer blueStriker;
    public AgentSoccer blueGoalie;
    public AgentSoccer purpleStriker;
    public AgentSoccer purpleGoalie;

    public Text blueScoreboard;
    public Text purpleScoreboard;
    public Text velocityText;
    public int blueScore = 0;
    public int purpleScore = 0;

    void Start()
    {
        Physics.IgnoreCollision(this.GetComponent<SphereCollider>(), purpleGoalieWall.GetComponent<BoxCollider>());
        Physics.IgnoreCollision(this.GetComponent<SphereCollider>(), blueGoalieWall.GetComponent<BoxCollider>());
        Physics.IgnoreCollision(this.GetComponent<SphereCollider>(), purpleStrikerWall.GetComponent<BoxCollider>());
        Physics.IgnoreCollision(this.GetComponent<SphereCollider>(), blueStrikerWall.GetComponent<BoxCollider>());

        sbrBody = this.GetComponent<Rigidbody>();
    }

    void FixedUpdate()
    {
        if (sbrBody.velocity.magnitude < 0.25f)
        {
            blueStriker.AddReward(-1.0f / 25.0f);
            blueGoalie.AddReward(-1.0f / 25.0f);
            purpleStriker.AddReward(-1.0f / 25.0f);
            purpleGoalie.AddReward(-1.0f / 25.0f);
        }
        else if (sbrBody.velocity.magnitude >= 0.25f && sbrBody.velocity.magnitude < 1.5f)
        {
            blueStriker.AddReward(-1.0f / 100.0f);
            blueGoalie.AddReward(-1.0f / 100.0f);
            purpleStriker.AddReward(-1.0f / 100.0f);
            purpleGoalie.AddReward(-1.0f / 100.0f);
        }
        else if (sbrBody.velocity.magnitude >= 1.5f)
        {
            blueStriker.AddReward(1.0f / 90.0f);
            blueGoalie.AddReward(1.0f / 90.0f);
            purpleStriker.AddReward(1.0f / 90.0f);
            purpleGoalie.AddReward(1.0f / 90.0f);
        }

        if (lastTouchedBy == null)
        {
            blueStriker.AddReward(-1.0f / 10.0f);
            blueGoalie.AddReward(-1.0f / 10.0f);
            purpleStriker.AddReward(-1.0f / 10.0f);
            purpleGoalie.AddReward(-1.0f / 10.0f);
        }
        else if (lastTouchedBy.team == AgentSoccer.Team.Purple)
        {
            blueStriker.AddReward(-1.0f / 50.0f);
            blueGoalie.AddReward(-1.0f / 50.0f);
            purpleStriker.AddReward(1.0f / 100.0f);
            purpleGoalie.AddReward(1.0f / 100.0f);
        }
        else if (lastTouchedBy.team == AgentSoccer.Team.Blue)
        {
            blueStriker.AddReward(1.0f / 100.0f);
            blueGoalie.AddReward(1.0f / 100.0f);
            purpleStriker.AddReward(-1.0f / 50.0f);
            purpleGoalie.AddReward(-1.0f / 50.0f);
        }

        velocityText.text = sbrBody.velocity.magnitude.ToString();
    }

    void OnCollisionEnter(Collision col)
    {
        if (col.gameObject.CompareTag("blueAgent") || col.gameObject.CompareTag("purpleAgent"))
        {
            lastTouchedBy = col.gameObject.GetComponent<AgentSoccer>();
        }

        if (col.gameObject.CompareTag(purpleGoalTag)) //ball touched purple goal
        {
            blueScore++;
            blueScoreboard.text = blueScore.ToString();
            area.GoalTouched(AgentSoccer.Team.Blue);
            if (lastTouchedBy.team == AgentSoccer.Team.Purple)
            {
                if (lastTouchedBy.agentRole == AgentSoccer.AgentRole.Striker)
                {
                    purpleStriker.AddReward(-5.0f);
                    purpleGoalie.AddReward(-3.0f);
                }
                else
                {
                    purpleStriker.AddReward(-2.0f);
                    purpleGoalie.AddReward(-2.0f);
                }
            }
            if (lastTouchedBy.team == AgentSoccer.Team.Blue)
            {
                if (lastTouchedBy.agentRole == AgentSoccer.AgentRole.Striker)
                {
                    blueStriker.AddReward(-5.0f);
                    blueGoalie.AddReward(-3.0f);
                }
                else
                {
                    blueStriker.AddReward(-2.0f);
                    blueGoalie.AddReward(-2.0f);
                }
            }
        }
        if (col.gameObject.CompareTag(blueGoalTag)) //ball touched blue goal
        {
            purpleScore++;
            purpleScoreboard.text = purpleScore.ToString();
            area.GoalTouched(AgentSoccer.Team.Purple);
            if (lastTouchedBy.team == AgentSoccer.Team.Blue)
            {
                blueStriker.AddReward(-4.0f);
                blueGoalie.AddReward(-4.0f);
            }
            if (lastTouchedBy.team == AgentSoccer.Team.Purple)
            {
                purpleStriker.AddReward(2.0f);
                purpleGoalie.AddReward(2.0f);
            }
        }
    }

    void OnTriggerStay(Collider c)
    {
        if (c.gameObject.CompareTag("purpleGoalDetect"))
        {
            blueStriker.AddReward(1.0f / 100.0f);
            
            purpleStriker.AddReward(-1.0f / 50.0f);
            purpleGoalie.AddReward(-1.0f / 25.0f);
        }

        if (c.gameObject.CompareTag("blueGoalDetect"))
        {
            purpleStriker.AddReward(1.0f / 100.0f);

            blueStriker.AddReward(-1.0f / 50.0f);
            blueGoalie.AddReward(-1.0f / 25.0f);
        }

        if (c.gameObject.CompareTag("middleDetect"))
        {
            purpleStriker.AddReward(-1.0f / 50.0f);
            blueStriker.AddReward(-1.0f / 50.0f);
        }
    }

    void OnTriggerExit(Collider c)
    {
        if (c.gameObject.CompareTag("purpleGoalDetect"))
        {
            blueStriker.AddReward(-1.0f / 25.0f);
            
            purpleStriker.AddReward(1.0f / 5.0f);
            purpleGoalie.AddReward(1.0f / 5.0f);
        }

        if (c.gameObject.CompareTag("blueGoalDetect"))
        {
            purpleStriker.AddReward(-1.0f / 25.0f);

            blueStriker.AddReward(1.0f / 5.0f);
            blueGoalie.AddReward(1.0f / 5.0f);
        }

        if (c.gameObject.CompareTag("middleDetect"))
        {
            if (lastTouchedBy.team == AgentSoccer.Team.Blue)
            {
                blueStriker.AddReward(1.0f / 25.0f);
                purpleStriker.AddReward(-1.0f / 50.0f);
            }

            if (lastTouchedBy.team == AgentSoccer.Team.Purple)
            {
                blueStriker.AddReward(-1.0f / 50.0f);
                purpleStriker.AddReward(1.0f / 25.0f);
            }
        }
    }

    void OnTriggerEnter(Collider c)
    {
        if (c.gameObject.CompareTag("purpleGoalDetect"))
        {
            if (lastTouchedBy.team == AgentSoccer.Team.Blue)
            {
                if (lastTouchedBy.agentRole == AgentSoccer.AgentRole.Goalie)
                {
                    blueGoalie.AddReward(1.0f / 50.0f);
                }

                if (lastTouchedBy.agentRole == AgentSoccer.AgentRole.Striker)
                {
                    blueStriker.AddReward(1.0f / 50.0f);
                }
            }

            if (lastTouchedBy.team == AgentSoccer.Team.Purple)
            {
                if (lastTouchedBy.agentRole == AgentSoccer.AgentRole.Goalie)
                {
                    purpleGoalie.AddReward(-1.0f / 25.0f);
                }

                if (lastTouchedBy.agentRole == AgentSoccer.AgentRole.Striker)
                {
                    purpleStriker.AddReward(-1.0f / 25.0f);
                }
            }
        }

        if (c.gameObject.CompareTag("blueGoalDetect"))
        {
            if (lastTouchedBy.team == AgentSoccer.Team.Blue)
            {
                if (lastTouchedBy.agentRole == AgentSoccer.AgentRole.Goalie)
                {
                    blueGoalie.AddReward(-1.0f / 25.0f);
                }

                if (lastTouchedBy.agentRole == AgentSoccer.AgentRole.Striker)
                {
                    blueStriker.AddReward(-1.0f / 25.0f);
                }
            }

            if (lastTouchedBy.team == AgentSoccer.Team.Purple)
            {
                if (lastTouchedBy.agentRole == AgentSoccer.AgentRole.Goalie)
                {
                    purpleGoalie.AddReward(1.0f / 50.0f);
                }

                if (lastTouchedBy.agentRole == AgentSoccer.AgentRole.Striker)
                {
                    purpleStriker.AddReward(1.0f / 50.0f);
                }
            }
        }
    }
}
