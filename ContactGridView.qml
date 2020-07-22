import QtQuick 2.12
import QtQuick.Controls 2.12
import ContactList 1.0

GridView {
    id: gridView

    visible: false

    property bool showFavouritesOnly: false

    property int contactsInList: 8
    property real contactDelegateHeight: gridView.height / contactsInList
    property real sectionDelegateHeight: 25

    signal pressAndHold(int index)

    width: 320
    height: 480

    focus: true
    boundsBehavior: Flickable.StopAtBounds

    model: ContactListProvider {
        id: contactModel
    }

    delegate: ContactDelegate {
        id: contactDelegate
        width: gridView.width
        height: contactDelegateHeight
        onPressAndHold: gridView.pressAndHold(index)
    }

    ScrollBar.vertical: ScrollBar { }
}
