import QtQuick 2.3
import QtQuick.Window 2.2
import QtWebEngine 1.0

Window {
    visible: true
    width: 1920
    height: 1080
    function load(url) {
        browser.url = url;
        browser2.url = "http://www.brightsign.biz"
    }
    Rectangle {
        width: 300
        height: 1080
        color: "red"
        anchors.left: browser.right

        id: banner

        Column {
            anchors.centerIn: parent
            Text {
                id: code
                text: "Code less."
                opacity: 0.01
                rotation: 90
                font.pixelSize: 100
            }
        }

        MouseArea {
            anchors.fill: parent
            onClicked: {
                if (browser_anim.running)
                {
                    browser_anim.stop()
                    browser.rotation = 0
                }
                else
                {
                    browser_anim.start()
                }
            }
        }

        SequentialAnimation {
            id: playbanner
            running: true
            NumberAnimation { target: code; property: "opacity"; to: 1.0; duration: 200}
            NumberAnimation { target: code; property: "opacity"; to: 0.0; duration: 200}
            loops: Animation.Infinite
        }
    }

    WebEngineView {
        id: browser
        objectName: "webview"
        width:1620
        height:540
        anchors.top: buttonLabel.bottom
        //anchors.fill: parent
        SequentialAnimation {
            id: browser_anim
            running: false
            NumberAnimation { target: browser; property: "rotation"; to: 90.0; duration: 1000}
            NumberAnimation { target: browser; property: "rotation"; to: 0.0; duration: 1000}
            loops: Animation.Infinite
        }
    }

    WebEngineView {
        id: browser2
        objectName: "webview2"
        width:1620
        height:540
        anchors.top: browser.bottom
        //anchors.fill: parent
    }
}
