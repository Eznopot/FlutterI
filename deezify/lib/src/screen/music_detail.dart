import 'package:deezify/src/musicplayer/music_player.dart';
import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:deezify/src/config/colors.dart' as AppColors;

class MusicDetailPage extends StatefulWidget {
  @override
  _MusicDetailPageState createState() => _MusicDetailPageState();
}

class _MusicDetailPageState extends State<MusicDetailPage> {
  AudioPlayer? player;
  @override
  void initState() {
    super.initState();
    player = AudioPlayer();
  }
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size; 
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.appBarBackgound,
      ),
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: size.height*0.08,),
            Column(
              children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(40.0),
                      color: AppColors.musicBackground,
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
                                  image: NetworkImage("https://mir-s3-cdn-cf.behance.net/project_modules/fs/924faf52097223.590463d34792e.jpg"),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                        ),
                        ListTile(
                          title: Center(
                            child: Text("Music name".toUpperCase(),
                              style: GoogleFonts.nunito(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          subtitle: Center(
                            child: Text("Artist name".toUpperCase(),
                              style: TextStyle(
                                fontSize: 20,
                              ),
                            ),
                          ),
                        ),
                        MusicPlayer(musicPlayer: player,),
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