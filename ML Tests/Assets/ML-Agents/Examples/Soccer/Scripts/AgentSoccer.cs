using UnityEngine;
using MLAgents;

public class AgentSoccer : Agent
{
    // Note that that the detectable tags are different for the blue and purple teams. The order is
    // * ball
    // * own goal
    // * opposing goal
    // * wall
    // * own teammate
    // * opposing player
    public enum Team
    {
        Purple,
        Blue
    }
    public enum AgentRole
    {
        Striker,
        Goalie
    }

    public Team team;
    public AgentRole agentRole;
    float m_KickPower;
    int m_PlayerIndex;
    public SoccerFieldArea area;

    [HideInInspector]
    public Rigidbody agentRb;
    SoccerAcademy m_Academy;
    Renderer m_AgentRenderer;

    public BoxCollider ignoreMe;
    public BoxCollider ignoreMe2;

    public GameObject soccerBall;
    private Rigidbody sbRBody;

    public GameObject sameTeam;
    public GameObject otherTeamStriker;
    public GameObject otherTeamGoalie;

    private Rigidbody sameTeamRB;
    private Rigidbody otherTeamStrikerRB;
    private Rigidbody otherTeamGoalieRB;

    private void Start()
    {
        Physics.IgnoreCollision(this.GetComponent<SphereCollider>(), ignoreMe);
        if (ignoreMe2 != null)
        {
            Physics.IgnoreCollision(this.GetComponent<SphereCollider>(), ignoreMe2);
        }
    }

    public void ChooseRandomTeam()
    {
        team = (Team)Random.Range(0, 2);
        if (team == Team.Purple)
        {
            JoinPurpleTeam(agentRole);
        }
        else
        {
            JoinBlueTeam(agentRole);
        }
    }

    public void JoinPurpleTeam(AgentRole role)
    {
        agentRole = role;
        team = Team.Purple;
        m_AgentRenderer.material = m_Academy.purpleMaterial;
        tag = "purpleAgent";
    }

    public void JoinBlueTeam(AgentRole role)
    {
        agentRole = role;
        team = Team.Blue;
        m_AgentRenderer.material = m_Academy.blueMaterial;
        tag = "blueAgent";
    }

    public override void InitializeAgent()
    {
        base.InitializeAgent();
        m_AgentRenderer = GetComponentInChildren<Renderer>();
        m_Academy = FindObjectOfType<SoccerAcademy>();
        agentRb = GetComponent<Rigidbody>();
        agentRb.maxAngularVelocity = 500;

        sameTeamRB = sameTeam.GetComponent<Rigidbody>();
        otherTeamStrikerRB = otherTeamStriker.GetComponent<Rigidbody>();
        otherTeamGoalieRB = otherTeamGoalie.GetComponent<Rigidbody>();

        sbRBody = soccerBall.GetComponent<Rigidbody>();

        var playerState = new PlayerState
        {
            agentRb = agentRb,
            startingPos = transform.position,
            agentScript = this,
        };
        area.playerStates.Add(playerState);
        m_PlayerIndex = area.playerStates.IndexOf(playerState);
        playerState.playerIndex = m_PlayerIndex;
    }


    public void MoveAgent(float[] act)
    {
        var dirToGo = Vector3.zero;
        var rotateDir = Vector3.zero;

        var action = Mathf.FloorToInt(act[0]);

        // Goalies and Strikers have slightly different action spaces.
        if (agentRole == AgentRole.Goalie)
        {
            m_KickPower = 0f;
            switch (action)
            {
                case 1:
                    dirToGo = transform.forward * 1f;
                    m_KickPower = 1f;
                    break;
                case 2:
                    dirToGo = transform.forward * -1f;
                    break;
                case 4:
                    dirToGo = transform.right * -1f;
                    break;
                case 3:
                    dirToGo = transform.right * 1f;
                    break;
            }
        }
        else
        {
            m_KickPower = 0f;
            switch (action)
            {
                case 1:
                    dirToGo = transform.forward * 1f;
                    m_KickPower = 1f;
                    break;
                case 2:
                    dirToGo = transform.forward * -1f;
                    break;
                case 3:
                    rotateDir = transform.up * 1f;
                    break;
                case 4:
                    rotateDir = transform.up * -1f;
                    break;
                case 5:
                    dirToGo = transform.right * -0.75f;
                    break;
                case 6:
                    dirToGo = transform.right * 0.75f;
                    break;
            }
        }
        transform.Rotate(rotateDir, Time.deltaTime * 100f);
        agentRb.AddForce(dirToGo * m_Academy.agentRunSpeed,
            ForceMode.VelocityChange);
    }

    public override void AgentAction(float[] vectorAction)
    {
        // Existential penalty for strikers.
        if (agentRole == AgentRole.Striker)
        {
            AddReward(-1f / 1000f);
        }
        // Existential bonus for goalies.
        if (agentRole == AgentRole.Goalie)
        {
            AddReward(-1f / 1000f);
        }
        MoveAgent(vectorAction);
    }

    /// <summary>
    /// Used to provide a "kick" to the ball.
    /// </summary>
    void OnCollisionEnter(Collision c)
    {
        var force = 2000f * m_KickPower;
        if (c.gameObject.CompareTag("ball"))
        {
            var dir = c.contacts[0].point - transform.position;
            dir = dir.normalized;
            c.gameObject.GetComponent<Rigidbody>().AddForce(dir * force);
            AddReward(1.0f / 10.0f);
        }
    }

    void OnTriggerStay(Collider c)
    {
        if (c.gameObject.CompareTag("ball"))
        {
            AddReward(1.0f / 50.0f);
        }
    }

    public override void AgentReset()
    {
        if (m_Academy.randomizePlayersTeamForTraining)
        {
            ChooseRandomTeam();
        }

        if (team == Team.Purple)
        {
            JoinPurpleTeam(agentRole);
            transform.rotation = Quaternion.Euler(0f, -90f, 0f);
        }
        else
        {
            JoinBlueTeam(agentRole);
            transform.rotation = Quaternion.Euler(0f, 90f, 0f);
        }
        transform.position = area.GetRandomSpawnPos(agentRole, team);
        agentRb.velocity = Vector3.zero;
        agentRb.angularVelocity = Vector3.zero;
        agentRb.AddForce(new Vector3(0.0f, 1.0f, 0.0f), ForceMode.Impulse);
        SetResetParameters();
    }

    public override void CollectObservations()
    {
        AddVectorObs(soccerBall.transform.position);
        AddVectorObs(this.transform.position);

        AddVectorObs(agentRb.velocity.x);
        AddVectorObs(agentRb.velocity.z);

        AddVectorObs(sbRBody.velocity.x);
        AddVectorObs(sbRBody.velocity.z);

        AddVectorObs(sameTeam.transform.position);
        AddVectorObs(sameTeamRB.velocity.x);
        AddVectorObs(sameTeamRB.velocity.z);

        AddVectorObs(otherTeamStriker.transform.position);
        AddVectorObs(otherTeamStrikerRB.velocity.x);
        AddVectorObs(otherTeamStrikerRB.velocity.z);

        AddVectorObs(otherTeamGoalie.transform.position);
        AddVectorObs(otherTeamGoalieRB.velocity.x);
        AddVectorObs(otherTeamGoalieRB.velocity.z);
    }

    public void SetResetParameters()
    {
        area.ResetBall();
    }
}
