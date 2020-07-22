import QtQuick 2.12
import QtQuick.Controls 2.12

Dialog {
    id: dialog

    signal finished(string fullName, string number, bool isFavourite, string image)
    property bool isFavorite

    function createContact() {
        form.fullName.clear();
        form.number.clear();
        form.image.clear();

        dialog.title = "Add Contact";
        dialog.open();
    }

    function editContact(contact) {
        form.fullName.text = contact.fullName;
        form.number.text = contact.number;
        form.image.text = contact.image;

        dialog.isFavorite = contact.isFavourite;

        dialog.title = "Edit Contact";
        dialog.open();
    }

    x: parent.width / 2 - width / 2
    y: parent.height / 2 - height / 2

    focus: true
    modal: true
    title: "Add Contact"
    standardButtons: Dialog.Ok | Dialog.Cancel

    contentItem: ContactForm {
        id: form
    }

    onAccepted: finished(form.fullName.text, form.number.text, dialog.isFavourite, form.image.text)

    background: Rectangle {
        gradient: Gradient {
            GradientStop { position: 0 ; color: "whitesmoke" }
            GradientStop { position: 1 ; color: "white" }
        }
    }
}
