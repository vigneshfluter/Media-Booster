import 'package:flutter/material.dart';

import '../video_utils.dart';
import 'my_video_page.dart';

void main() {
  runApp(const Video());
}

class Video extends StatelessWidget {
  const Video({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: Videolist.map(
              (e) => GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => Video_page(
                        Name: e['Vname'],
                        video: e['Video'],
                      ),
                    ),
                  );
                },
                child: Container(
                  height: 200,
                  width: 350,
                  margin: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey, width: 2),
                    image: DecorationImage(
                        image: AssetImage(
                          e['VImage'],
                        ),
                        fit: BoxFit.cover),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Icon(
                    Icons.play_circle_filled,
                    color: Colors.white.withOpacity(0.7),
                    size: 50,
                  ),
                ),
              ),
            ).toList(),
          ),
        ),
      ),
    );
  }
}
