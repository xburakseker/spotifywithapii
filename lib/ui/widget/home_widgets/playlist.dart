import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class PlayListOnHomePage extends StatefulWidget {
  PlayListOnHomePage(
      {super.key,
      required this.artistName,
      required this.songTime,
      required this.labelName,
      required this.iconPlay});
  String? artistName;
  String songTime;
  Widget iconPlay;
  String labelName;

  @override
  State<PlayListOnHomePage> createState() => _PlayListOnHomePageState();
}

class _PlayListOnHomePageState extends State<PlayListOnHomePage> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 5.w,
        ),
        Container(
            margin: EdgeInsets.only(top: 2.h),
            width: 10.w,
            height: 10.w,
            alignment: Alignment.center,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100.sp),
                color: Colors.grey.withOpacity(0.3)),
            child: widget.iconPlay),
        SizedBox(
          width: 5.w,
        ),
        Container(
          alignment: Alignment.center,
          padding: EdgeInsets.only(top: 2.h),
          width: 50.w,
          height: 8.h,
          child: Column(
            children: [
              Text(
                widget.labelName,
                style:
                    TextStyle(fontSize: 16.5.sp, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 0.5.h,
              ),
              SizedBox(
                width: 20.w,
                child: Text(
                  widget.artistName!,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 14.sp, color: Colors.black.withOpacity(0.7)),
                ),
              )
            ],
          ),
        ),
        SizedBox(
          width: 5.w,
        ),
        Text(
          widget.songTime,
          style: TextStyle(fontSize: 17.sp, fontWeight: FontWeight.w400),
        ),
        SizedBox(
          width: 8.w,
        ),
        Icon(
          Icons.favorite,
          size: 20.sp,
          color: Colors.grey.withOpacity(0.8),
        )
      ],
    );
  }
}
