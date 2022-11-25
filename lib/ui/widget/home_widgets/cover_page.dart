import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CoverPage extends StatefulWidget {
  CoverPage(
      {super.key,
      required this.albumName,
      required this.artistPhoto,
      required this.labelName});
  String albumName;
  String artistPhoto;
  String labelName;

  @override
  State<CoverPage> createState() => _CoverPageState();
}

class _CoverPageState extends State<CoverPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 90.w,
      height: 15.h,
      padding: EdgeInsets.all(20.sp),
      decoration: BoxDecoration(
          color: Colors.green, borderRadius: BorderRadius.circular(22.sp)),
      child: Row(children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              "New Album",
              style: TextStyle(color: Colors.white, fontSize: 14.sp),
            ),
            Text(
              widget.albumName,
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20.sp),
            ),
            Text(
              widget.labelName,
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 14.sp),
            )
          ],
        ),
        SizedBox(
          width: 15.w,
        ),
        Image.network(widget.artistPhoto)
      ]),
    );
  }
}
