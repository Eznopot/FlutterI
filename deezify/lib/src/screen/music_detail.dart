import 'package:deezify/src/navigationDrawer/navigation_drawer.dart';
import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:deezify/src/config/colors.dart';

import '../musicPlayer/music_player.dart';

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
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: DeezifyColors.appBarBackgound,
      ),
      drawer: navigationDrawer(),
      body: SafeArea(
        child: Column(
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
                        Container(
                          child: Padding(
                            padding: const EdgeInsets.all(30.0),
                            child: Container(
                              height: size.height*0.35,
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
                        ),
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
                              style: TextStyle(
                                fontSize: 20,
                              ),
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
      ),
    );
  }
}