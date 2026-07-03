using UnityEngine;
using UnityEngine.UI;
using UnityEngine.EventSystems;

[RequireComponent(typeof(GameUI))]
public class UIBuilder : MonoBehaviour
{
    private GameUI gameUI;

    private void Awake()
    {
        gameUI = GetComponent<GameUI>();
        BuildInterface();
    }

    private void BuildInterface()
    {
        // 1. Create Canvas
        GameObject canvasObj = new GameObject("Canvas");
        Canvas canvas = canvasObj.AddComponent<Canvas>();
        canvas.renderMode = RenderMode.ScreenSpaceOverlay;
        canvasObj.AddComponent<CanvasScaler>().uiScaleMode = CanvasScaler.ScaleMode.ScaleWithScreenSize;
        canvasObj.AddComponent<GraphicRaycaster>();

        // Create EventSystem if not exists
        if (FindAnyObjectByType<EventSystem>() == null)
        {
            GameObject esObj = new GameObject("EventSystem");
            esObj.AddComponent<EventSystem>();
            esObj.AddComponent<StandaloneInputModule>();
        }

        // 2. Background Panel (Dark Blue #0A0E1A)
        GameObject bgObj = CreateUIObject("Background", canvasObj);
        RectTransform bgRect = bgObj.GetComponent<RectTransform>();
        bgRect.anchorMin = Vector2.zero;
        bgRect.anchorMax = Vector2.one;
        bgRect.sizeDelta = Vector2.zero;
        Image bgImg = bgObj.AddComponent<Image>();
        bgImg.color = new Color(0.04f, 0.05f, 0.1f, 1f); // #0A0E1A

        // 3. Header Panel (Hero HP and Round)
        GameObject headerObj = CreateUIObject("HeaderPanel", bgObj);
        SetRect(headerObj, new Vector2(0f, 0.85f), new Vector2(1f, 1f), new Vector2(0, -20, 0, 0));
        
        GameObject roundObj = CreateTextObject("RoundText", headerObj, "ROUND 1", 28, Color.yellow, TextAnchor.MiddleCenter);
        SetRect(roundObj, new Vector2(0.4f, 0.5f), new Vector2(0.6f, 1f), Vector4.zero);
        gameUI.roundText = roundObj.GetComponent<Text>();

        GameObject stateObj = CreateTextObject("StateText", headerObj, "Phase: Setup", 20, Color.cyan, TextAnchor.MiddleCenter);
        SetRect(stateObj, new Vector2(0.3f, 0f), new Vector2(0.7f, 0.5f), Vector4.zero);
        gameUI.stateText = stateObj.GetComponent<Text>();

        GameObject playerHP = CreateTextObject("PlayerHPText", headerObj, "Player Hero HP: 100", 22, Color.green, TextAnchor.MiddleLeft);
        SetRect(playerHP, new Vector2(0.05f, 0f), new Vector2(0.35f, 1f), Vector4.zero);
        gameUI.playerHeroHPText = playerHP.GetComponent<Text>();

        GameObject oppHP = CreateTextObject("OpponentHPText", headerObj, "Opponent Hero HP: 100", 22, Color.red, TextAnchor.MiddleRight);
        SetRect(oppHP, new Vector2(0.65f, 0f), new Vector2(0.95f, 1f), Vector4.zero);
        gameUI.opponentHeroHPText = oppHP.GetComponent<Text>();

        // 4. Main Board (Center)
        GameObject boardObj = CreateUIObject("BoardPanel", bgObj);
        SetRect(boardObj, new Vector2(0.02f, 0.35f), new Vector2(0.65f, 0.82f), Vector4.zero);
        
        // Opponent slots (Top row)
        GameObject oppLabel = CreateTextObject("OpponentLabel", boardObj, "OPPONENT SLOTS", 18, Color.red, TextAnchor.MiddleCenter);
        SetRect(oppLabel, new Vector2(0f, 0.9f), new Vector2(1f, 1f), Vector4.zero);

        GameObject oppSlotsPanel = CreateUIObject("OpponentSlots", boardObj);
        SetRect(oppSlotsPanel, new Vector2(0f, 0.5f), new Vector2(1f, 0.85f), Vector4.zero);
        var oppLayout = oppSlotsPanel.AddComponent<GridLayoutGroup>();
        oppLayout.cellSize = new Vector2(110, 160);
        oppLayout.spacing = new Vector2(10, 0);
        oppLayout.childAlignment = TextAnchor.MiddleCenter;

        for (int i = 0; i < 5; i++)
        {
            GameObject slot = CreateUIObject($"OppSlot_{i}", oppSlotsPanel);
            slot.AddComponent<Image>().color = new Color(0.15f, 0.15f, 0.25f, 0.8f);
            GameObject txt = CreateTextObject("Text", slot, "[ Empty ]", 14, Color.white, TextAnchor.MiddleCenter);
            SetRect(txt, Vector2.zero, Vector2.one, Vector4.zero);
            gameUI.opponentSlotTexts[i] = txt.GetComponent<Text>();
        }

        // Player slots (Bottom row)
        GameObject playerLabel = CreateTextObject("PlayerLabel", boardObj, "YOUR SLOTS (SELECT CARD THEN CLICK SLOT TO DEPLOY)", 16, Color.green, TextAnchor.MiddleCenter);
        SetRect(playerLabel, new Vector2(0f, 0.4f), new Vector2(1f, 0.5f), Vector4.zero);

        GameObject playerSlotsPanel = CreateUIObject("PlayerSlots", boardObj);
        SetRect(playerSlotsPanel, new Vector2(0f, 0.05f), new Vector2(1f, 0.4f), Vector4.zero);
        var playerLayout = playerSlotsPanel.AddComponent<GridLayoutGroup>();
        playerLayout.cellSize = new Vector2(110, 160);
        playerLayout.spacing = new Vector2(10, 0);
        playerLayout.childAlignment = TextAnchor.MiddleCenter;

        for (int i = 0; i < 5; i++)
        {
            GameObject slotBtn = CreateButtonObject($"PlayerSlot_{i}", playerSlotsPanel);
            slotBtn.GetComponent<Image>().color = new Color(0.15f, 0.25f, 0.15f, 0.8f);
            GameObject txt = CreateTextObject("Text", slotBtn, "[ Empty ]", 14, Color.white, TextAnchor.MiddleCenter);
            SetRect(txt, Vector2.zero, Vector2.one, Vector4.zero);
            gameUI.playerSlotButtons[i] = slotBtn.GetComponent<Button>();
            gameUI.playerSlotTexts[i] = txt.GetComponent<Text>();
        }

        // 5. Hand Panel (Bottom)
        GameObject handContainer = CreateUIObject("HandPanel", bgObj);
        SetRect(handContainer, new Vector2(0.02f, 0.05f), new Vector2(0.65f, 0.32f), Vector4.zero);
        handContainer.AddComponent<Image>().color = new Color(0.1f, 0.12f, 0.2f, 0.6f);
        
        GameObject handLabel = CreateTextObject("HandLabel", handContainer, "YOUR HAND (0 Spawn Delay Cards are Ready)", 16, Color.yellow, TextAnchor.MiddleCenter);
        SetRect(handLabel, new Vector2(0f, 0.85f), new Vector2(1f, 1f), Vector4.zero);

        GameObject handScroll = CreateUIObject("HandScroll", handContainer);
        SetRect(handScroll, Vector2.zero, new Vector2(1f, 0.82f), Vector4.zero);
        var handContent = CreateUIObject("Content", handScroll);
        SetRect(handContent, Vector2.zero, Vector2.one, Vector4.zero);
        var handHLayout = handContent.AddComponent<HorizontalLayoutGroup>();
        handHLayout.spacing = 10;
        handHLayout.childControlWidth = false;
        handHLayout.childControlHeight = false;
        handHLayout.childForceExpandWidth = false;
        handHLayout.childForceExpandHeight = false;
        handHLayout.padding = new RectOffset(10, 10, 10, 10);
        gameUI.handPanel = handContent.transform;

        // 6. Combat Log (Right Side)
        GameObject logContainer = CreateUIObject("LogPanel", bgObj);
        SetRect(logContainer, new Vector2(0.68f, 0.15f), new Vector2(0.98f, 0.82f), Vector4.zero);
        logContainer.AddComponent<Image>().color = new Color(0.05f, 0.06f, 0.12f, 0.9f);
        
        GameObject logTitle = CreateTextObject("LogTitle", logContainer, "COMBAT LOG", 18, Color.yellow, TextAnchor.MiddleCenter);
        SetRect(logTitle, new Vector2(0f, 0.94f), new Vector2(1f, 1f), Vector4.zero);

        GameObject logScrollObj = CreateUIObject("Scroll View", logContainer);
        SetRect(logScrollObj, Vector2.zero, new Vector2(1f, 0.93f), Vector4.zero);
        ScrollRect scrollRect = logScrollObj.AddComponent<ScrollRect>();
        gameUI.logScrollRect = scrollRect;

        // Viewport
        GameObject viewport = CreateUIObject("Viewport", logScrollObj);
        SetRect(viewport, Vector2.zero, Vector2.one, Vector4.zero);
        viewport.AddComponent<Mask>();
        viewport.AddComponent<Image>().color = new Color(0,0,0,0.1f);
        scrollRect.viewport = viewport.GetComponent<RectTransform>();

        // Content Text
        GameObject contentTxtObj = CreateTextObject("ContentText", viewport, "Log starts here...", 14, Color.white, TextAnchor.UpperLeft);
        RectTransform contentRect = contentTxtObj.GetComponent<RectTransform>();
        contentRect.anchorMin = new Vector2(0f, 0f);
        contentRect.anchorMax = new Vector2(1f, 1f);
        contentRect.sizeDelta = new Vector2(0f, 1500f); // large scroll area
        scrollRect.content = contentRect;
        scrollRect.vertical = true;
        scrollRect.horizontal = false;
        gameUI.logText = contentTxtObj.GetComponent<Text>();

        // 7. Control Buttons
        GameObject endTurnBtnObj = CreateButtonObject("EndTurnButton", bgObj);
        SetRect(endTurnBtnObj, new Vector2(0.68f, 0.05f), new Vector2(0.98f, 0.12f), Vector4.zero);
        endTurnBtnObj.GetComponent<Image>().color = Color.yellow;
        CreateTextObject("Label", endTurnBtnObj, "END PLACEMENT", 18, Color.black, TextAnchor.MiddleCenter);
        gameUI.endTurnButton = endTurnBtnObj.GetComponent<Button>();

        // 8. Game Over Panel
        GameObject gameOverPanel = CreateUIObject("GameOverPanel", bgObj);
        SetRect(gameOverPanel, Vector2.zero, Vector2.one, Vector4.zero);
        gameOverPanel.AddComponent<Image>().color = new Color(0f, 0f, 0f, 0.85f);
        gameUI.gameOverPanel = gameOverPanel;

        GameObject winTxtObj = CreateTextObject("WinnerText", gameOverPanel, "Player Wins!", 36, Color.yellow, TextAnchor.MiddleCenter);
        SetRect(winTxtObj, new Vector2(0.1f, 0.5f), new Vector2(0.9f, 0.7f), Vector4.zero);
        gameUI.winnerText = winTxtObj.GetComponent<Text>();

        GameObject restartBtnObj = CreateButtonObject("RestartButton", gameOverPanel);
        SetRect(restartBtnObj, new Vector2(0.35f, 0.35f), new Vector2(0.65f, 0.45f), Vector4.zero);
        restartBtnObj.GetComponent<Image>().color = Color.green;
        CreateTextObject("Label", restartBtnObj, "PLAY AGAIN", 20, Color.white, TextAnchor.MiddleCenter);
        gameUI.restartButton = restartBtnObj.GetComponent<Button>();

        // 9. Card Prefab Generation (to be used inside the hand list)
        CreateCardPrefab();
    }

    private void CreateCardPrefab()
    {
        GameObject cardPrefabObj = new GameObject("CardPrefab");
        RectTransform rect = cardPrefabObj.AddComponent<RectTransform>();
        rect.sizeDelta = new Vector2(100, 150);
        cardPrefabObj.AddComponent<Image>().color = Color.white;
        cardPrefabObj.AddComponent<Button>();

        GameObject nameTxt = CreateTextObject("NameText", cardPrefabObj, "Card Name", 14, Color.black, TextAnchor.UpperCenter);
        SetRect(nameTxt, new Vector2(0.05f, 0.6f), new Vector2(0.95f, 0.95f), Vector4.zero);

        GameObject statsTxt = CreateTextObject("StatsText", cardPrefabObj, "ATK: 0 HP: 0", 12, Color.black, TextAnchor.MiddleCenter);
        SetRect(statsTxt, new Vector2(0.05f, 0.3f), new Vector2(0.95f, 0.6f), Vector4.zero);

        GameObject delayTxt = CreateTextObject("DelayText", cardPrefabObj, "Ready", 12, Color.red, TextAnchor.LowerCenter);
        SetRect(delayTxt, new Vector2(0.05f, 0.05f), new Vector2(0.95f, 0.3f), Vector4.zero);

        // Save as reference
        gameUI.cardPrefab = cardPrefabObj;
        cardPrefabObj.transform.SetParent(transform);
        cardPrefabObj.SetActive(false); // Hide the master template
    }

    private GameObject CreateUIObject(string name, GameObject parent)
    {
        GameObject go = new GameObject(name);
        go.AddComponent<RectTransform>();
        go.transform.SetParent(parent.transform, false);
        return go;
    }

    private GameObject CreateTextObject(string name, GameObject parent, string text, int fontSize, Color color, TextAnchor anchor)
    {
        GameObject go = CreateUIObject(name, parent);
        Text t = go.AddComponent<Text>();
        t.text = text;
        t.font = Resources.GetBuiltinResource<Font>("LegacyRuntime.ttf");
        t.fontSize = fontSize;
        t.color = color;
        t.alignment = anchor;
        return go;
    }

    private GameObject CreateButtonObject(string name, GameObject parent)
    {
        GameObject go = CreateUIObject(name, parent);
        go.AddComponent<Image>();
        go.AddComponent<Button>();
        return go;
    }

    private void SetRect(GameObject go, Vector2 anchorMin, Vector2 anchorMax, Vector4 sizeDelta)
    {
        RectTransform rt = go.GetComponent<RectTransform>();
        rt.anchorMin = anchorMin;
        rt.anchorMax = anchorMax;
        // sizeDelta: left, bottom, right, top offset
        rt.offsetMin = new Vector2(sizeDelta.x, sizeDelta.y);
        rt.offsetMax = new Vector2(sizeDelta.z, sizeDelta.w);
    }
}
