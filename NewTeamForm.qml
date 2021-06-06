import QtQuick 2.0
import QtQuick.Controls 1.4
import QtQuick.Layouts 1.3
import QtQuick.Dialogs 1.1
Rectangle{
    Image{
        source: "images/basket.png"
        anchors.fill: parent
    }
    Component
    {
        id:nPlayer
        CreatePlayerForm{}
    }
    ListModel
    {
        id: rosterModel
    }

    ToolBar
    {
        id:toolB
        height: 40
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top:parent.top
        TitleLabel{text:"New Team"}
        SaveButton
        {
            onClicked:
            {
                var pNames=[];
                var pSurnames=[];
                var pBDays=[];
                var pWeights=[];
                var pHeights=[];
                var pHometowns=[];
                var pPhones=[];
                if (medt.teamExists(t_name.text))
                {
                    messageDialog.text =  "Αυτό το όνομα ομάδας υπάρχει ήδη.\n Παρακαλώ εισάγετε ένα άλλο όνομα";
                    messageDialog.open();
                }
                else if (rosterModel.count ==0)
                {
                    messageDialog.text = "Παρακαλώ εισάγετε τουλάχιστον έναν παίχτη"
                    messageDialog.open();
                } else if (t_name.text == "")
                {
                    messageDialog.text = "Παρακαλώ εισάγετε ένα όνομα για την ομάδα"
                    messageDialog.open();
                }

                else
                {

                for(var i=0;i<rosterModel.count;i++)
                {
                  pNames[i]=rosterModel.get(i).name;
                  pSurnames[i]=rosterModel.get(i).surname;
                  pBDays[i]=rosterModel.get(i).birthday;
                  pWeights[i]=rosterModel.get(i).weight;
                  pHeights[i]=rosterModel.get(i).height;
                  pHometowns[i]=rosterModel.get(i).hometown;
                  pPhones[i]=rosterModel.get(i).telephone;
                }

                medt.insertTeam(t_name.text,t_coach.text,t_home.text,pNames,pSurnames,pBDays,pWeights,pHeights,pHometowns,pPhones);
                stack.pop();
            }

            }
        }
        MessageDialog {
            id: messageDialog
            title: "MyTeam"
            onAccepted: {
                messageDialog.close();
            }
        }

        BackButton{}

    }
    Row
    {

        anchors.horizontalCenter: parent.horizontalCenter
        id: basicInfo
        anchors.top: toolB.bottom
        anchors.margins: 20
        spacing:20
        Column
        {
            spacing:15
            MyLabel {text:"Όνομα Ομάδας:"}
            MyLabel {text:"Όνομα Προπονητή:"}
            MyLabel {text:"Πόλη:"}
        }
        Column
        {
            spacing:15
            TextField
            {
                id:t_name
                height:30
                font.pixelSize: 16
                font.family: "Arial"
            }
            TextField
            {
                id:t_coach
                height:30
                font.pixelSize: 16
                font.family: "Arial"
            }
            TextField
            {
                id:t_home
                height:30
                font.pixelSize: 16
                font.family: "Arial"
            }
        }
    }

    Rectangle
    {
        anchors.margins: 20
        width:parent.width
        color:"transparent"
        anchors.top: basicInfo.bottom
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.bottom: parent.bottom
        border.width: 1
        ToolBar
        {
            id:toolbar2
            height:30
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.top:parent.top
            anchors.margins: 1
            Label
            {
                text:"ΡΟΣΤΕΡ"
                font.pixelSize: 16
                color: "Black"
                font.family: "Arial"
                anchors.horizontalCenter: parent.horizontalCenter
            }

            ToolButton
            {
                anchors.right: parent.right
                anchors.top: parent.top
                id:newPlayer
                width: parent.height
                height:width
                Image
                {

                    source: "images/addIcon.png"
                    anchors.fill: parent
                    anchors.margins: 1
                }
                onClicked:
                {

                    stack.push({item:nPlayer,properties:{curModel: rosterModel}});
                }


            }
            ToolButton
            {
                anchors.left: parent.left
                anchors.top: parent.top
                id:removePlayer
                width: parent.height
                height:width
                Image
                {

                    source: "images/deleteIcon.png"
                    anchors.fill: parent
                    anchors.margins: 1
                }
                onClicked:
                {

                    if(rosterModel.rowCount()>0){
                    rosterModel.remove(list.currentIndex);
                }

                }
            }

        }

        Rectangle
        {

            border.width: 1
            anchors.margins: 2
            anchors.left: parent.left
            anchors.right:parent.right
            color:"transparent"
            anchors.bottom: parent.bottom
            anchors.top : toolbar2.bottom

            Component
            {
                id: highlight
                Rectangle
                {
                    width: 500; height: 60
                    color: "#1a1a1a"; radius: 5
                    y: list.currentItem.y
                }
            }

            ListView
            {
                clip:true
                id:list
                anchors.fill: parent
                highlight: highlight
                highlightFollowsCurrentItem: true
                model:rosterModel
                delegate: Item
                {

                height:20
                width: parent.width
                Row
                {
                    width:parent.width
                    spacing:5
                    anchors.horizontalCenter: parent.Center
                    anchors.verticalCenter: parent.verticalCenter
                    Label
                    {
                        id:surnameLabel
                        width:parent.width/2
                        text:surname
                        horizontalAlignment: Label.AlignHCenter
                        color:"white"
                        font.bold: true
                        font.pointSize: 12

                    }
                    Label
                    {
                        id:nameLabel
                        width:parent.width/2
                        horizontalAlignment: Label.AlignHCenter
                        font.pointSize: 12
                        font.bold: true
                        color:"white"
                        text:name
                    }
                }

                MouseArea
                {
                    anchors.fill: parent
                    onClicked:
                    {
                        list.currentIndex = index;

                    }
                }
            }

        }


    }
}
}
