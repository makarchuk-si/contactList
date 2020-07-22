import QtQuick 2.12
import QtQuick.Layouts 1.12
import QtQuick.Controls 2.12
import QtGraphicalEffects 1.15

ItemDelegate {
    id: delegate 

    checkable: true
    visible: !contactListView.showFavouritesOnly || isFavourite

    background: Rectangle {
        color: "white"

        Rectangle {
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 2
            anchors.horizontalCenter: parent.horizontalCenter
            width: parent.width * 0.8
            height: parent.height * 0.02
            color: "gainsboro"
        }
    }

    Label {
        id: label
        text: fullName
        font.bold: true
        font.pixelSize: parent.height / 5
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter
        elide: Text.ElideRight
        Layout.fillWidth: true
    }

    RoundButton {
        id: addToFavouritesButton
        text: isFavourite ? "★" : "☆"
        font.pixelSize: 15
        palette.button: "transparent"

        anchors.left: parent.left
        anchors.leftMargin: 10
        anchors.verticalCenter: parent.verticalCenter

        width: 15
        height: 15

        onClicked: {
            currentContact = index
            contactListView.model.set(currentContact, fullName, number, !isFavourite, image)
        }
    }

    Image {
        id: contactImg
        property bool rounded: true
        property bool adapt: true

        anchors.left: addToFavouritesButton.right
        anchors.leftMargin: 10
        anchors.verticalCenter: parent.verticalCenter

        width: delegate.height * 0.8
        height: delegate.height * 0.8

        source: "contact_icons/" + image

        layer.enabled: rounded
        layer.effect: OpacityMask {
            maskSource: Item {
                width: contactImg.width
                height: contactImg.height
                Rectangle {
                    anchors.centerIn: parent
                    width: contactImg.adapt ? contactImg.width : Math.min(contactImg.width, contactImg.height)
                    height: contactImg.adapt ? contactImg.height : width
                    radius: Math.min(width, height)
                }
            }
        }
    }

    onClicked: {
        stackView.callName = fullName
        stackView.callNumber = number
        stackView.callImage = image
        stackView.push(callingPage)
    }
}
