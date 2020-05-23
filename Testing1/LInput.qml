import QtQuick 2.14
import QtQuick.Controls 2.14
import QtQuick.Layouts 1.14

ColumnLayout {
    property alias title :_label.text
    property alias background : _background.color
    property alias text : textField.text

    Label{
        color:"black"
        id:_label
        font.capitalization: Font.AllUppercase
    }
    TextField{
        id: textField
        background: Rectangle{
            id:_background
            border.color: "black"
        }
        color:"black"
        Layout.fillWidth: true
    }
}
