import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CategoriesDetailWidget extends StatefulWidget {
  CategoriesDetailWidget(
      {super.key,
      required this.artistName,
      required this.labelName,
      required this.songPhoto});
  String? artistName;
  String songPhoto;
  String labelName;

  @override
  State<CategoriesDetailWidget> createState() => _CategoriesDetailWidgetState();
}

class _CategoriesDetailWidgetState extends State<CategoriesDetailWidget> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 5.w,
        ),
        Container(
          margin: EdgeInsets.only(top: 2.h),
          width: 13.w,
          height: 13.w,
          alignment: Alignment.center,
          decoration: BoxDecoration(
              image: DecorationImage(image: NetworkImage(widget.songPhoto)),
              borderRadius: BorderRadius.circular(10.sp),
              color: Colors.grey.withOpacity(0.3)),
        ),
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
          width: 13.w,
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
