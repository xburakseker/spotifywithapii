import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ArtistPhoto extends StatefulWidget {
  const ArtistPhoto({super.key});

  @override
  State<ArtistPhoto> createState() => _ArtistPhotoState();
}

class _ArtistPhotoState extends State<ArtistPhoto> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 5.w),
      width: 33.w,
      height: 22.h,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(22.sp), color: Colors.grey),
    );
  }
}