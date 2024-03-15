using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;
using TMPro;
using UnityEditor.Tilemaps;

public class ButtonSequence : MonoBehaviour
{
    private bool isGameRunning = false;
    private bool isPlayerTurn = false;
    private bool isHardMode = false;
    public float clickDelay = 1f;
    public float sequenceDelay = 2f;

    public float flashDuration = 0.2f;
    private int currentIndex = 0;
    private int score = 0;
    private int highScore = 0;
    private List<int> sequence = new List<int>();

    public Button[] buttons;
    public Color[] highlightColors;
    private Color[] defaultColors;

    public Button startButton;

    public Button hardMode;

    public Button easyMode;

    public TextMeshProUGUI scoreText;

    public TextMeshProUGUI highScoreText;

    public AudioClip[] soundClips;
    public AudioClip errorSound;

    private AudioSource audioSource;

    void Start()
    {
        DisableAndHide(easyMode);
        StoreDefaultColors();
        audioSource = GetComponent<AudioSource>();
    }

    public void StartGame()
    {
        startButton.enabled = false;
        isGameRunning = true;
        StartCoroutine(RepeatButtonClickSequence());
        DisableAndHide(hardMode);
        DisableAndHide(easyMode);
    }

    void StopGame()
    {
        isGameRunning = false;
        startButton.enabled = true;
        score = 0;
        scoreText.text = "0";
        sequence.Clear();
        currentIndex = 0;
        clickDelay = 1f;

        if (isHardMode)
        {
            EnableAndShow(easyMode);
        }
        else
        {
            EnableAndShow(hardMode);
        }
    }

    void PlaySound(int soundIndex)
    {
        AudioClip clipToPlay = soundClips[soundIndex];
        audioSource.PlayOneShot(clipToPlay);
    }

    void StoreDefaultColors()
    {
        defaultColors = new Color[buttons.Length];
        for (int i = 0; i < buttons.Length; i++)
        {
            Image buttonImage = buttons[i].GetComponent<Image>();
            if (buttonImage != null)
            {
                defaultColors[i] = buttonImage.color;
            }
        }
    }

    IEnumerator RepeatButtonClickSequence()
    {
        while (isGameRunning)
        {
            yield return StartCoroutine(ClickButtonSequence());
            yield return WaitForPlayerInput();

            if (isHardMode && clickDelay > 0.06)
            {
                clickDelay = clickDelay / 2;
            }


            yield return new WaitForSeconds(sequenceDelay);
        }
    }

    IEnumerator WaitForPlayerInput()
    {
        currentIndex = 0;
        isPlayerTurn = true;

        while (isPlayerTurn && currentIndex < sequence.Count)
        {
            yield return null;
        }

        isPlayerTurn = false;
    }



    IEnumerator ClickButtonSequence()
    {
        sequence.Add(Random.Range(0, buttons.Length));
        currentIndex = 0;

        while (currentIndex < sequence.Count)
        {
            int buttonIndex = sequence[currentIndex];

            ChangeButtonColor(buttons[buttonIndex], highlightColors[buttonIndex]);
            PlaySound(buttonIndex);
            yield return new WaitForSeconds(clickDelay);
            ChangeButtonColor(buttons[buttonIndex], defaultColors[buttonIndex]);
            yield return new WaitForSeconds(0.2f);
            currentIndex++;
        }


    }

    IEnumerator FlashCoroutine(int buttonIndex)
    {
        ChangeButtonColor(buttons[buttonIndex], highlightColors[buttonIndex]);
        yield return new WaitForSeconds(flashDuration);
        ChangeButtonColor(buttons[buttonIndex], defaultColors[buttonIndex]);
    }

    void ChangeButtonColor(Button button, Color color)
    {
        if (button != null)
        {
            Image buttonImage = button.GetComponent<Image>();
            if (buttonImage != null)
            {
                buttonImage.color = color;
            }

            ColorBlock colors = button.colors;
            colors.normalColor = color;
            button.colors = colors;
        }
    }

    public void OnButtonClick(int buttonIndex)
    {


        if (isPlayerTurn)
        {
            StartCoroutine(FlashCoroutine(buttonIndex));


            if (buttonIndex == sequence[currentIndex])
            {
                PlaySound(buttonIndex);
                currentIndex++;

                if (currentIndex == sequence.Count)
                {
                    score += 1;
                    scoreText.text = score.ToString();
                }
            }
            else
            {

                if (score > highScore)
                {
                    highScore = score;
                    highScoreText.text = highScore.ToString();
                }

                audioSource.PlayOneShot(errorSound);
                isPlayerTurn = false;
                StopGame();

            }
        }


    }

    public void SetHardMode()
    {
        isHardMode = true;
        clickDelay = 1f;
        EnableAndShow(easyMode);
        DisableAndHide(hardMode);
    }

    public void SetEasyMode()
    {
        isHardMode = false;
        clickDelay = 1f;
        EnableAndShow(hardMode);
        DisableAndHide(easyMode);
    }

    public void DisableAndHide(Button button)
    {
        button.interactable = false;
        button.GetComponent<Image>().enabled = false;

        TextMeshProUGUI buttonText = button.GetComponentInChildren<TextMeshProUGUI>();
        if (buttonText != null)
        {
            buttonText.enabled = false;
        }
    }

    public void EnableAndShow(Button buttonToEnable)
    {
        buttonToEnable.interactable = true;
        buttonToEnable.GetComponent<Image>().enabled = true;

        TextMeshProUGUI buttonText = buttonToEnable.GetComponentInChildren<TextMeshProUGUI>();
        if (buttonText != null)
        {
            buttonText.enabled = true;
        }
    }
}
