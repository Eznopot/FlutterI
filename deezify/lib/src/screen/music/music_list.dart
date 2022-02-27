import 'package:deezify/src/config/images.dart';
import 'package:deezify/src/model/album.dart';
import 'package:deezify/src/navigationDrawer/navigation_drawer.dart';
import 'package:deezify/src/screen/music/music_detail.dart';
import 'package:deezify/src/config/colors.dart';
import 'package:deezify/src/widget/custom_text_field.dart';
import 'package:flutter/material.dart';

class MusicListPage extends StatefulWidget {
  MusicListPage({Key? key}) : super(key: key);
  TextEditingController searchController = TextEditingController();

  @override
  State<StatefulWidget> createState() {
    return _MusicListPage();
  }
}

class _MusicListPage extends State<MusicListPage> {
  List<Map<String, String>> musicList = Album.musicJson;

  void changedList(String text) {
    List<Map<String, String>> tmp = [];
    musicList = Album.musicJson;
    if (text.length < 3) {
      return;
    }
    for (Map<String, String> elem in musicList) {
      if (elem["name"] != null && elem["name"]!.compareTo(text) == 0) {
        tmp.insert(0, elem);
      } else if (elem["name"] != null && elem["name"]!.compareTo(text) == 1) {
        tmp.add(elem);
      }
    }
    musicList = tmp;
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: DeezifyColors.appBarBackgound,
        elevation: 0,
        title: Text(
          "Playlist".toUpperCase(),
          style: const TextStyle(color: Colors.white),
        ),
      ),
      drawer: const navigationDrawer(),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                vertical: size.height * 0.1, horizontal: size.width * 0.1
              ),
              child: CustomTextField(
                labelText: "Search",
                hintText: "search music title",
                controller: widget.searchController,
                changed: (text) {
                  setState(() {
                    changedList(text);
                  });
                }
              ),
            ),
            Expanded(
              child: ListView.builder(
                padding: EdgeInsets.all(10.0),
                itemCount: musicList.length,
                shrinkWrap: true,
                itemBuilder: (BuildContext context, int index) {
                  Map<String, String> music = musicList.elementAt(index);
                  return ListTile(
                    title: Text(
                      "${music["name"]}",
                    ),
                    subtitle: Text(
                      "${music["artist"]}",
                    ),
                    trailing: Text(
                      "${music["duration"]}",
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => MusicDetailPage(
                            artistName: music["artist"],
                            musicName: music["name"],
                            albumImage: music["albumImage"] ??
                                DeezifyImages.origin,
                            url: music["url"] ?? "",
                          )
                        ),
                      );
                    }
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}