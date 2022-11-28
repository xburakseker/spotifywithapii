import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ArtistSearchView extends StatefulWidget {
  ArtistSearchView(
      {super.key,
      required this.artistPhoto,
      required this.artistName,
      required this.anyData});
  String artistPhoto;
  String artistName;
  String anyData;

  @override
  State<ArtistSearchView> createState() => _ArtistSearchViewState();
}

class _ArtistSearchViewState extends State<ArtistSearchView> {
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
                    image: NetworkImage(widget.artistPhoto),
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
                  widget.artistName,
                  style:
                      TextStyle(fontSize: 17.sp, fontWeight: FontWeight.bold),
                ),
              ),
              Text(widget.anyData)
            ],
          ),
          const Spacer(),
          const Icon(Icons.more_horiz)
        ],
      ),
    );
  }
}
