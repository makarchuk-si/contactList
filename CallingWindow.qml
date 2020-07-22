import QtQuick 2.0
import QtQuick.Window 2.0

Window {
    id: callingWindow

    width: 320
    height: 480
    visible: true
    title: qsTr("Calling...")

    Text{
        anchors.centerIn: parent
        text: qsTr("Calling...")
    }
}
