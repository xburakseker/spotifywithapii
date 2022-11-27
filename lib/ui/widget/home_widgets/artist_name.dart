import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ArtistName extends StatefulWidget {
  ArtistName({super.key, required this.artistName, required this.albumName});
  String artistName;
  String albumName;

  @override
  State<ArtistName> createState() => _ArtistNameState();
}

class _ArtistNameState extends State<ArtistName> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 5.w, top: 1.h),
      width: 25.w,
      alignment: Alignment.center,
      child: Column(
        children: [
          Text(
            widget.artistName,
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 16.sp,
                color: Colors.black,
                fontWeight: FontWeight.w500),
          ),
          SizedBox(
            height: 0.5.h,
          ),
          Text(
            widget.albumName,
            style: TextStyle(
                fontSize: 14.sp,
                color: Colors.grey,
                fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }
}
