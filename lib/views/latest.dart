import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:media_booter/music_utils.dart';
import 'package:media_booter/video_utils.dart';
import 'package:media_booter/views/Musicpage.dart';
import 'package:media_booter/views/my_video_page.dart';

class latest extends StatefulWidget {
  const latest({Key? key}) : super(key: key);

  @override
  State<latest> createState() => _latestState();
}

class _latestState extends State<latest> {
  CarouselController carouselController = CarouselController();
  int i = 0;

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.sizeOf(context).height;
    double w = MediaQuery.sizeOf(context).width;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: h / 120),
              const Row(
                children: [
                  Icon(
                    Icons.library_music_outlined,
                  ),
                  SizedBox(width: 15),
                  Text(
                    "Latest Music",
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 15),
              CarouselSlider(
                carouselController: carouselController,
                options: CarouselOptions(
                    autoPlay: true,
                    viewportFraction: 0.63,
                    enlargeCenterPage: true,
                    onPageChanged: (val, _) {
                      setState(() {
                        i = val;
                      });
                    }),
                items: MyMusicList.map((e) => Stack(
                      children: [
                        Container(
                          height: 200,
                          width: 200,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage(e['Image']))),
                          child: IconButton(
                            onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => Musicpage(
                                        AName: e['AName'],
                                        Image: e['Image'],
                                        Music: e['Music'],
                                        Name: e['Mname'],
                                      )));
                            },
                            icon: Icon(
                              Icons.play_circle_fill_outlined,
                              size: 40,
                            ),
                          ),
                        ),
                      ],
                    )).toList(),
              ),
              const SizedBox(height: 5),
              const Row(
                children: [
                  Icon(
                    Icons.video_collection_outlined,
                  ),
                  SizedBox(width: 15),
                  Text(
                    "Latest Video",
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
              CarouselSlider(
                carouselController: carouselController,
                options: CarouselOptions(
                    autoPlay: true,
                    height: 180,
                    viewportFraction: 0.73,
                    enlargeCenterPage: true,
                    onPageChanged: (val, _) {
                      setState(() {
                        i = val;
                      });
                    }),
                items: Videolist.map((e) => Stack(
                      children: [
                        Container(
                          height: 200,
                          width: 250,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage(e['VImage']))),
                          child: IconButton(
                            onPressed: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => Video_page(
                                    Name: e['Vname'],
                                    video: e['Video'],
                                  ),
                                ),
                              );
                            },
                            icon: Icon(
                              Icons.play_circle_fill_outlined,
                              color: Colors.white.withOpacity(0.7),
                              size: 40,
                            ),
                          ),
                        ),
                      ],
                    )).toList(),
              ),
              const SizedBox(height: 5),
              const Row(
                children: [
                  Icon(
                    Icons.library_music_outlined,
                  ),
                  SizedBox(width: 15),
                  Text(
                    "Suggested Music",
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 15),
              SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  children: [
                    Column(
                      children: MyMusicList.map(
                        (e) => Card(
                          margin: const EdgeInsets.only(
                              left: 10, right: 10, top: 10),
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
                                borderSide: const BorderSide(
                                    color: Colors.transparent)),
                          ),
                        ),
                      ).toList(),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
