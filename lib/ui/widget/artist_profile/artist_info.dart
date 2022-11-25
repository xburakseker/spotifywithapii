import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ArtisInfoWidget extends StatefulWidget {
  ArtisInfoWidget({super.key, required this.artistName, required this.explain});
  String artistName;
  String explain;

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
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const Text("2 Album, 67 Track"),
          Text(
            widget.explain,
            style: TextStyle(color: Colors.grey, fontStyle: FontStyle.italic),
          )
        ],
      ),
    );
  }
}
