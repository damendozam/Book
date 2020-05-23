import QtQuick 2.14
import QtQuick.Controls 2.14
import QtQuick.Layouts 1.14

Button {
    id:control
    property bool dark: false
    background: Rectangle {
          implicitWidth: 100
          implicitHeight: 40
          border.color: "black"
          border.width: 1
          //color:control.dark? "#0B0D24":"transparent"
          radius: 5
      }
    contentItem: Text {
          text: control.text
          font: control.font
          color: "black"
          horizontalAlignment: Text.AlignHCenter
          verticalAlignment: Text.AlignVCenter
          elide: Text.ElideRight
      }
}
