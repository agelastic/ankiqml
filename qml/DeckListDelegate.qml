import Qt 4.7

Rectangle {
    height: 90
    width: parent.width
    border.width: 1
    border.color: "green"

    BorderImage {
        id: background
        anchors.fill: parent
        anchors.leftMargin: -parent.anchors.leftMargin
        anchors.rightMargin: -parent.anchors.rightMargin
        visible: mouseArea.pressed
        source: "image://theme/meegotouch-list-background-pressed-center"
    }


    Item {
        anchors.fill: parent
        anchors.margins: 10
        Column {
            anchors.centerIn: parent
            width: parent.width
            Text {
                id: labelMain
                text: deckName
                font.pointSize: 24
                font.bold: true
            }
            Text {
                id: labelSub
                text: deckFactCount + " " + qsTr("facts")
                font.pointSize:18 
                color: "gray"
            }
        }

        Image {
            source: "image://theme/icon-m-common-drilldown-arrow" + (theme.inverted ? "-inverse" : "")
            anchors.right: parent.right;
            anchors.verticalCenter: parent.verticalCenter
        }

        MouseArea {
            id: mouseArea
            anchors.fill: parent
            onClicked: {
                pageStack.push(Qt.createComponent("DeckPage.qml"), { deckName: deckName });
           }
        }
    }
}
