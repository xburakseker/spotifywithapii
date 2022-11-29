import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:spotifywithapi/provider/provider.dart';
import 'package:spotifywithapi/ui/pages/artist_view_screen.dart';
import 'package:spotifywithapi/ui/widget/search_screen/artist_view.dart';
import 'package:spotifywithapi/ui/widget/search_screen/search_artist_profile.dart';
import 'package:spotifywithapi/ui/widget/search_screen/search_textfield.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  String? id;
  @override
  void initState() {
    Provider.of<GeneralViewModel>(context, listen: false);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
      width: 100.w,
      height: 93.h,
      child: Column(children: [
        Padding(
          padding: EdgeInsets.only(left: 32.w, right: 32.w),
          child: Image.asset("assets/spotifylogo.png"),
        ),
        SearchTextField(),
        Column(
          children: [
            Consumer(
              builder: (context, GeneralViewModel value, child) {
                return value.isLoadingSearchArtist
                    ? Container()
                    : Container(
                        alignment: Alignment.center,
                        width: 100.w,
                        height: 20.h,
                        child: ListView.builder(
                          physics: const BouncingScrollPhysics(),
                          itemCount: 10,
                          scrollDirection: Axis.horizontal,
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () {
                                Provider.of<GeneralViewModel>(context,
                                        listen: false)
                                    .getArtistWithIdd(
                                        "${value.searchArtist!.artists!.items![index].id}");
                                Provider.of<GeneralViewModel>(context,
                                        listen: false)
                                    .getArtistIdAlbum(
                                        "${value.searchArtist!.artists!.items![index].id}");
                                Provider.of<GeneralViewModel>(context,
                                        listen: false)
                                    .getArtistIdTopTrack(
                                        "${value.searchArtist!.artists!.items![index].id}");

                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          ArtistSearchViewPage(),
                                    ));
                              },
                              child: value.isLoadingSearchArtist
                                  ? CircularProgressIndicator()
                                  : ArtistSearchView(
                                      artistPhoto:
                                          "${value.searchArtist!.artists!.items![index].images![0].url}",
                                      artistName:
                                          "${value.searchArtist!.artists!.items![index].name}",
                                    ),
                            );
                          },
                        ),
                      );
              },
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
      ]),
    );
  }
}
