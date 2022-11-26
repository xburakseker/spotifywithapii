import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:spotifywithapi/provider/provider.dart';
import 'package:spotifywithapi/ui/bottom_nav_bar.dart';

void main() {
  runApp(
    MultiProvider(providers: [
      ChangeNotifierProvider(
        create: (_) => GeneralViewModel(),
      ),
    ], builder: (context, child) => const MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(
      builder: (context, orientation, screenType) {
        return const MaterialApp(
          debugShowCheckedModeBanner: false,
          home: BottomNavBar(),
        );
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: 100.w,
        height: 100.h,
        color: Colors.black.withOpacity(0.5),
        child: ListView.builder(
          physics: const BouncingScrollPhysics(),
          itemCount: 15,
          itemBuilder: (context, index) {
            return Container(
              width: 90.w,
              height: 15.h,
              margin: EdgeInsets.only(top: 3.h),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10.sp),
                  boxShadow: const [
                    BoxShadow(
                        blurRadius: 1, spreadRadius: 1, offset: Offset(0, 3)),
                  ]),
              child: Row(children: [
                Container(
                  width: 10.w,
                  height: 10.w,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100.sp)),
                  child: SizedBox(),
                ),
                Column(
                  children: [Text("")],
                ),
              ]),
            );
          },
        ),
      ),
    );
  }
}
