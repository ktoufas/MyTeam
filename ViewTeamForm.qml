import QtQuick 2.0
import QtQuick.Controls 1.4
import QtQuick.Layouts 1.3

Rectangle{
    Image{
        source: "images/basket.png"
        anchors.fill: parent
    }
    property string teamName
    property string teamCoach
    property string teamHome
    Component
    {
        id:addPlayer
        EditPlayerForm{}
    }

    ToolBar
    {
        id:toolB
        height: 40
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top:parent.top
        TitleLabel{text:teamName}

        ToolButton
        {
            anchors.right: parent.right
            anchors.top: parent.top
            id:saveTeam
            width: parent.height
            height:width
            Image
            {

                source: "images/save.png"
                anchors.fill: parent
                anchors.margins: 1
            }
            onClicked:
           {
                medt.saveTeam(teamName);
                stack.pop();
            }
        }

            ToolButton
            {
                anchors.right: saveTeam.left
                anchors.top: parent.top
                id:delTeam
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
                    medt.deleteTeam(teamName);
                    stack.pop();
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
            MyLabel {text:"Όνομα Προπονητή:"}
            MyLabel {text:"Πόλη:"}
        }
        Column
        {
            spacing:15
            MyLabel {text:teamCoach}
            MyLabel {text:teamHome}
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

                    stack.push({item:addPlayer,properties:{curModel: medt.playerModel,plName:"",plSname:"",plBDay:"",plWeight:"",plHeight:"",plHtown:"",plPhone:"",title:"New Player"}});
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

                    if(medt.playerModel.rowCount()>0){
                        medt.deletePlayer(list.currentIndex);
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
                model:medt.playerModel
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
                        color:"white"
                        font.bold: true
                        horizontalAlignment: Label.AlignHCenter
                        font.pointSize: 12

                    }
                    Label
                    {
                        id:nameLabel
                        width:parent.width/2
                        horizontalAlignment: Label.AlignHCenter
                        color:"white"
                        font.bold: true
                        font.pointSize: 12
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
                    onDoubleClicked:
                    {
                         stack.push({item:addPlayer, properties:{plName:name,plSname:surname,plBDay:birthday,plWeight:weight,plrHeight:plHeight,plHtown:hometown,plPhone:telephone,title:name,playerIndex:index}});
                    }
                }
            }

        }


    }
}
}
