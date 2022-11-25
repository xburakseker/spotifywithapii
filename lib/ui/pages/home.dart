import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:spotifywithapi/provider/provider.dart';
import 'package:spotifywithapi/ui/widget/home_widgets/appbar.dart';
import 'package:spotifywithapi/ui/widget/home_widgets/artist_name.dart';
import 'package:spotifywithapi/ui/widget/home_widgets/artist_photo.dart';
import 'package:spotifywithapi/ui/widget/home_widgets/cover_page.dart';
import 'package:spotifywithapi/ui/widget/home_widgets/playlist.dart';

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
  void initState() {
    Provider.of<ArtistViewModel>(context, listen: false).getArtistWithId();
    Provider.of<AlbumsViewModel>(context, listen: false).getAlbum();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 100.w,
      height: 93.h,
      child: Column(children: [
        SizedBox(
          height: MediaQuery.of(context).padding.top,
        ),
        HomePageAppBar(
            startIcon: const Icon(Icons.search),
            endIcon: const Icon(Icons.more_vert_outlined)),
        SizedBox(
          width: 100.w,
          height: 82.8.h,
          child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: [
                  SizedBox(
                    height: 3.h,
                  ),
                  Consumer(
                    builder: (context, AlbumsViewModel value, child) {
                      return value.isLoadingAlbum
                          ? const CircularProgressIndicator()
                          : CoverPage(
                              labelName: "${value.albums!.albums![1].label}",
                              albumName: "${value.albums!.albums![1].name}",
                              artistPhoto:
                                  "${value.albums!.albums![1].images![1].url}",
                            );
                    },
                  ),
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
                  Consumer(
                    builder: (context, ArtistViewModel value, child) =>
                        value.isLoadingArtistWithId
                            ? const CircularProgressIndicator()
                            : SizedBox(
                                width: 100.w,
                                height: 32.h,
                                child: ListView.builder(
                                  physics: const BouncingScrollPhysics(),
                                  itemCount: value.artists!.artists!.length,
                                  scrollDirection: Axis.horizontal,
                                  itemBuilder: (context, index) {
                                    return Column(
                                      children: [
                                        ArtistPhoto(
                                            imageNetwork: value.artists!
                                                .artists![index].images![0].url
                                                .toString()),
                                        ArtistName(
                                            artistName: value
                                                .artists!.artists![index].name
                                                .toString()),
                                      ],
                                    );
                                  },
                                )),
                  ),
                  SizedBox(
                    height: 1.h,
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
                      const Text(
                        "See more",
                        style: TextStyle(color: Colors.grey),
                      ),
                      SizedBox(
                        width: 5.w,
                      ),
                    ],
                  ),
                  Consumer(
                    builder: (context, AlbumsViewModel value, child) {
                      return value.isLoadingAlbum
                          ? const CircularProgressIndicator()
                          : SizedBox(
                              width: 100.w,
                              height: 32.h,
                              child: ListView.builder(
                                physics: const NeverScrollableScrollPhysics(),
                                itemCount: value.albums!.albums!.length,
                                itemBuilder: (context, index) {
                                  return PlayListOnHomePage(
                                    artistName:
                                        "${value.albums!.albums![index].name}",
                                    songTime: "5.33",
                                    labelName:
                                        "${value.albums!.albums![index].label}",
                                    iconPlay: GestureDetector(
                                        onTap: () {
                                          value.albums!.albums![index].tracks!
                                              .items![index].previewUrl;
                                        },
                                        child: Icon(Icons.play_arrow_outlined)),
                                  );
                                },
                              ));
                    },
                  ),
                ],
              )),
        ),
      ]),
    );
  }
}
