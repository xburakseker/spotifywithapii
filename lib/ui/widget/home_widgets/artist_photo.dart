import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ArtistPhoto extends StatefulWidget {
  ArtistPhoto({super.key, required this.imageNetwork});
  String imageNetwork = "";

  @override
  State<ArtistPhoto> createState() => _ArtistPhotoState();
}

class _ArtistPhotoState extends State<ArtistPhoto> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 5.w, top: 1.h),
      width: 33.w,
      height: 33.w,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(22.sp),
          image: DecorationImage(
            image: NetworkImage(
              widget.imageNetwork,
            ),
          )),
    );
  }
}
