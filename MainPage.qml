import QtQuick 2.3
import QtQuick.Controls 2.3

Page {
    id: root
    property real rightBottomButtonsDiameter: 40

    ContactDialog {
        id: contactDialog
        onFinished: {
            if (currentContact === -1)
                contactListView.model.append(fullName, number, isFavourite, image)
            else
                contactListView.model.set(currentContact, fullName, number, isFavourite, image)
        }
    }

    Menu {
        id: contactMenu
        x: parent.width / 2 - width / 2
        y: parent.height / 2 - height / 2
        modal: true

        Label {
            padding: 10
            font.bold: true
            width: parent.width
            horizontalAlignment: Qt.AlignHCenter
            text: currentContact >= 0 ? contactListView.model.get(currentContact).fullName : ""
        }
        MenuItem {
            text: "Edit..."
            onTriggered: contactDialog.editContact(contactListView.model.get(currentContact))
        }
        MenuItem {
            text: "Remove"
            onTriggered: contactListView.model.remove(currentContact)
        }
    }

    ContactListView {
        id: contactListView
        anchors.fill: parent
        onPressAndHold: {
            currentContact = index
            contactMenu.open()
        }
        visible: true
    }

    ContactGridView {
        id: contactGridView
        anchors.fill: parent
        onPressAndHold: {
            currentContact = index
            contactMenu.open()
        }
        visible: false
    }

    RoundButton {
        id: addButton
        text: "+"
        font.pixelSize: addButton.width / 2
        highlighted: true
        anchors.margins: 10
        anchors.right: parent.right
        anchors.bottom: parent.bottom
        onClicked: {
            currentContact = -1
            contactDialog.createContact()
        }
        width: rightBottomButtonsDiameter
        height: addButton.width
        background: Rectangle {
            color: "cornflowerblue"
            radius: addButton.width / 2
        }
    }

    RoundButton {
        id: favouritesButton
        text: contactListView.showFavouritesOnly ? "★" : "☆"
        font.pixelSize: gridViewButton.width / 2
        highlighted: true
        anchors.margins: 10
        anchors.right: parent.right
        anchors.bottom: addButton.top
        onClicked: {
            contactListView.showFavouritesOnly = !contactListView.showFavouritesOnly
        }
        width: rightBottomButtonsDiameter
        height: favouritesButton.width
        background: Rectangle {
            color: "cornflowerblue"
            radius: favouritesButton.width / 2
        }
    }

    Button {
        id: gridViewButton
        highlighted: true
        anchors.margins: 10
        anchors.right: parent.right
        anchors.bottom: favouritesButton.top
        width: rightBottomButtonsDiameter
        height: gridViewButton.width
        background: Rectangle {
            color: "crimson"
            radius: gridViewButton.width / 2
        }
        Image {
            width: gridViewButton.width / 2
            height: gridViewButton.width / 2
            anchors.centerIn: parent
            source: "images/grid.png"
        }
    }
}
