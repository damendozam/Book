import QtQuick 2.14
import QtQuick.Window 2.14
import QtQuick.Controls 2.14

Window {
    id:app
    visible: true
    width: 360
    height: 640
    title: qsTr("Ideas")
    function navigate(url){
        _stack.push(url)
    }
    function back(){
        _stack.pop()
    }
    function dataTranfered(dataIn){
        LAction.reciveData(dataIn)
    }
    StackView{
        id:_stack
        anchors.fill: parent
        initialItem: loginPage //Qt.resolvedUrl("Login.qml")
    }
    Login{
        id:loginPage
        visible: false
    }
    Sector{
        id:sector
        visible: false
        //target:lAction
    }
    /*Component{
        id:loginPage
        Login{}
    }
    Component{
        id:sector
        Sector{
            target:lAction.
        }
    }
    Component{
        id:lAction
        LAction{
            id:_lAction
        }
    }*/

}
