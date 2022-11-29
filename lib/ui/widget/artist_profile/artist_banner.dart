import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ArtistBannerWidget extends StatefulWidget {
  ArtistBannerWidget({super.key, required this.artistPhoto});
  String artistPhoto;

  @override
  State<ArtistBannerWidget> createState() => _ArtistBannerWidgetState();
}

class _ArtistBannerWidgetState extends State<ArtistBannerWidget> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: 100.w,
          height: 30.h,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(40),
                bottomRight: Radius.circular(40)),
            image: DecorationImage(
                image: NetworkImage(widget.artistPhoto), fit: BoxFit.cover),
          ),
        ),
        const Positioned(
            top: 35,
            right: 30,
            child: Icon(
              Icons.more_vert,
              size: 30,
              color: Colors.white,
            )),
        Positioned(
            top: 35,
            left: 30,
            child: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: const Icon(
                Icons.arrow_back,
                size: 30,
                color: Colors.white,
              ),
            ))
      ],
    );
  }
}
