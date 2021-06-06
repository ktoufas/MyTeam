import QtQuick 2.0
import QtQuick.Controls 1.4
import QtQuick.Layouts 1.3
import QtQuick.Dialogs 1.1

Rectangle
{
    Image{
        source: "images/basket.png"
        anchors.fill: parent
    }
    property ListModel curModel
    property int playerIndex
    property string plName
    property string plSname
    property string plBDay
    property string plWeight
    property string plrHeight
    property string plHtown
    property string plPhone
    property string title

    ToolBar
    {
        id:toolB
        height: 40
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top:parent.top
        TitleLabel{text:title}

        SaveButton
        {
            onClicked:
            {
                if(name.text != "" && surname.text != ""){
                    if(title === "New Player"){
                   if(medt.playerExists(name.text,surname.text,birthday.text,weight.value.toString(),height.value.toString()))
                    {
                        messageDialog.text = "Ο παίχτης υπάρχει ήδη";
                        messageDialog.open();
                    }else{
                        medt.insertPlayer(name.text,surname.text,birthday.text,weight.value.toString(),height.value.toString(),hometown.text,telephone.text);
                            stack.pop();
                    }
                    }else{////////////////////////////////////
                        medt.updatePlayer(playerIndex,name.text,surname.text,birthday.text,weight.value.toString(),height.value.toString(),hometown.text,telephone.text);
                            stack.pop();
                    }

            } else{
                    messageDialog.text = "Παρακαλώ εισάγετε όνομα και επίθετο";
                    messageDialog.open();
                }
            }
        }
        BackButton{}
        MessageDialog {
            id: messageDialog
            title: "MyTeam"
            onAccepted: {
                messageDialog.close();
            }
        }

    }
    Row
    {

        anchors.horizontalCenter: parent.horizontalCenter
        id: infoTab
        anchors.top: toolB.bottom
        anchors.margins: 20
        spacing:20
        Column
        {
            spacing:15
            MyLabel {text:"Όνομα:"}
            MyLabel {text:"Επίθετο:"}
            MyLabel {text:"Ημερομηνία Γέννησης:\n(DD/MM/YYYY)"}
            MyLabel {text:"Βάρος:(kg)"}
            MyLabel {text:"Ύψος:(m)"}
            MyLabel {text:"Πόλη:"}
            MyLabel {text:"Τηλέφωνο:"}
        }
        Column
        {
            spacing:15
            TextField
            {
                id:name
                height:30
                text: plName
                font.pixelSize: 16
                font.family: "Arial"
            }
            TextField
            {
                id:surname
                height:30
                text: plSname
                font.pixelSize: 16
                font.family: "Arial"
            }

            TextField
            {
                id:birthday
                height:30
                text:plBDay
                placeholderText:"DD-MM-YYYY"
                inputMask: "00/00/0000"
                font.pixelSize: 16
                font.family: "Arial"
            }
            SpinBox
            {
                id:weight
                height:30
                font.pixelSize: 16
                font.family: "Arial"
                width:hometown.width
                value: plWeight
                minimumValue: 0
                maximumValue: 200
            }
            SpinBox
            {
                id:height
                height:30
                width:hometown.width
                font.pixelSize: 16
                font.family: "Arial"
                value:plrHeight
                minimumValue: 0
                maximumValue: 3
                stepSize:0.01
                decimals:2
            }
            TextField
            {
                id:hometown
                height:30
                text:plHtown
                font.pixelSize: 16
                font.family: "Arial"
            }
            TextField
            {
                id:telephone
                height:30
                text:plPhone
                font.pixelSize: 16
                font.family: "Arial"

            }
        }
    }
}
