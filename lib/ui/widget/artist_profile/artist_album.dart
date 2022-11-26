import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ArtistAlbumsWidget extends StatefulWidget {
  ArtistAlbumsWidget(
      {super.key, required this.albumImage, required this.albumName});
  String albumImage;
  String albumName;

  @override
  State<ArtistAlbumsWidget> createState() => _ArtistAlbumsWidgetState();
}

class _ArtistAlbumsWidgetState extends State<ArtistAlbumsWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Container(
          margin: EdgeInsets.only(left: 5.w),
          width: 35.w,
          height: 35.w,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(widget.albumImage), fit: BoxFit.cover),
              borderRadius: BorderRadius.circular(25),
              color: Colors.grey),
        ),
        SizedBox(
          height: 1.h,
        ),
        Text(
          widget.albumName,
          style: TextStyle(fontWeight: FontWeight.w500, fontSize: 14.sp),
        ),
      ],
    );
  }
}
