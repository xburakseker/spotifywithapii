import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class PlaylistSongWidget extends StatefulWidget {
  const PlaylistSongWidget({super.key});

  @override
  State<PlaylistSongWidget> createState() => _PlaylistSongWidgetState();
}

class _PlaylistSongWidgetState extends State<PlaylistSongWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 0.8.h, horizontal: 5.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
            width: 13.w,
            height: 13.w,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10), color: Colors.grey),
          ),
          SizedBox(
            width: 5.w,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Dont Smile At Me",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Text("Billie Eilish")
            ],
          ),
          Spacer(),
          Icon(Icons.more_horiz)
        ],
      ),
    );
  }
}
