import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ArtisInfoWidget extends StatefulWidget {
  ArtisInfoWidget(
      {super.key,
      required this.artistName,
      required this.explain,
      required this.popularity,
      required this.followers});
  String artistName;
  String explain;
  String popularity;
  String followers;

  @override
  State<ArtisInfoWidget> createState() => _ArtisInfoWidgetState();
}

class _ArtisInfoWidgetState extends State<ArtisInfoWidget> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 72.w,
      height: 13.h,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            widget.artistName,
            style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
          ),
          Text(
              "Popularity :${widget.popularity}, Followers : ${widget.followers} "),
          Text(
            widget.explain,
            style: TextStyle(
                color: Colors.grey,
                fontSize: 15.sp,
                fontStyle: FontStyle.italic),
          )
        ],
      ),
    );
  }
}
