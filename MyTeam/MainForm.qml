import QtQuick 2.0
import QtQuick.Controls 1.4
import QtQuick.Layouts 1.3



Rectangle{
    Image{
        source: "images/basket.png"
        anchors.fill: parent
    }
    Component
    {
        id:addTeam
        NewTeamForm {id:teamform;}
    }

    Component
    {
        id:viewTeam
        ViewTeamForm {}
    }
    ToolBar
    {
        id:toolB
        height: 40
        width:parent.width

        anchors.right: parent.right

        TitleLabel{text:"Teams"}
        ToolButton
        {
            anchors.right: parent.right
            id:newTeamBtn
            Image
            {

                source: "images/addIcon.png"
                anchors.fill: parent
                anchors.margins: 4
            }
            onClicked:
            {
              stack.push(addTeam);
            }
        }
    }


    Rectangle
    {
        anchors.top:toolB.bottom
        anchors.bottom: parent.bottom
        anchors.right:parent.right
        anchors.left:parent.left
        anchors.margins: 10
        color:"transparent"


        ListView {
            id:teamsList
            anchors.fill: parent
            anchors.margins: 10
            spacing:10
            clip: true

            model: medt.teamModel
            delegate: Rectangle
            {
                id:c1
                width:parent.width*0.7
                height:30
                anchors.horizontalCenter:parent.horizontalCenter
                radius:3
               anchors.margins:10
                border.width:2
                border.color:"black"
                //color:"transparent"
                opacity:0.7
                Column{
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.margins: 10
                    width:parent.width
                    spacing:10
                    Text
                    {
                        horizontalAlignment: Text.AlignHCenter
                        verticalAlignment: Text.AlignVCenter
                        anchors.margins: 30
                        width:parent.width
                        color:"black"
                        text:name;
                        font.pixelSize: 24
                    }


                }
                MouseArea{
                    anchors.fill: parent
                    onClicked:
                    {
                        medt.setPlModel(name);
                        stack.push({item:viewTeam,properties:{teamName:name,teamCoach:coach,teamHome:home}});
                    }
                }
            }

        }
    }



}
