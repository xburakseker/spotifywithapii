import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CategoriesWidget extends StatefulWidget {
  CategoriesWidget(
      {super.key, required this.categoriesPhoto, required this.categoriesText});
  String categoriesPhoto;
  String categoriesText;

  @override
  State<CategoriesWidget> createState() => _CategoriesWidgetState();
}

class _CategoriesWidgetState extends State<CategoriesWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 1.h),
      width: 90.w,
      height: 20.h,
      alignment: Alignment.center,
      decoration: BoxDecoration(
          image: DecorationImage(
              image: NetworkImage(widget.categoriesPhoto),
              fit: BoxFit.cover,
              opacity: 0.4),
          color: Colors.grey,
          borderRadius: BorderRadius.circular(20.sp)),
      child: Text(
        widget.categoriesText,
        style: TextStyle(
            color: Colors.white, fontSize: 25.sp, fontWeight: FontWeight.bold),
      ),
    );
  }
}
