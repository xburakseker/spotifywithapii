import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class SongName extends StatefulWidget {
  SongName({super.key, required this.songNameList});
  String songNameList;

  @override
  State<SongName> createState() => _SongNameState();
}

class _SongNameState extends State<SongName> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 5.w, top: 2.h),
      width: 25.w,
      child: Text(
        widget.songNameList,
        style: TextStyle(
            fontSize: 18.sp, color: Colors.black, fontWeight: FontWeight.w500),
      ),
    );
  }
}
