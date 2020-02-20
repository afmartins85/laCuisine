import QtQuick 2.0
import QtMultimedia 5.0

Rectangle {
    width: 100
    height: 62
    color: "black"

    MediaPlayer {
           id: player
//           source: "file://video.webm"
           autoPlay: true
    }

   VideoOutput {
       id: videoOutput
       source: player
       anchors.fill: parent
   }
}
