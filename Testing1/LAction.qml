import QtQuick 2.14
import QtQuick.Controls 2.14
import QtQuick.Layouts 1.14

Item {
    signal sendResult (string dataIn)
    /*property Sector target : null
    onTargetChanged: {
        sendResult.connect(target.reciveResult)
    }*/
    property string actionList: ''
    property string bookBuffer: ''
    property string chapterBuffer: ''
    property string paragraphBuffer: ''
    property var resultString: '{"action":"","section":{"book":"","chapter":"","paragraph":""}}'
    property var resultJson: JSON.parse(resultString);

    function reciveData(dataIn){
        _action.title=dataIn
        actionList=dataIn
    }

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
            id:_action
        }
        LButton{
            Layout.alignment: Qt.AlignHCenter
            text:"Cancelar"
            onClicked: {
                back()
            }
        }
        LButton{
            Layout.alignment: Qt.AlignHCenter
            text:"Aceptar"
            onClicked: {
                if(actionList=="Libro Adicionar"){
                    resultJson.action='/add/book/'
                    bookBuffer=actionList
                }
                if(actionList=="Libro Eliminar"){
                    resultJson.action='/delete/book/'
                    bookBuffer=actionList
                }
                if(actionList=="Libro Actualizar"){
                    resultJson.action='/upload/book/'
                    bookBuffer=actionList
                }
                if(actionList=="Libro Leer"){
                    resultJson.action='/select/book/'
                    bookBuffer=actionList
                }

                if(actionList=="Capitulo Adicionar"){
                    resultJson.action='/add/chapter/'
                    chapterBuffer=actionList
                }
                if(actionList=="Capitulo Eliminar"){
                    resultJson.action='/add/chapter/'
                    chapterBuffer=actionList
                }
                if(actionList=="Capitulo Actualizar"){
                    resultJson.action='/upload/chapter/'
                    chapterBuffer=actionList
                }
                if(actionList=="Capitulo Leer"){
                    resultJson.action='/select/chapter/'
                    chapterBuffer=actionList
                }

                resultJson.section.book=bookBuffer
                resultJson.section.chapter=actionList
                //sendResult(resultJson)
                back()
            }
        }
    }
    Connections{
        target: sector

    }
}
