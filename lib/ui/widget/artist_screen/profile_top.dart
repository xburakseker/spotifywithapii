import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ProfileTopWidget extends StatefulWidget {
  ProfileTopWidget(
      {super.key,
      required this.userName,
      required this.userPhoto,
      required this.userFollowers});
  String userName;
  String userPhoto;
  String userFollowers;

  @override
  State<ProfileTopWidget> createState() => _ProfileTopWidgetState();
}

class _ProfileTopWidgetState extends State<ProfileTopWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 2.h,
        ),
        Row(
          children: [
            const Spacer(),
            SizedBox(
              width: 10.w,
            ),
            const Text(
              "Profile",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const Spacer(),
            Container(
                margin: EdgeInsets.only(right: 5.w),
                child: const Icon(Icons.more_vert)),
          ],
        ),
        Container(
          width: 28.w,
          height: 28.w,
          margin: EdgeInsets.only(top: 1.5.h),
          decoration: BoxDecoration(
              image: DecorationImage(image: NetworkImage(widget.userPhoto)),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: const Offset(0, 3),
                ),
              ],
              shape: BoxShape.circle,
              color: Colors.grey),
        ),
        SizedBox(
          height: 1.5.h,
        ),

        SizedBox(
          height: 1.5.h,
        ), //usermail

        Text(
          widget.userName, //username
          style: const TextStyle(fontSize: 21, fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: 1.5.h,
        ),

        Column(
          children: [
            Text(widget.userFollowers,
                style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold)),
            Text("Followers",
                style: TextStyle(fontSize: 16.sp, color: Colors.grey)),
          ],
        ),
      ],
    );
  }
}
