import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:spotifywithapi/provider/provider.dart';
import 'package:spotifywithapi/ui/widget/artist_screen/playlist_song.dart';
import 'package:spotifywithapi/ui/widget/artist_screen/profile_top.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  void initState() {
    Provider.of<GeneralViewModel>(context, listen: false).getMyPlaylist();
    Provider.of<GeneralViewModel>(context, listen: false).getUserProfile();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
      child: Column(
        children: [
          Container(
            color: Colors.grey.shade200,
            width: 100.w,
            height: 89.8.h,
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Consumer(
                    builder: (context, GeneralViewModel value, child) {
                      return value.isLoadingUserProfile
                          ? const CircularProgressIndicator()
                          : Container(
                              width: 100.w,
                              height: 37.h,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(30.sp),
                                      bottomRight: Radius.circular(30.sp))),
                              child: ProfileTopWidget(
                                userName: "${value.userProfile!.displayName}",
                                userPhoto:
                                    "${value.userProfile!.images![0].url}",
                                userFollowers:
                                    "${value.userProfile!.followers!.total}",
                              ),
                            );
                    },
                  ),
                  SizedBox(
                    height: 3.h,
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 5.w, bottom: 0.75.h),
                    child: Text(
                      "PUBLIC PLAYLISTS",
                      style: TextStyle(
                          fontSize: 16.5.sp, fontWeight: FontWeight.w700),
                    ),
                  ),
                  Consumer(
                    builder: (context, GeneralViewModel value, child) {
                      return value.isLoadingMyPlaylist
                          ? const CircularProgressIndicator()
                          : SizedBox(
                              width: double.infinity,
                              height: 80.h,
                              child: ListView.builder(
                                padding: EdgeInsets.zero,
                                scrollDirection: Axis.vertical,
                                itemCount: value.myPlaylist!.items!.length,
                                physics: const NeverScrollableScrollPhysics(),
                                itemBuilder: (context, index) {
                                  return PlaylistSongWidget(
                                    playListPhoto:
                                        "${value.myPlaylist!.items![index].images![0].url}",
                                    playListName:
                                        "${value.myPlaylist!.items![index].name}",
                                    playListOwner:
                                        "${value.myPlaylist!.items![index].owner!.displayName}",
                                  );
                                },
                              ),
                            );
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
