import QtQuick 2.4
import QtQuick.Window 2.2
import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.4

ApplicationWindow {

    visible: true
    width : 400
    height: 500
    Component
    {
        id:zero;
        MainForm {}
    }

    StackView
    {
        anchors.fill: parent
        initialItem: zero
        id: stack

    }
}
