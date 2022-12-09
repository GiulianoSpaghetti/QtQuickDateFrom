import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.3
import Qt.labs.settings 1.0

Page {
    width: parent.width
    height: parent.width

    title: "QtQuickDateFrom"

    Settings {
            id: settings
            property string data: "2022-12-25"
        }
        Image {
                id: background
                source: "qrc:///Background.jpg"
                width: parent.width
                height: parent.height
        }
        ColumnLayout{
            width: parent.width
             height: parent.height

        RowLayout {
                    width: parent.width
                    Label {
                        text: qsTr('Insert the name')+':'
                        color: 'white'
                        Layout.fillWidth: true
                     }
                     TextField {
                        id: name
                text: settings.value('nome', 'numerone')
                        Layout.fillWidth: true
                 }
              }
              Label {
                 text: qsTr('Insert the date')
                 color: 'white'
                        Layout.fillWidth: true
              }

              DatePicker {
                  id: datePicker
                  Component.onCompleted: set(Date.parse(settings.data,
                                                        "yyyy-MM-dd")) // today
                  Layout.fillWidth: true
                  Layout.fillHeight: true
                  opacity: 0.5
              }

            Button {
                    Layout.fillWidth: true
                    text: qsTr('Calculate');
                    onClicked: {
                        var actual = datePicker.selectedDate;
                        var now= new Date();
                        var data=now-actual.getTime();
                            data=Math.floor(data / (1000 * 3600 * 24));
                            var anniversary=""
                            if (actual.getDate()==now.getDate())
                                if (actual.getMonth()==now.getMonth())
                                    anniversary=qsTr('Is your anniversary');
                                else
                                    anniversary=qsTr('Is your mesiversary');

                        result.text=qsTr('You meet')+' '+name.text+qsTr(' about ')+data+ qsTr(' days ago.');
                        result1.text=anniversary
                        settings.setValue('nome', name.text)
                            settings.setValue("data",
                                              Qt.formatDate(datePicker.selectedDate,
                                                            "yyyy-MM-dd"))
                        settings.sync
                    }
              }
              Label {
                    Layout.fillWidth: true
                id: result
                text: ''
                color: 'white'
              }
              Label {
                    Layout.fillWidth: true
                id: result1
                text: ''
                color: 'white'
              }
       }
}
