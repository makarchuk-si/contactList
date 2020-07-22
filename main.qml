import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.12

Window {
    id: window

    property int currentContact: -1

    width: 320
    height: 480
    visible: true
    title: qsTr("Contact List")

    StackView {
        id: stackView
        anchors.fill: parent
        initialItem: mainPage

        property string callName: ""
        property string callNumber: ""
        property string callImage: "default_contact.png"

        MainPage {
            id: mainPage
        }

        CallingPage {
            id: callingPage
        }
    }
}
