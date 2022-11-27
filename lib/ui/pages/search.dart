import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:spotifywithapi/provider/provider.dart';
import 'package:spotifywithapi/ui/widget/search_screen/search_textfield.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  void initState() {
    Provider.of<GeneralViewModel>(context, listen: false).getSearchArtist("");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, GeneralViewModel value, child) {
        return value.isLoadingSearchArtist
            ? const CircularProgressIndicator()
            : Container(
                padding:
                    EdgeInsets.only(top: MediaQuery.of(context).padding.top),
                width: 100.w,
                height: 93.h,
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(children: [
                    Padding(
                      padding: EdgeInsets.only(left: 32.w, right: 32.w),
                      child: Image.asset("assets/spotifylogo.png"),
                    ),
                    SearchTextField(id: ""),
                  ]),
                ),
              );
      },
    );
  }
}
