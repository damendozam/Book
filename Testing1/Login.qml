import QtQuick 2.14
import QtQuick.Controls 2.14
import QtQuick.Layouts 1.14

Page {
    Text{
        id:_title
        text:"Ideas"
        color:"black"
        width: parent.width
        horizontalAlignment: Text.AlignHCenter
        //y:_splash.height
        font.family: "Montserrat Light"
        font.pointSize: 40
    }

    ColumnLayout{
        id:_form
        anchors.verticalCenter: parent.verticalCenter
        anchors.centerIn: parent
        LInput{
            id:_user
            title:"User:"
        }
        LInput{
            id:_password
            title:"Password:"
        }
        LButton{
            Layout.alignment: Qt.AlignHCenter
            text:"Log-in"
            onClicked: {
                navigate(sector)
            }
        }
    }
}
