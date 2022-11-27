import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class PlaylistSongWidget extends StatefulWidget {
  PlaylistSongWidget(
      {super.key,
      required this.playListPhoto,
      required this.playListName,
      required this.playListOwner});
  String playListPhoto;
  String playListName;
  String playListOwner;

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
                borderRadius: BorderRadius.circular(10),
                color: Colors.grey,
                image: DecorationImage(
                    image: NetworkImage(widget.playListPhoto),
                    fit: BoxFit.cover)),
          ),
          SizedBox(
            width: 5.w,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 65.w,
                child: Text(
                  widget.playListName,
                  style:
                      TextStyle(fontSize: 17.sp, fontWeight: FontWeight.bold),
                ),
              ),
              Text(widget.playListOwner)
            ],
          ),
          const Spacer(),
          const Icon(Icons.more_horiz)
        ],
      ),
    );
  }
}
