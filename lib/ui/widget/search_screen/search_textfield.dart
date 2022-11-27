import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:spotifywithapi/provider/provider.dart';

class SearchTextField extends StatefulWidget {
  SearchTextField({super.key, required this.id});
  String id;

  @override
  State<SearchTextField> createState() => _SearchTextFieldState();
}

class _SearchTextFieldState extends State<SearchTextField> {
  @override
  void initState() {
    Provider.of<GeneralViewModel>(context, listen: false)
        .getSearchArtist(widget.id);
    // TODO: implement initState
    super.initState();
  }

  TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, GeneralViewModel value, child) {
        return value.isLoadingSearchArtist
            ? const CircularProgressIndicator()
            : Container(
                width: 90.w,
                height: 6.h,
                margin: EdgeInsets.only(top: 2.h),
                child: TextField(
                  onTap: () {
                    if (controller.text.isNotEmpty) {
                      print("${value.searchArtist!.artists!.items![0].name}");
                      value.getSearchArtist(controller.text);
                      widget.id = controller.text.toString();
                    }
                  },
                  controller: controller,
                  style: TextStyle(
                      fontSize: 18.sp,
                      color: Colors.grey.shade500,
                      fontWeight: FontWeight.w500),
                  cursorColor: Colors.grey.shade500,
                  cursorHeight: 3.h,
                  decoration: InputDecoration(
                    focusColor: Colors.black,
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        width: 1.5,
                        color: Colors.grey.shade500,
                      ),
                      borderRadius: BorderRadius.circular(50.0),
                    ),
                    prefixIcon: Icon(
                      Icons.search,
                      color: Colors.grey.shade500,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        width: 1.5,
                        color: Colors.grey.shade500,
                      ),
                      borderRadius: BorderRadius.circular(50.0),
                    ),
                  ),
                ),
              );
      },
    );
  }
}
