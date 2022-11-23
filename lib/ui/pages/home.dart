import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:spotifywithapi/ui/widget/home_widgets/appbar.dart';
import 'package:spotifywithapi/ui/widget/home_widgets/artist_name.dart';
import 'package:spotifywithapi/ui/widget/home_widgets/artist_photo.dart';
import 'package:spotifywithapi/ui/widget/home_widgets/cover_page.dart';
import 'package:spotifywithapi/ui/widget/home_widgets/song_name.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<String> newsVs = [
    "News",
    "Video",
    "Artist",
    "Podcasts",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: 100.w,
        height: 100.h,
        child: Column(children: [
          SizedBox(
            height: MediaQuery.of(context).padding.top,
          ),
          HomePageAppBar(
              startIcon: const Icon(Icons.search),
              endIcon: const Icon(Icons.more_vert_outlined)),
          SizedBox(
            width: 100.w,
            height: 90.01.h,
            child: SingleChildScrollView(
                child: Column(
              children: [
                SizedBox(
                  height: 3.h,
                ),
                const CoverPage(),
                SizedBox(
                  height: 3.h,
                ),
                SizedBox(
                    width: 100.w,
                    height: 4.h,
                    child: ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      itemCount: 4,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return Container(
                          margin: EdgeInsets.only(left: 5.w),
                          width: 25.w,
                          child: Text(
                            newsVs[index],
                            style: TextStyle(
                                fontSize: 18.sp,
                                color: Colors.black,
                                fontWeight: FontWeight.w500),
                          ),
                        );
                      },
                    )),
                SizedBox(
                    width: 100.w,
                    height: 30.h,
                    child: ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      itemCount: 4,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            const ArtistPhoto(),
                            SongName(songNameList: newsVs[index]),
                            ArtistName(artistName: newsVs[index]),
                          ],
                        );
                      },
                    )),
                SizedBox(
                  height: 4.h,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 5.w,
                    ),
                    Text(
                      "Playlist",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w500),
                    ),
                    const Spacer(),
                    Text(
                      "See more",
                      style: TextStyle(color: Colors.grey),
                    )
                  ],
                ),
              ],
            )),
          ),
        ]),
      ),
    );
  }
}
