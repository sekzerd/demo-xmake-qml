import QtQuick 2.12
import QtQuick.Controls 2.5

MouseArea {
    id: dragRegion
    height: 30
    property Window parentWindow
    property alias dragRegionHeight: dragRegion.height

        anchors {
            top: parent.top
            left: parent.left
            right: parent.right
        }

        Rectangle {
            width: parent.width
            height: parent.height
            color: "red"

            Button {
                id: control
                text: qsTr("Button")

                contentItem: Text {
                    text: control.text
                    font: control.font
                    opacity: enabled ? 1.0 : 0.3
                    color: control.down ? "#17a81a" : "#21be2b"
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    elide: Text.ElideRight
                }

                background: Rectangle {
                    anchors: {
                        right: parent.right
                    }

                    opacity: enabled ? 1 : 0.3
                    border.color: control.down ? "#17a81a" : "#21be2b"
                    border.width: 1
                    radius: 2
                }
            }
        }

        property var lastPos
        onPressed: lastPos = Qt.point(mouseX, mouseY)
        onPositionChanged: {
            if (pressed && parentWindow)
            {
                parentWindow.x += mouseX - lastPos.x
                parentWindow.y += mouseY - lastPos.y
            }
            // if (pressed && _parent.x && _parent.y)
            // {
            //     _parent.x = _parent.x + mouseX - lastPos.x
            //     _parent.y = _parent.y + mouseY - lastPos.y
            // }
        }
    }