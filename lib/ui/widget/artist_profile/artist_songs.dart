import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ArtistSongsWidget extends StatefulWidget {
  ArtistSongsWidget(
      {super.key, required this.songName, required this.artistName});
  String songName;
  String artistName;

  @override
  State<ArtistSongsWidget> createState() => ArtistSongsWidgetState();
}

class ArtistSongsWidgetState extends State<ArtistSongsWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 2.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
              onTap: () {},
              child: Container(
                width: 8.w,
                height: 8.w,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: Colors.grey.shade400,
                    borderRadius: BorderRadius.circular(100.sp)),
                child: Icon(
                  Icons.play_arrow_rounded,
                  color: Colors.black.withOpacity(0.5),
                ),
              )),
          SizedBox(
            width: 5.w,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 76.w,
                child: Text(
                  widget.songName,
                  style:
                      TextStyle(fontWeight: FontWeight.bold, fontSize: 16.sp),
                ),
              ),
              SizedBox(
                height: 1.h,
              ),
              SizedBox(width: 76.w, child: Text(widget.artistName))
            ],
          ),
        ],
      ),
    );
  }
}
