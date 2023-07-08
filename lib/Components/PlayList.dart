// ignore_for_file: camel_case_types, file_names, non_constant_identifier_names, prefer_const_constructors, avoid_unnecessary_containers, iterable_contains_unrelated_type, sized_box_for_whitespace, avoid_print

import 'package:fitness_support/Components/Musicdata.dart';
import 'package:flutter/material.dart';

import '../Screens/PlayListSongs.dart';

class playListspage extends StatefulWidget {
  final List<MusicDetails>? Songs;

  const playListspage({Key? key, this.Songs}) : super(key: key);

  @override
  State<playListspage> createState() => _playListState();
}

class _playListState extends State<playListspage> {
  TextEditingController play1 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        height: MediaQuery.of(context).size.height,
        child: Column(
          children: [
            Container(
              height: 50,
              margin: EdgeInsets.all(20),
              child: TextField(
                controller: play1,
                decoration: InputDecoration(
                    label: const Text(
                      "Enter Playlist Name",
                      style: TextStyle(color: Colors.grey),
                    ),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.indigo.shade100)),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.indigo.shade100))),
              ),
            ),
            Container(
              child: ElevatedButton(
                  onPressed: () {
                    if (play1.text.isNotEmpty) {
                      if (playlistName.contains(play1)) {
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text("PlayList Already Exist")));
                      } else {
                        setState(() {
                          playlistName.add(play1.text);
                          play1.clear();
                        });
                      }
                    }
                  },
                  child: const Text('Add Playlist')),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height - 300,
              child: GestureDetector(
                onTap: () {},
                child: ListView.builder(
                  itemBuilder: (context, index) => GestureDetector(
                    onTap: () {
                      if (widget.Songs != null) {
                        Map<dynamic, dynamic> playlistdata = {
                          "name": playlistName[index],
                          "Songs": widget.Songs!
                        };
                        PlayListsArray.add(playlistdata);
                        print(PlayListsArray);
                      }
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => playListSongs(
                                    UserName: playlistName[index],
                                  )));
                    },
                    child: ListTile(
                      tileColor: Colors.indigo.shade100,
                      leading: Icon(
                        Icons.play_arrow,
                        color: Colors.indigo,
                      ),
                      title: Text(playlistName[index]),
                    ),
                  ),
                  itemCount: playlistName.length,
                  scrollDirection: Axis.vertical,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
