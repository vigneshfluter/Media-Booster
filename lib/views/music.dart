import 'package:flutter/material.dart';

import '../music_utils.dart';
import 'Musicpage.dart';

class Music extends StatelessWidget {
  const Music({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            Column(
              children: MyMusicList.map(
                (e) => Card(
                  margin: const EdgeInsets.only(left: 10, right: 10, top: 10),
                  elevation: 3,
                  shape: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)),
                  borderOnForeground: false,
                  child: ListTile(
                    leading: CircleAvatar(
                      radius: 30,
                      backgroundImage: AssetImage(
                        e['Image'],
                      ),
                    ),
                    title: Text(e['Mname']),
                    subtitle: Text(e["AName"]),
                    trailing: GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => Musicpage(
                                    AName: e['AName'],
                                    Image: e['Image'],
                                    Music: e['Music'],
                                    Name: e['Mname'],
                                  )));
                        },
                        child: const Icon(Icons.play_arrow)),
                    shape: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide:
                            const BorderSide(color: Colors.transparent)),
                  ),
                ),
              ).toList(),
            ),
          ],
        ),
      ),
    );
  }
}
