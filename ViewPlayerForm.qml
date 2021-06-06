import QtQuick 2.0
import QtQuick.Controls 1.4
import QtQuick.Layouts 1.3

Rectangle{
    Image{
        source: "images/basket.png"
        anchors.fill: parent
    }
    property string playerName
    property string playerSurname
    property string playerBDay
    property string playerHeight
    property string playerWeight
    property string playerPhone
    property string playerHometown

    radius:10
    border.width:1
    color:"gray"

    Column{
        width: parent.width
        height: parent.height
        anchors.top:toolB.bottom
        spacing: 10

        Rectangle{
            id:rec1
            width:parent.width
            height:70
            color:"blue"
            radius:10
            border.width: 1
        Row
        {
            anchors.left: parent.left
            anchors.right: parent.right
            spacing :10

            Text
            {
                text:"Name"
                color:"orange"
            }

            Text
            {
                id:pName
                text:playerName
            }
        }
        }
        Row
        {
            anchors.left: parent.left
            anchors.right: parent.right
            spacing :10
            Text
            {
                color:"orange"
                text:"Surname"
            }
            Text
            {
                id:pSurname
                text:playerSurname
            }
        }
        Row
        {
            anchors.left: parent.left
            anchors.right: parent.right
            spacing :10
            Text
            {
                color:"orange"
                text:"Date of Birth"
            }
            Text
            {
                id:pBDay
                text:playerBDay
            }
        }
        Row
        {
            anchors.left: parent.left
            anchors.right: parent.right
            spacing :10
            Text
            {
                color:"orange"
                text:"Height"
            }
            Text
            {
                id:pHeight
                text:playerHeight
            }
        }
        Row
        {
            anchors.left: parent.left
            anchors.right: parent.right
            spacing :10
            Text
            {
                color:"orange"
                text:"Weight"
            }
            Text
            {
                id:pWeight
                text:playerWeight
            }
        }
        Row
        {
            anchors.left: parent.left
            anchors.right: parent.right
            spacing :10
            Text
            {
                color:"orange"
                text:"Hometown"
            }
            Text
            {
                id:phometown
                text:playerHometown
            }
        }
        Row
        {
            anchors.left: parent.left
            anchors.right: parent.right
            spacing :10
            Text
            {
                color:"orange"
                text:"Phone"
            }
            Text
            {
                id:pPhone
                text:playerPhone
            }
        }
    }
    ToolBar
    {
        id:toolB
        height: 40
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top:parent.top
        TitleLabel  {text:playerName}
        BackButton{}
    }
}

