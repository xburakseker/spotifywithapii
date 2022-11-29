import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ArtistSearchView extends StatefulWidget {
  ArtistSearchView({
    super.key,
    required this.artistPhoto,
    required this.artistName,
  });
  String artistPhoto;
  String artistName;

  @override
  State<ArtistSearchView> createState() => _ArtistSearchViewState();
}

class _ArtistSearchViewState extends State<ArtistSearchView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: 38.w,
      padding: EdgeInsets.symmetric(vertical: 0.8.h, horizontal: 5.w),
      margin: EdgeInsets.only(top: 2.h),
      child: Column(
        children: [
          Container(
            width: 22.w,
            height: 22.w,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50.sp),
                color: Colors.grey,
                image: DecorationImage(
                    image: NetworkImage(widget.artistPhoto),
                    fit: BoxFit.cover)),
          ),
          SizedBox(
            height: 2.w,
          ),
          SizedBox(
            child: Text(
              widget.artistName,
              style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600,
                  color: Colors.black.withOpacity(0.8)),
            ),
          ),
        ],
      ),
    );
  }
}
