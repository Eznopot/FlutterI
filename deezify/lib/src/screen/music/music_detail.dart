import 'package:deezify/src/musicPlayer/music_player.dart';
import 'package:deezify/src/navigationDrawer/navigation_drawer.dart';
import 'package:deezify/src/utils/detect_device.dart';
import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:deezify/src/config/colors.dart';

class MusicDetailPage extends StatefulWidget {
  final String? musicName;
  final String? artistName;
  final String albumImage;
  final String url;

  const MusicDetailPage({Key? key, required this.musicName, required this.artistName, required this.albumImage, required this.url}) : super(key: key);

  @override
  _MusicDetailPageState createState() => _MusicDetailPageState();
}

class _MusicDetailPageState extends State<MusicDetailPage> {
  AudioPlayer? player;
  AudioCache? cachePlayer;

  @override
  void initState() {
    super.initState();
    player = AudioPlayer();
    cachePlayer = AudioCache(fixedPlayer: player);
  }

  Widget AlbumImageContrainer(double padding, double height) {
    return Container(
      child: Padding(
        padding: EdgeInsets.all(padding),
        child: Container(
          height: height,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.white, width: 10.0),
            borderRadius: BorderRadius.circular(20.0),
            image: DecorationImage(
              image: AssetImage(widget.albumImage),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }

  Widget responsiveAlbumImageContainer(Size size) {
    String deviceType = detectDevice.getDeviceType();

    if (deviceType == "Phone") {
      if (MediaQuery.of(context).orientation == Orientation.portrait){
        return AlbumImageContrainer(30.0, size.height*0.43);
      } else {
        return AlbumImageContrainer(85.0, size.height*1.55);
      }
    } else {
      if (MediaQuery.of(context).orientation == Orientation.portrait){
        return AlbumImageContrainer(30.0, size.height*0.65);
      } else {
        return AlbumImageContrainer(85.0, size.height*1.30);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(backgroundColor: DeezifyColors.appBarBackgound,),
      drawer: navigationDrawer(),
      body: OrientationBuilder(
        builder: (context, orientation) {
          return SafeArea(
            child: ListView(
              children: [
                SizedBox(height: size.height*0.08,),
                Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(40.0),
                        color: DeezifyColors.musicBackground,
                      ),
                      child: Column(
                        children: [
                          responsiveAlbumImageContainer(size),
                          ListTile(
                            title: Center(
                              child: Text(widget.musicName!.toUpperCase(),
                                style: GoogleFonts.nunito(
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            subtitle: Center(
                              child: Text(widget.artistName!.toUpperCase(),
                                style: TextStyle(fontSize: 20,),
                              ),
                            ),
                          ),
                          MusicPlayer(musicPlayer: player, url: widget.url,),
                          SizedBox(height: size.height*0.05,),
                        ],
                      ),
                    ),
                  ],
                )
              ],
            ),
          );
        },
      ),
    );
  }
}