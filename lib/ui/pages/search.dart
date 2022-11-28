import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:spotifywithapi/provider/provider.dart';
import 'package:spotifywithapi/ui/pages/artist_view_screen.dart';
import 'package:spotifywithapi/ui/widget/search_screen/artist_view.dart';
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
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(children: [
          Padding(
            padding: EdgeInsets.only(left: 32.w, right: 32.w),
            child: Image.asset("assets/spotifylogo.png"),
          ),
          SearchTextField(),
          Consumer(
            builder: (context, GeneralViewModel value, child) {
              return value.isLoadingSearchArtist
                  ? Container()
                  : SizedBox(
                      width: 100.w,
                      child: ListView.builder(
                        itemCount: 5,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              Provider.of<GeneralViewModel>(context,
                                      listen: false)
                                  .getArtistWithAlbum(
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
                                    anyData:
                                        "${value.searchArtist?.artists!.items![index].followers!.total}"),
                          );
                        },
                      ),
                    );
            },
          )
        ]),
      ),
    );
  }
}
