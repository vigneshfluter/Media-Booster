import 'package:flutter/material.dart';
import 'package:media_booter/views/latest.dart';
import 'package:media_booter/views/music.dart';
import 'package:media_booter/views/video.dart';

class homepage extends StatelessWidget {
  const homepage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultTabController(
        length: 3,
        initialIndex: 0,
        child: Scaffold(
          appBar: AppBar(
            title: const Text(
              "Music & Video Player",
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            centerTitle: true,
            bottom: const TabBar(
              indicatorWeight: 3,
              indicatorSize: TabBarIndicatorSize.label,
              isScrollable: true,
              labelPadding: EdgeInsets.only(left: 30, right: 30),
              unselectedLabelColor: Colors.grey,
              tabs: [
                Tab(
                  child: Text(
                    "Latest",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                Tab(
                  child: Text(
                    "Music",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                Tab(
                  child: Text(
                    "Video",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
            elevation: 0,
          ),
          body: const TabBarView(
            children: [
              latest(),
              Music(),
              Video(),
            ],
          ),
        ),
      ),
    );
  }
}
