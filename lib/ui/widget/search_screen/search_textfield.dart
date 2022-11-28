import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:spotifywithapi/provider/provider.dart';

class SearchTextField extends StatefulWidget {
  SearchTextField({
    super.key,
  });

  @override
  State<SearchTextField> createState() => _SearchTextFieldState();
}

class _SearchTextFieldState extends State<SearchTextField> {
  String? id;

  TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 90.w,
      height: 6.h,
      margin: EdgeInsets.only(top: 2.h),
      child: TextField(
        controller: controller,
        onChanged: (value) {
          id = value;
          if (controller.text.isNotEmpty) {
            Future.delayed(const Duration(seconds: 1), () {
              Provider.of<GeneralViewModel>(context, listen: false)
                  .getSearchArtist(id);
            });
          }
        },
        style: TextStyle(
            fontSize: 18.sp,
            color: Colors.grey.shade500,
            fontWeight: FontWeight.w500),
        cursorColor: Colors.grey.shade500,
        cursorHeight: 3.h,
        decoration: InputDecoration(
          focusColor: Colors.black,
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              width: 1.5,
              color: Colors.grey.shade500,
            ),
            borderRadius: BorderRadius.circular(50.0),
          ),
          prefixIcon: Icon(
            Icons.search,
            color: Colors.grey.shade500,
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              width: 1.5,
              color: Colors.grey.shade500,
            ),
            borderRadius: BorderRadius.circular(50.0),
          ),
        ),
      ),
    );
  }
}
