import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:spotifywithapi/provider/provider.dart';
import 'package:spotifywithapi/ui/widget/home_widgets/playlist.dart';
import 'package:spotifywithapi/ui/widget/search_screen/categories_detail.dart';

class CategoriesDetail extends StatefulWidget {
  const CategoriesDetail({super.key});

  @override
  State<CategoriesDetail> createState() => _CategoriesDetailState();
}

class _CategoriesDetailState extends State<CategoriesDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          iconTheme: const IconThemeData(color: Colors.grey),
          backgroundColor: Colors.white,
          actions: [
            const Spacer(),
            SizedBox(
              width: 30.w,
              child: Image.asset("assets/spotifylogo.png"),
            ),
            const Spacer(),
          ]),
      body: SafeArea(
        child: Column(children: [
          Consumer(
            builder: (context, GeneralViewModel value, child) {
              return value.isLoadingCategoriesDetail
                  ? const CircularProgressIndicator()
                  : SizedBox(
                      width: 100.w,
                      child: ListView.builder(
                        physics: const BouncingScrollPhysics(),
                        itemCount: 10,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return CategoriesDetailWidget(
                              labelName:
                                  "${value.categoriesDetail!.playlists!.items![index].name}",
                              artistName:
                                  "${value.categoriesDetail!.playlists!.items![index].owner!.displayName}",
                              songPhoto:
                                  "${value.categoriesDetail!.playlists!.items![index].images![0].url}");
                        },
                      ),
                    );
            },
          ),
        ]),
      ),
    );
  }
}
