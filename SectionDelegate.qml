import QtQuick 2.12
import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.4

ToolBar {
    id: sectionBar

    Text {
        id: label
        text: section
        font.pixelSize: parent.height * 0.6
        anchors.left: parent.left
        anchors.leftMargin: 10
        anchors.verticalCenter: parent.verticalCenter
    }

    style: ToolBarStyle {
        background: Rectangle {
            gradient: Gradient {
                GradientStop { position: 0 ; color: "mintcream" }
                GradientStop { position: 1 ; color: "white" }
            }
        }
    }
}
