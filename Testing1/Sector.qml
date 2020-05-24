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
    property bool statusChapter: false
    property bool statusParagraph: false
    property var resultString: '{"action":"","section":{"book":"","chapter":"","paragraph":""}}'
    property var resultJson: JSON.parse(resultString);
    Text{
        id:_title
        text:qsTr("Realizar \n acción")
        color:"black"
        //width: parent.width
        horizontalAlignment: Text.AlignHCenter
        font.family: "Montserrat Light"
        font.pointSize: 40
    }
    ColumnLayout{
        id:_columSector
        anchors.top: _title.bottom
        anchors.topMargin: 30
        anchors.horizontalCenter: parent.horizontalCenter
        ComboBox{
            id:comboboxBook
            displayText:"Libro"
            model: ["Adicionar","Eliminar","Actualizar","Leer"]

            onActivated:{
                _action.title="Libro "+comboboxBook.currentText
                if(comboboxBook.currentText=="Adicionar"){
                    statusChapter=true
                    listChapter.model=["Adicionar"]
                }
                if(comboboxBook.currentText=="Actualizar"){
                    statusChapter=true
                    listChapter.model=["Adicionar","Eliminar","Actualizar","Leer"]
                }
                _action.visible=true
                buttonCancelSend.visible=true
                buttonSend.visible=true
            }

        }
        ComboBox{
            id:listChapter
            visible: false
            displayText:"Capitulo"
            onActivated:{
                _action.title="Capitulo "+listChapter.currentText
                if(listChapter.currentText=="Adicionar"){
                    statusParagraph=true
                    listParagraph.model=["Adicionar"]
                }
                if(listChapter.currentText=="Actualizar"){
                    statusParagraph=true
                    listParagraph.model=["Adicionar","Eliminar","Actualizar","Leer"]
                }
                _action.visible=true
                buttonCancelSend.visible=true
                buttonSend.visible=true
            }
        }
        ComboBox{
            id:listParagraph
            visible: false
            displayText:"Parrafo"
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
                implicitWidth: 250
                implicitHeight: 150
                border.color: "black"
            }
            /*width: 50
            height: 50*/
            //contentWidth: 30
        }
        LInput{
            id:_action
            visible: false
        }
        LButton{
            id:buttonCancelSend
            Layout.alignment: Qt.AlignHCenter
            text:"Cancelar"
            visible: false
            onClicked: {
                buttonCancelSend.visible=false
                buttonSend.visible=false
            }
        }
        LButton{
            id:buttonSend
            Layout.alignment: Qt.AlignHCenter
            text:"Aceptar"
            visible: false
            onClicked: {
                if(_action.title=="Libro Adicionar"){
                    resultJson['action']+='/add/book'
                }
                if(_action.title=="Libro Eliminar"){
                    resultJson['action']='/delete/book'
                }
                if(_action.title=="Libro Actualizar"){
                    resultJson['action']+='/upload/book'
                }
                if(_action.title=="Libro Leer"){
                    resultJson['action']+='/select/book'
                }

                if(_action.title=="Capitulo Adicionar"){
                    resultJson['action']+='/add/chapter'
                }
                if(_action.title=="Capitulo Eliminar"){
                    resultJson['action']+='/add/chapter'
                }
                if(_action.title=="Capitulo Actualizar"){
                    resultJson['action']+='/upload/chapter'
                }
                if(_action.title=="Capitulo Leer"){
                    resultJson['action']+='/select/chapter'
                }

                bookBuffer=actionList
                chapterBuffer=actionList

                if(statusChapter){
                    listChapter.visible=true
                }
                if(statusParagraph){
                    listParagraph.visible=true
                }
                resultJson['section']['book']=bookBuffer
                resultJson['section']['chapter']=actionList
                resultJson['section']['paragraph']=textParagraph.text
                _action.visible=false
                buttonCancelSend.visible=false
                buttonSend.visible=false
                _action.text=''

                if(textParagraph.text.length>0){
                    console.log(resultJson['section']['paragraph'])
                    textParagraph.visible=false
                    listChapter.visible=false
                    listParagraph.visible=false
                    textParagraph.text=''
                    statusChapter=false
                    statusParagraph=false
                    resultJson['action']=''
                }
            }
        }
    }

}
