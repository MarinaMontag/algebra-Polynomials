import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12



Window {
    id:window
    visible: true
    width: 640
    height: 480
    title: qsTr("Algebra")
    color: "#414141"
    FontLoader { id: engine; source:"qrc:/fonts/LEngineer-Regular.otf"}

    ComboBox {
        id: control
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: parent.top
        anchors.margins: 30
        width: 400
        height: 30
        editable: true
        model: ["Додавання двох многочленiв", "Вiднiмання двох многочленiв", "Множення двох многочленiв"]
        font.family: "engine"
        font.pixelSize: 24


        delegate: ItemDelegate {
            id:itemDelegate
            width: control.width
            contentItem: Text {
                text: modelData
                color:  "#FFD700"
                font: control.font
                elide: Text.ElideRight
                verticalAlignment: Text.AlignVCenter

            }
            highlighted: control.highlightedIndex === index
            background: Rectangle{
                anchors.fill: parent
                color: itemDelegate.highlighted? "#272727" : "#626262"
            }
        }

        indicator: Canvas { // стрелочка

            id: canvas
            x: control.width - width - control.rightPadding
            y: control.topPadding + (control.availableHeight - height) / 2
            width: 12
            height: 8
            contextType: "2d"


            Connections {
                target: control
                onPressedChanged: canvas.requestPaint()
            }

            onPaint: {
                context.reset();
                context.moveTo(0, 0);
                context.lineTo(width, 0);
                context.lineTo(width / 2, height);
                context.closePath();
                context.fillStyle = control.pressed ? "#BA9901" : "#FFD700";
                context.fill();
            }
        }

        contentItem: Text { // текст текущего элемента
            leftPadding: 5 // отступ слева текущего элемента
            rightPadding: control.indicator.width + control.spacing

            text: control.displayText
            font: control.font
            color: control.pressed ? "#BA9901" : "#FFD700"
            verticalAlignment: Text.AlignVCenter
            elide: Text.ElideRight

        }

        background: Rectangle { //background текущего элемента

            implicitWidth: 120
            implicitHeight: 40
            color: "#272727"
            border.color: control.pressed ? "#BA9901" : "#FFD700"
            border.width: control.visualFocus ? 2 : 1
            radius: 2
        }

        popup: Popup {
            y: control.height - 1
            width: control.width
            implicitHeight: contentItem.implicitHeight
            padding: 1

            contentItem: ListView {
                clip: true
                implicitHeight: contentHeight
                model: control.popup.visible ? control.delegateModel : null
                currentIndex: control.highlightedIndex

                ScrollIndicator.vertical: ScrollIndicator { }
            }

            // background для делегата (не нажатого)
            background: Rectangle {
                border.color: "#000000"
                radius: 2
            }
        }
    }





        TextField{
            id:inputField

            width: 400
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.bottom: accept.top
            anchors.margins: 40

            selectByMouse: true


            background: Rectangle{
                color: "#272727"
            }
            font.family: "engine"
            font.pixelSize: 26
            color: "#FFD700"
            horizontalAlignment: Text.AlignHCenter
            anchors.topMargin: 80
            placeholderText: "Ваш вираз"
            placeholderTextColor: "#BA9901"

        }
        MouseArea{
            id:accept
            anchors.margins: 40
            anchors.bottom: resultInfo.top
            anchors.horizontalCenter: parent.horizontalCenter



            width:name.width+70
            height: name.height+20
            // anchors.centerIn: parent
            onClicked: {
                bgImage.opacity=0.4
            }

            onEntered: {
                bgImage.opacity=0.6
            }
            onExited: {
                bgImage.opacity=1
            }

            Image {
                id: bgImage
                anchors.fill: parent
                smooth: true
                source:  "/images/background2.svg"
                /*"/images/background_image.png"*/
            }
            Text {
                id: name
                text: qsTr("Calculate")
                font.family: "engine"
                font.pointSize: 26
                anchors.left:parent.left
                anchors.leftMargin: 10
                anchors.verticalCenter: parent.verticalCenter
                color: "#FFD700"

            }

        }
        Rectangle{
            id:resultInfo
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.bottom: parent.bottom
            anchors.bottomMargin:100
            width:500
            height: resultText.height+15
            Image {
                id: resultImage
                anchors.fill: parent
                smooth: true
                source:  "qrc:/images/resultBackGround.svg"

            }
            Text {
                id: resultText
                text: qsTr("Result:")
                font.family: "engine"
                font.pointSize: 26
                anchors.left:parent.left
                anchors.leftMargin: 10
                anchors.verticalCenter: parent.verticalCenter
                color: "#FFD700"
            }
            TextField {
                id: resultOutputText
                background: Rectangle{
                    visible: false
                   // color: "#272727"
                }
                readOnly: true
                selectByMouse: true
                text: qsTr("Troubles de la tete")
                font.family: "engine"
                font.pointSize: 26
                anchors.left:resultText.right
                anchors.leftMargin: 90
                anchors.verticalCenter: parent.verticalCenter
                color: "#FFD700"
            }
        }
}






