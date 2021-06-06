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
    ToolBar
    {
        id:toolB
        height: 40
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top:parent.top
        TitleLabel{text:"Νέος Παίχτης"}

        SaveButton
        {
            onClicked:
            {
                if(name.text != "" && surname.text != ""){
                    var exists = 0;
                    for(var i=0;i<curModel.rowCount();i++)
                    {
                        if(curModel.get(i).name===name.text && curModel.get(i).surname === surname.text && curModel.get(i).birthday === birthday.text && curModel.get(i).weight ===weight.value.toString() && curModel.get(i).height===height.value.toString())
                        {

                            exists = 1;
                        }
                    }
                    if(exists === 0){
                curModel.append({"name":name.text,"surname":surname.text,"birthday":birthday.text,"weight":weight.value.toString(),"height":height.value.toString(),"hometown":hometown.text,"telephone":telephone.text});
                    stack.pop();
                    }else{
                        messageDialog.text = "Ο παίχτης υπάρχει ήδη";
                        messageDialog.open();
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
                font.pixelSize: 16
                font.family: "Arial"
            }
            TextField
            {
                id:surname
                height:30
                font.pixelSize: 16
                font.family: "Arial"
            }

            TextField
            {
                id:birthday
                height:30
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
                minimumValue: 0
                maximumValue: 3
                stepSize:0.01
                decimals:2
            }
            TextField
            {
                id:hometown
                height:30
                font.pixelSize: 16
                font.family: "Arial"
            }
            TextField
            {
                id:telephone
                height:30
                font.pixelSize: 16
                font.family: "Arial"
            }
        }
    }
}
