import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ProfileTopWidget extends StatefulWidget {
  const ProfileTopWidget({super.key});

  @override
  State<ProfileTopWidget> createState() => _ProfileTopWidgetState();
}

class _ProfileTopWidgetState extends State<ProfileTopWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 0.5.h,
        ),
        Row(
          children: [
            SizedBox(
              width: 5.w,
            ),
            Container(
              width: 10.w,
              height: 10.w,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.grey.withOpacity(0.2),
              ),
              child: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(
                  Icons.keyboard_arrow_left_outlined,
                  size: 20.sp,
                ),
              ),
            ),
            const Spacer(),
            const Text(
              "Profile",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const Spacer(),
            const Icon(Icons.more_vert),
            SizedBox(
              width: 5.w,
            ),
          ],
        ),
        Container(
          width: 28.w,
          height: 28.w,
          margin: EdgeInsets.only(top: 1.h),
          decoration: BoxDecoration(boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 7,
              offset: const Offset(0, 3),
            ),
          ], shape: BoxShape.circle, color: Colors.grey),
        ),
        SizedBox(
          height: 1.5.h,
        ),
        const Text("deneme123@gmail.com",
            style: TextStyle(fontStyle: FontStyle.italic)),
        SizedBox(
          height: 1.5.h,
        ), //usermail

        const Text(
          "fdb123", //username
          style: TextStyle(fontSize: 21, fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: 1.5.h,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: const [
            Text("778",
                style: TextStyle(
                    fontSize: 22, fontWeight: FontWeight.bold)), //followers
            Text("243",
                style: TextStyle(
                    fontSize: 22, fontWeight: FontWeight.bold)), //following
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: const [
            Text("Followers"),
            Text("Following"),
          ],
        ),
      ],
    );
  }
}
