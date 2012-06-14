import QtQuick 1.1
import com.nokia.meego 1.0

Rectangle {
    id: decksProgress
    width: busyIndicator.width
    height: busyIndicator.height
    anchors.centerIn: parent
    visible: false
    border.color: "gray"
    border.width: 2
    color: "white"
    property int value: 0
    BusyIndicator {
        id: busyIndicator
        platformStyle: BusyIndicatorStyle { size: "large" }
        anchors.horizontalCenter: parent.horizontalCenter
        running: true
    }
}
