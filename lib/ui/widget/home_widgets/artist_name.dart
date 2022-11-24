import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ArtistName extends StatefulWidget {
  ArtistName({super.key, required this.artistName});
  String artistName;

  @override
  State<ArtistName> createState() => _ArtistNameState();
}

class _ArtistNameState extends State<ArtistName> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 5.w, top: 1.h),
      width: 25.w,
      child: Text(
        widget.artistName,
        style: TextStyle(
            fontSize: 18.sp, color: Colors.black, fontWeight: FontWeight.w500),
      ),
    );
  }
}
