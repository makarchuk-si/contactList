import QtQuick 2.12
import QtQuick.Controls 2.12
import ContactList 1.0

ListView {
    id: listView

    visible: true

    property bool showFavouritesOnly: false

    property int contactsInList: 8
    property real contactDelegateHeight: listView.height / contactsInList
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
        width: listView.width
        height: contactDelegateHeight
        onPressAndHold: listView.pressAndHold(index)
    }

    section.property: "fullName"
    section.criteria: ViewSection.FirstCharacter
    section.delegate: SectionDelegate {
        width: listView.width
        height: sectionDelegateHeight
    }
    section.labelPositioning: ViewSection.InlineLabels

    ScrollBar.vertical: ScrollBar { }
}
