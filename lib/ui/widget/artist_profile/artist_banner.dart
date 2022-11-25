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
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(40),
                bottomRight: Radius.circular(40)),
          ),
          child: Image.network(
            widget.artistPhoto,
            fit: BoxFit.contain,
          ),
        ),
        const Positioned(
            top: 35,
            right: 30,
            child: Icon(
              Icons.more_vert,
              size: 30,
              color: Colors.white,
            ))
      ],
    );
  }
}
