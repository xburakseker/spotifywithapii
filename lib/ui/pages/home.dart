import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:spotifywithapi/provider/provider.dart';
import 'package:spotifywithapi/ui/pages/categories_detail.dart';
import 'package:spotifywithapi/ui/widget/home_widgets/appbar.dart';
import 'package:spotifywithapi/ui/widget/home_widgets/artist_name.dart';
import 'package:spotifywithapi/ui/widget/home_widgets/artist_photo.dart';
import 'package:spotifywithapi/ui/widget/home_widgets/cover_page.dart';
import 'package:spotifywithapi/ui/widget/home_widgets/playlist.dart';
import 'package:spotifywithapi/ui/widget/search_screen/categories.dart';

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
  String? id;

  @override
  void initState() {
    Provider.of<GeneralViewModel>(context, listen: false).getArtistWithId();
    Provider.of<GeneralViewModel>(context, listen: false).getAlbum();
    Provider.of<GeneralViewModel>(context, listen: false).getCategories();
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
                    builder: (context, GeneralViewModel value, child) {
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
                  Container(
                    width: 90.w,
                    margin: EdgeInsets.only(bottom: 0.5.h),
                    child: Text(
                      "New Albums",
                      style: TextStyle(
                          fontSize: 17.5.sp, fontWeight: FontWeight.w600),
                    ),
                  ),
                  Consumer(
                    builder: (context, GeneralViewModel value, child) =>
                        value.isLoadingAlbum
                            ? const CircularProgressIndicator()
                            : SizedBox(
                                width: 100.w,
                                height: 32.h,
                                child: ListView.builder(
                                  physics: const BouncingScrollPhysics(),
                                  itemCount: value.albums!.albums!.length,
                                  scrollDirection: Axis.horizontal,
                                  itemBuilder: (context, index) {
                                    return Column(
                                      children: [
                                        ArtistPhoto(
                                            imageNetwork:
                                                "${value.albums!.albums![index].images![0].url}"),
                                        ArtistName(
                                            albumName:
                                                "${value.albums!.albums![index].artists![0].name}",
                                            artistName:
                                                "${value.albums!.albums![index].name}"),
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
                        "Categories",
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
                    builder: (context, GeneralViewModel value, child) {
                      return value.isLoadingCategories
                          ? const CircularProgressIndicator()
                          : SizedBox(
                              width: 90.w,
                              child: ListView.builder(
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemCount: 10,
                                itemBuilder: (context, index) {
                                  return GestureDetector(
                                    onTap: () {
                                      Provider.of<GeneralViewModel>(context,
                                              listen: false)
                                          .getCategoriesDetail(
                                              "${value.categories?.categories!.items![index].id}");
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                const CategoriesDetail(),
                                          ));
                                    },
                                    child: CategoriesWidget(
                                      id: "${value.categories!.categories!.items![index].id}",
                                      categoriesPhoto:
                                          "${value.categories!.categories!.items![index].icons![0].url}",
                                      categoriesText:
                                          "${value.categories!.categories!.items![index].name}",
                                    ),
                                  );
                                },
                              ),
                            );
                    },
                  ),
                ],
              )),
        ),
      ]),
    );
  }
}
