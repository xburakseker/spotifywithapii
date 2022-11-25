import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ArtistAlbumsWidget extends StatefulWidget {
  const ArtistAlbumsWidget({super.key});

  @override
  State<ArtistAlbumsWidget> createState() => _ArtistAlbumsWidgetState();
}

class _ArtistAlbumsWidgetState extends State<ArtistAlbumsWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Container(
          width: 35.w,
          height: 15.h,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25), color: Colors.grey),
        ),
        SizedBox(
          height: 1.h,
        ),
        const Text(
          "Album Name",
          style: TextStyle(fontWeight: FontWeight.w500),
        ),
      ],
    );
  }
}
