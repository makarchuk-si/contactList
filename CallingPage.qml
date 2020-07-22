import QtQuick 2.15
import QtQuick.Controls 2.1
import QtGraphicalEffects 1.15

Page {
    id: root
    visible: false

    Image {
        id: contactIcon
        property bool rounded: true
        property bool adapt: true

        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: parent.top
        anchors.topMargin: 50

        width: 160
        height: 160

        source: "contact_icons/" + stackView.callImage

        layer.enabled: rounded
        layer.effect: OpacityMask {
            maskSource: Item {
                width: contactIcon.width
                height: contactIcon.height
                Rectangle {
                    anchors.centerIn: parent
                    width: contactIcon.adapt ? contactIcon.width : Math.min(contactIcon.width, contactIcon.height)
                    height: contactIcon.adapt ? contactIcon.height : width
                    radius: Math.min(width, height)
                }
            }
        }
    }

    Text {
        id: name
        text: stackView.callName
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: contactIcon.bottom
        anchors.topMargin: 10
        font.pixelSize: 20
        font.bold: true
        color: "white"
    }

    Text {
        id: number
        text: stackView.callNumber
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: name.bottom
        anchors.topMargin: 5
        font.pixelSize: 15
        color: "white"
    }

    Text {
        id: status
        text: "Connecting..."
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: number.bottom
        anchors.topMargin: 10
        font.pixelSize: 12
        color: "white"
    }

    RoundButton {
        id: cancelButton
        anchors.bottom: parent.bottom
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.margins: 10
        palette.button: "red"
        width: 50
        height: 50

        onClicked: stackView.pop(mainPage)

        Image {
            width: 30
            height: 10
            anchors.centerIn: parent
            source: "images/end_call.png"
        }
    }

    background: Rectangle {
        color: "darkslategray"
    }
}
