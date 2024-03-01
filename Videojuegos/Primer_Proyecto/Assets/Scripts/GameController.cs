using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using TMPro;
public class GameController : MonoBehaviour
{
    
    public GameObject dotPrefab;
    public GameObject dot;
    public float force;

    public int pointsLeft = 0;
    public int pointsRight = 0;

    public TMP_Text leftScore;
    public TMP_Text rightScore;

    int maxPoints = 5;

    // Start is called before the first frame update
    void Start()
    {
        StartGame();
    }

    // Update is called once per frame
    void Update()
    {
        if (Input.GetKeyDown(KeyCode.R)) {
            Destroy(dot);
            StartGame();
        }
    }

    public void Reset() {
        Destroy(dot);
        StartGame();
    }

    public void ServeBall() {
    
        Destroy(dot);
        dot = Instantiate(dotPrefab);
        dot.GetComponent<Rigidbody2D>().velocity = (Random.onUnitSphere * force);
    }

    public void StartGame()
    {
        pointsLeft = 0;
        pointsRight = 0;
        leftScore.text = pointsLeft.ToString();
        rightScore.text = pointsRight.ToString();
        ServeBall();
    }

    public void AddPoints(int side) {
        if (side == 0) {
            pointsLeft++;

            if (pointsLeft >= maxPoints) {
                leftScore.text = "Winner! " + pointsLeft.ToString();
            } else {
                leftScore.text = pointsLeft.ToString();
                Reset();
            }
            leftScore.text = pointsLeft.ToString();
        } else {
            pointsRight++;

            if (pointsRight >= maxPoints) {
                rightScore.text = "Winner! " + pointsRight.ToString();
            } else {
                rightScore.text = pointsRight.ToString();
                Reset();
            }


        }

    
    }
}
