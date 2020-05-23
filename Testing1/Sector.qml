import QtQuick 2.14
import QtQuick.Controls 2.14
import QtQuick.Layouts 1.14
import QtQuick.Window 2.14

Item {
    /*signal sendData (string dataIn)
    property LAction target : null
    onTargetChanged: {
        sendData.connect(target.reciveData)
    }
    function reciveResult(dataIn){
        console.log(dataIn)
    }*/
    property string actionList: ''
    property string bookBuffer: ''
    property string chapterBuffer: ''
    property string paragraphBuffer: ''
    property var resultString: '{"action":"","section":{"book":"","chapter":"","paragraph":""}}'
    property var resultJson: JSON.parse(resultString);
    Text{
        id:_title
        text:"Realizar acción"
        color:"black"
        width: parent.width
        horizontalAlignment: Text.AlignHCenter
        font.family: "Montserrat Light"
        font.pointSize: 10
    }
    ColumnLayout{
        id:_columSector
        //anchors.horizontalCenter: _title.bottom
        anchors.centerIn: parent
        ComboBox{
            id:comboboxBook
            displayText:"Libro"
            model: ["Adicionar","Eliminar","Actualizar","Leer"]

            onActivated:{
                //sendData ("Libro "+comboboxBook.currentText)
                _action.title="Libro "+comboboxBook.currentText
                if(comboboxBook.currentText=="Adicionar"){
                    listChapter.visible=true
                    listChapter.model=["Adicionar"]
                }
                if(comboboxBook.currentText=="Actualizar"){
                    listChapter.visible=true
                    listChapter.model=["Adicionar","Eliminar","Actualizar","Leer"]
                }
                //console.log("qqqqqqqqqqqqqqqq")
                //navigate(lAction)
                _action.visible=true
                buttonCancelSend.visible=true
                buttonSend.visible=true
            }

        }
        ComboBox{
            id:listChapter
            visible: false
            displayText:"Capitulo"
            //model: ["Adicionar","Eliminar","Actualizar","Leer"]
            onActivated:{
                //sendData ("Capitulo "+listChapter.currentText)
                _action.title="Capitulo "+listChapter.currentText
                if(listChapter.currentText=="Adicionar"){
                    listParagraph.visible=true
                    listParagraph.model=["Adicionar"]
                }
                if(listChapter.currentText=="Actualizar"){
                    listParagraph.visible=true
                    listParagraph.model=["Adicionar","Eliminar","Actualizar","Leer"]
                }
                //console.log("qqqqqqqqqqqqqqqq")
                //navigate(lAction)
                _action.visible=true
                buttonCancelSend.visible=true
                buttonSend.visible=true
            }
        }
        ComboBox{
            id:listParagraph
            visible: false
            displayText:"Parrafo"
            //model: ["Adicionar","Eliminar","Actualizar","Leer"]
            onActivated: {
                textParagraph.visible=true
                buttonCancelSend.visible=true
                buttonSend.visible=true
            }
        }
        TextArea{
            id:textParagraph
            visible: false
            background: Rectangle{
                id:_backgroundTextInput
                border.color: "black"
            }
        }
        LInput{
            id:_action
            visible: false
        }
        LButton{
            id:buttonCancelSend
            Layout.alignment: Qt.AlignHCenter
            text:"Cancelar"
            onClicked: {
                //back()
                buttonCancelSend.visible=false
                buttonSend.visible=false
            }
        }
        LButton{
            id:buttonSend
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
                console.log(resultJson)
                //back()
                buttonCancelSend.visible=false
                buttonSend.visible=false
            }
        }
        /*LButton{
            id:buttonCancelSend
            visible: false
            text:"Cancelar"
            onClicked:{
                back()
            }
        }
        LButton{
            id:buttonSend
            visible: false
            text:"Enviar"
            onClicked:{
                //console.log('{"book":'++',"chapter":'++',"paragraph":'++"}")
            }
        }*/
    }

}
