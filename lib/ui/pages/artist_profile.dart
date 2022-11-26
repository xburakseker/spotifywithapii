import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:spotifywithapi/provider/provider.dart';
import 'package:spotifywithapi/ui/widget/artist_profile/artist_album.dart';
import 'package:spotifywithapi/ui/widget/artist_profile/artist_banner.dart';
import 'package:spotifywithapi/ui/widget/artist_profile/artist_info.dart';
import 'package:spotifywithapi/ui/widget/artist_profile/artist_songs.dart';

class ArtistProfileScreen extends StatefulWidget {
  const ArtistProfileScreen({super.key});

  @override
  State<ArtistProfileScreen> createState() => _ArtistProfileScreenState();
}

class _ArtistProfileScreenState extends State<ArtistProfileScreen> {
  @override
  void initState() {
    Provider.of<GeneralViewModel>(context, listen: false).getAlbumDetail();
    Provider.of<GeneralViewModel>(context, listen: false).getArtistDetail();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
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
                return value.isLoadingArtistDetail
                    ? const CircularProgressIndicator()
                    : ArtistBannerWidget(
                        artistPhoto: "${value.artistDetails!.images![0].url}",
                      );
              },
            ),
            Consumer(
              builder: (context, GeneralViewModel value, child) {
                return value.isLoadingArtistDetail
                    ? const CircularProgressIndicator()
                    : Center(
                        child: ArtisInfoWidget(
                        artistName: "${value.artistDetails!.name}",
                        explain: "${value.artistDetails!.genres}",
                      ));
              },
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Albums",
                    style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    width: double.infinity,
                    height: 23.h,
                    child: ListView.builder(
                      padding: const EdgeInsets.only(top: 15),
                      itemCount: 3,
                      physics: const BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return Consumer(
                          builder: (context, GeneralViewModel value, child) {
                            return value.isLoadingAlbumDetail
                                ? const CircularProgressIndicator()
                                : ArtistAlbumsWidget(
                                    albumImage:
                                        "${value.albumDetails!.tracks![index].album!.images![index].url}",
                                    albumName:
                                        "${value.albumDetails!.tracks![index].album!.name}",
                                  );
                          },
                        );
                      },
                    ),
                  ),
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
                  SizedBox(
                    width: double.infinity,
                    height: 25.h,
                    child: ListView.builder(
                      padding: const EdgeInsets.only(top: 15),
                      itemCount: 3,
                      physics: const NeverScrollableScrollPhysics(),
                      scrollDirection: Axis.vertical,
                      itemBuilder: (context, index) {
                        return const ArtistSongsWidget();
                      },
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
