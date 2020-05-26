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
    property string bookBuffer: ''
    property string chapterBuffer: ''
    property string paragraphBuffer: ''
    property bool statusChapter: false
    property bool statusParagraph: false
    property var resultString: '{"action":{"book":"","chapter":"","paragraph":""},"section":{"book":"","chapter":"","paragraph":""}}'
    property var resultJson: JSON.parse(resultString);
    property var stringSplit: ['','']
    property var stringActions: '{"Adicionar":"add/","Eliminar":"delete/","Actualizar":"upload/","Leer":"select/","Libro":"book","Capitulo":"chapter","Parrafo":"paragraph"}'
    property var jsonActions: JSON.parse(stringActions)

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
                _action.title="Parrafo "+listParagraph.currentText
                textParagraph.visible=true
                buttonCancelSend.visible=true
                buttonSend.visible=true
            }
        }
        ScrollView{
            id:textParagraph
            visible: false
            Layout.alignment: Qt.AlignHCenter
            width: 250
            height: 150
            TextField{
                id:textParagraph_
                color: "black"
                text: " "
                placeholderText: "                                           "
                background: Rectangle{
                    id:_backgroundTextInput
                    border.color: "black"
                }
                wrapMode: TextArea.Wrap
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
                stringSplit=_action.title.split(' ')

                resultJson['action'][jsonActions[stringSplit[0]]]=jsonActions[stringSplit[1]]

                if(stringSplit[0]==='Libro'){
                    bookBuffer=_action.text
                }
                if(stringSplit[0]==='Capitulo'){
                    chapterBuffer=_action.text
                }

                if(statusChapter){
                    listChapter.visible=true
                }
                if(statusParagraph){
                    listParagraph.visible=true
                }
                resultJson['section']['book']=bookBuffer
                resultJson['section']['chapter']=chapterBuffer
                resultJson['section']['paragraph']=textParagraph.text
                _action.visible=false
                buttonCancelSend.visible=false
                buttonSend.visible=false
                _action.text=''
                console.log(resultJson['action']['book']+resultJson['action']['chapter']+resultJson['action']['paragraph'])
                if(jsonActions[stringSplit[1]]==='delete/'){
                    resultJson['section']['paragraph']=" "
                    console.log(resultJson['action'])
                    console.log(resultJson['section']['book']+' / '+resultJson['section']['chapter']+' / '+resultJson['section']['paragraph'])
                    console.log('Esta seguro de eliminarlo?')
                }
                if(textParagraph_.text.length>0){
                    console.log(resultJson['section']['book'])
                    textParagraph.visible=false
                    listChapter.visible=false
                    listParagraph.visible=false
                    textParagraph_.text=''
                    statusChapter=false
                    statusParagraph=false
                    resultJson['action']=''
                }
            }
        }
    }

}
