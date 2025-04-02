import QtQuick 2.12
import QtQuick.Controls 2.5

ApplicationWindow {
    visible: true
    width: 640
    height: 480
    title: qsTr("Scroll")
    flags: Qt.Window | Qt.FramelessWindowHint
    id: window

    // Add this MouseArea as the FIRST child
    MouseArea {
        id: dragRegion
        height: 30
        anchors {

            top: parent.top
            left: parent.left
            right: parent.right
        }

        Rectangle {
            width:parent.width
            height:parent.height
            color: "red"
        }

        property var lastPos
        onPressed: lastPos = Qt.point(mouseX, mouseY)
        onPositionChanged: {
            if (pressed && window.x && window.y)
            {
                window.x = window.x + mouseX - lastPos.x
                window.y = window.y + mouseY - lastPos.y
            }
        }
    }

    ScrollView {
        anchors {
            top: dragRegion.bottom
            left: parent.left
            right: parent.right
            bottom: parent.bottom
        }
    }
}
