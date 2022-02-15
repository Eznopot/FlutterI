import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MusicPlayer extends StatefulWidget {
  final AudioPlayer? musicPlayer;
  const MusicPlayer({ Key? key, this.musicPlayer}) : super(key: key);

  @override
  _MusicPlayerState createState() => _MusicPlayerState();
}

class _MusicPlayerState extends State<MusicPlayer> {
  Duration _duration = Duration();
  Duration _position = Duration();
  final String path = "https://audio.jukehost.co.uk/5cki2nEpzRbgztAodvBgU3RmRIWMG80W";
  bool isPlaying = false;
  bool isPaused = false;
  bool isLoop = false;
  double value = 0.0;
  final List<IconData> _icons = [
    Icons.play_circle_fill,
    Icons.pause_circle_filled,
  ];

  @override
  void initState() {
    super.initState();
    isPlaying = true;
    widget.musicPlayer!.play(path);
    widget.musicPlayer?.onDurationChanged.listen((d) {setState(() {
      _duration = d;
    });});
    widget.musicPlayer?.onAudioPositionChanged.listen((p) {setState(() {
      _position = p;
    });});

    widget.musicPlayer!.setUrl(path);
  }

  @override
  void deactivate() {
    super.deactivate();
    widget.musicPlayer!.release();
    print('music end');
  }

  Widget btnPlay() {
    return IconButton(
      padding: const EdgeInsets.only(bottom: 10.0),
      icon: isPlaying == false ? Icon(_icons.first, size: 50.0,) : Icon(_icons.last, size: 50.0),
      onPressed: (){
        if (!isPlaying) {
          print('is playing music');
          widget.musicPlayer!.play(path);
          setState(() {
            isPlaying = true;
          });
        } else if(isPlaying){
          print('music is paused');
          widget.musicPlayer!.pause();
          setState(() {
            isPlaying = false;
          });
        }
      },
    );
  }

  Widget startMusic() {
    return Container(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          btnPlay(),
        ],
      ),
    );
  }

  void changeDurationToSecond(int second) {
    Duration newDuration = Duration(seconds: second);
    widget.musicPlayer!.seek(newDuration);
  }

  Widget musicSlider() {
    return Slider(
      activeColor: Colors.red,
      inactiveColor: Colors.grey,
      value: _position.inSeconds.toDouble(),
      min: 0.0,
      max: _duration.inSeconds.toDouble(),
      onChanged: (double v) {
        setState(() {
          changeDurationToSecond(value.toInt());
          value = v;
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20.0, right: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(_position.toString().split(".").first,
                  style: GoogleFonts.nunito(
                    fontSize: 16.0,
                  ),
                ),
                Text(_duration.toString().split(".").first,
                  style: GoogleFonts.nunito(
                    fontSize: 16.0,
                  ),
                ),
              ],
            ),
          ),
          musicSlider(),
          startMusic(),
        ],
      ),
      
    );
  }
}