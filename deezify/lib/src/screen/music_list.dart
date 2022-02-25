import 'package:deezify/src/config/images.dart';
import 'package:deezify/src/model/album.dart';
import 'package:deezify/src/navigationDrawer/navigation_drawer.dart';
import 'package:deezify/src/screen/music_detail.dart';
import 'package:deezify/src/config/colors.dart';
import 'package:flutter/material.dart';

class MusicListPage extends StatefulWidget{
  const MusicListPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _MusicListPage();
  }
}

class _MusicListPage extends State<MusicListPage>{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: DeezifyColors.appBarBackgound,
        elevation: 0,
        title: Text("Playlist".toUpperCase(), style: TextStyle(color: Colors.white),),
      ),
      drawer: navigationDrawer(),
      body: SafeArea(
        child: ListView.builder(
          itemCount: Album.musicJson.length,
          itemBuilder: (BuildContext context, int index) {
            Map<String, String> music = Album.musicJson.elementAt(index);
            return ListTile(
              title: Text("${music["name"]}",),
              subtitle: Text("${music["artist"]}",),
              trailing: Text("${music["duration"]}",),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MusicDetailPage(
                    artistName: music["artist"], musicName: music["name"], albumImage: music["albumImage"] ?? DeezifyImages.origin, url: music["url"] ?? "",)),
                );
              }
            );
          },
        ),
      ),
    );
  }
}
