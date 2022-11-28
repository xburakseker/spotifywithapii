import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:spotifywithapi/provider/provider.dart';
import 'package:spotifywithapi/ui/widget/artist_profile/artist_banner.dart';

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
                  return value.isLoadingArtistWithAlbum
                      ? const CircularProgressIndicator()
                      : ArtistBannerWidget(
                          artistPhoto:
                              "${value.artistWithAlbum!.items![0].images![0].url}",
                        );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
