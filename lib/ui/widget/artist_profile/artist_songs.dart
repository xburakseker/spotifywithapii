import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ArtistSongsWidget extends StatefulWidget {
  const ArtistSongsWidget({super.key});

  @override
  State<ArtistSongsWidget> createState() => ArtistSongsWidgetState();
}

class ArtistSongsWidgetState extends State<ArtistSongsWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 2.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
              onTap: () {
                //incoming
              },
              child: Container(
                width: 8.w,
                height: 8.w,
                color: Colors.grey,
              )),
          SizedBox(
            width: 5.w,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Dont Smile At me",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
              ),
              SizedBox(
                height: 1.h,
              ),
              Text("Billie Eilish")
            ],
          ),
          Spacer(),
          IconButton(onPressed: () {}, icon: Icon(Icons.favorite))
        ],
      ),
    );
  }
}
