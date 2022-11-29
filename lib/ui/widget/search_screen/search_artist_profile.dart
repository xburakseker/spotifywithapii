import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class SearchArtistProfileSongs extends StatefulWidget {
  SearchArtistProfileSongs(
      {super.key,
      required this.songName,
      required this.artistName,
      required this.songImage});
  String songName;
  String artistName;
  String songImage;

  @override
  State<SearchArtistProfileSongs> createState() =>
      SearchArtistProfileSongsState();
}

class SearchArtistProfileSongsState extends State<SearchArtistProfileSongs> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 2.h, left: 5.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
              onTap: () {},
              child: Container(
                width: 12.w,
                height: 12.w,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(widget.songImage),
                        fit: BoxFit.cover),
                    borderRadius: BorderRadius.circular(220.sp)),
                child: Icon(
                  Icons.play_arrow_rounded,
                  color: Colors.white.withOpacity(0.8),
                ),
              )),
          SizedBox(
            width: 5.w,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 72.w,
                child: Text(
                  widget.songName,
                  style:
                      TextStyle(fontWeight: FontWeight.bold, fontSize: 16.sp),
                ),
              ),
              SizedBox(
                height: 1.h,
              ),
              SizedBox(width: 72.w, child: Text(widget.artistName))
            ],
          ),
        ],
      ),
    );
  }
}
