import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:spotifywithapi/provider/provider.dart';
import 'package:spotifywithapi/ui/widget/artist_profile/artist_album.dart';
import 'package:spotifywithapi/ui/widget/artist_profile/artist_banner.dart';
import 'package:spotifywithapi/ui/widget/artist_profile/artist_info.dart';
import 'package:spotifywithapi/ui/widget/artist_profile/artist_songs.dart';
import 'package:spotifywithapi/ui/widget/search_screen/search_artist_profile.dart';

class ArtistSearchViewPage extends StatefulWidget {
  ArtistSearchViewPage({
    super.key,
  });

  @override
  State<ArtistSearchViewPage> createState() => _ArtistSearchViewPageState();
}

class _ArtistSearchViewPageState extends State<ArtistSearchViewPage> {
  @override
  void initState() {
    Provider.of<GeneralViewModel>(context, listen: false);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
        width: 100.w,
        height: 93.h,
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Consumer(
                builder: (context, GeneralViewModel value, child) {
                  return value.isLoadingArtistWithIdd
                      ? const CircularProgressIndicator()
                      : ArtistBannerWidget(
                          artistPhoto: "${value.artistWithIdd!.images![0].url}",
                        );
                },
              ),
              Consumer(
                builder: (context, GeneralViewModel value, child) {
                  return value.isLoadingArtistWithIdd
                      ? const CircularProgressIndicator()
                      : Center(
                          child: ArtisInfoWidget(
                          followers: "${value.artistWithIdd!.followers!.total}",
                          popularity: "${value.artistWithIdd!.popularity}",
                          artistName: "${value.artistWithIdd!.name}",
                          explain: "${value.artistWithIdd!.genres}",
                        ));
                },
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Albums",
                      style:
                          TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
                    ),
                    Consumer(builder: (context, GeneralViewModel value, child) {
                      return value.isLoadingArtistIdAlbum
                          ? const CircularProgressIndicator()
                          : SizedBox(
                              width: double.infinity,
                              height: 23.h,
                              child: ListView.builder(
                                padding: const EdgeInsets.only(top: 15),
                                itemCount: value.artistIdAlbum!.items!.length,
                                physics: const BouncingScrollPhysics(),
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, index) {
                                  return ArtistAlbumsWidget(
                                    albumImage:
                                        "${value.artistIdAlbum!.items![index].images![0].url}",
                                    albumName:
                                        "${value.artistIdAlbum!.items![index].name}",
                                  );
                                },
                              ),
                            );
                    }),
                    SizedBox(
                      height: 3.h,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text(
                          "Songs",
                          style: TextStyle(
                              fontSize: 19, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "See More",
                          style: TextStyle(
                              color: Colors.grey,
                              fontSize: 16,
                              fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                    Consumer(
                      builder: (context, GeneralViewModel value, child) {
                        return value.isLoadingArtistIdTopTracks
                            ? CircularProgressIndicator()
                            : SizedBox(
                                width: double.infinity,
                                child: ListView.builder(
                                  shrinkWrap: true,
                                  padding: const EdgeInsets.only(top: 15),
                                  itemCount: 10,
                                  physics: const NeverScrollableScrollPhysics(),
                                  scrollDirection: Axis.vertical,
                                  itemBuilder: (context, index) {
                                    return SearchArtistProfileSongs(
                                      songImage:
                                          "${value.artistIdTopTracks!.tracks![index].album!.images![0].url}",
                                      artistName:
                                          "${value.artistIdTopTracks!.tracks![index].album!.artists![0].name}",
                                      songName:
                                          "${value.artistIdTopTracks!.tracks![index].name}",
                                    );
                                  },
                                ),
                              );
                      },
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
