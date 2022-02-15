import 'package:deezify/src/screen/music_detail.dart';
import 'package:deezify/src/config/colors.dart' as AppColors;
import 'package:flutter/material.dart';

class MusicListPage extends StatefulWidget{
  const MusicListPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _MusicListPage(); //create state 
  }
}

class _MusicListPage extends State<MusicListPage>{
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.appBarBackgound,
        elevation: 0,
        title: Text("Playlist".toUpperCase(), style: TextStyle(color: Colors.white),),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ListTile(
                title: Text("Music name"),
                subtitle: Text("Artist name",),
                trailing: Text("3:40"),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MusicDetailPage()),
                  );
                }
              ),
            ],
          ),
        ),
      ),
    );
  }
}
