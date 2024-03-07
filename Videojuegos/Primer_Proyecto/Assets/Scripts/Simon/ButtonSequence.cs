using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

public class ButtonSequence : MonoBehaviour
{
    public Button[] buttons;
    public Color[] highlightColors; 
    private Color[] defaultColors; 
    public float clickDelay = 1f;
    public float sequenceDelay = 3f;

    public float flashDuration = 0.2f;
    private bool isPlayerTurn = false;

    private List<int> sequence = new List<int>(); 
    private int currentIndex = 0; 
    

    void Start()
    {
        StoreDefaultColors();
        
    }

    public void StartGame() {
        StartCoroutine(RepeatButtonClickSequence());
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
        while (true) 
        {
            yield return StartCoroutine(ClickButtonSequence());
            yield return WaitForPlayerInput(); 
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

    

    IEnumerator ClickButtonSequence() {
        sequence.Add(Random.Range(0, buttons.Length));
        currentIndex = 0;

        while (currentIndex < sequence.Count) {
            int buttonIndex = sequence[currentIndex];

            ChangeButtonColor(buttons[buttonIndex], highlightColors[buttonIndex]);
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

    void ChangeButtonColor(Button button, Color color) {
        if (button != null) {
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

   public void OnButtonClick(int buttonIndex) {
    if (isPlayerTurn) {
         StartCoroutine(FlashCoroutine(buttonIndex));
    
   
    if (buttonIndex == sequence[currentIndex]) {
        currentIndex++;
        Debug.Log("Matched color: " + buttonIndex);
    } else {
        Debug.Log("Missed color: " + buttonIndex + ", you should have clicked: " + sequence[currentIndex]);
    }
    }

   
    }
}
