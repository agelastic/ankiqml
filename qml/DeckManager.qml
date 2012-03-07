import Qt 4.7

Rectangle {
    id: deckManager
    anchors.fill: parent
    ListView {
        id: decksList
        anchors.fill: parent
        model: decksModel
        header: Component {
            Rectangle {
                height: 80
                width: parent.width
                color: "#444"
                Text {
                    text: qsTr("Decks")
                    anchors.centerIn: parent
                    font.pointSize: 32
                    color: "white"
                }
            }
        }
        cacheBuffer: 800 
        delegate: Component { DeckListDelegate{} }
    }

    function delay(ms) {
        ms += new Date().getTime();
        while (new Date() < ms){}
    } 

    function loadDecks() {
        console.log("Loading info: " + decksList.model.getCount());
        for (var i = 0; i < decksModel.getCount(); ++i)
        {
            var path = decksModel.getData(i, "deckPath");
            Deck.openDeck(path);
            var name = Deck.getDeckInfo("name");
            var factCount = Deck.getDeckInfo("factCount");
            Deck.closeDeck();
            console.log("Updating " + name);
            delay(100);
            decksModel.setData(i, "deckName", name);
            decksList.model.setData(i, "deckFactCount", factCount);
            console.log("Updated " + name + ": " + factCount);
        }
    }
}
