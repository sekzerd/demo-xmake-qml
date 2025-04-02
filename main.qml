import QtQuick 2.12
import QtQuick.Controls 2.5
import QtQuick.Window 2.12

import "/layout/TopBar.qml" as TopBar

ApplicationWindow {
    visible: true
    width: 640
    height: 480
    title: qsTr("Scroll")
    flags: Qt.Window | Qt.FramelessWindowHint
    id: window

    // Add this MouseArea as the FIRST child
    TopBar.MouseArea {
        parentWindow: window
        anchors.top: parent.top
        anchors.left: parent.left
        anchors.right: parent.right

    }

    // ScrollView {
    //     anchors {
    //         top: topBarInstance.dragRegionHeight

    //         left: parent.left
    //         right: parent.right
    //         bottom: parent.bottom
    //     }
    // }
}
