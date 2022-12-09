import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.3

Page {
    width: parent.width
    height: parent.height

    title: qsTr("Informations")

    Image {
            source: "qrc:///Background.jpg"
            width: parent.width
            height: parent.height
    }
    ColumnLayout {
        anchors.fill: parent
        width:parent.width
        height:parent.height

          Label {
            text: '© 2022 Giulio Sorrentino'
            color: 'white'
                Layout.fillWidth: true

          }
          Label {
            text: 'Sotto licenza GPL v3 o, secondo la tua opinione, qualsiasi versione successiva.'
            color: 'white'
            Layout.fillWidth: true
      }
      Label {
        text: 'Pagina del progetto: https://github.com/numerunix/qtquickdatefrom'
        color: 'white'
        Layout.fillWidth: true
      }

   }
}
