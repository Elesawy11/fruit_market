import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruit_market/features/home/presentation/views/constant.dart';
import 'package:fruit_market/features/home/presentation/views/home_view.dart';
import 'package:image_picker/image_picker.dart';

class MainViewBody extends StatefulWidget {
  const MainViewBody({super.key});

  @override
  State<MainViewBody> createState() => _MainViewBodyState();
}

class _MainViewBodyState extends State<MainViewBody>
    with TickerProviderStateMixin {
  final ImagePicker imagePicker = ImagePicker();
  File? pickedImage;

  Future<void> pickImageFromGallery() async {
    final image = await imagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      pickedImage = image != null ? File(image.path) : null;
    });
  }

  int currentPageIndexForNavigtorBar = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (index) {
          setState(() {
            currentPageIndexForNavigtorBar = index;
          });
        },
        selectedIndex: currentPageIndexForNavigtorBar,
        height: 60.h,
        destinations: List.generate(
          4,
          (index) => NavigationDestination(
            selectedIcon: Icon(
              HomeConstant.destinationsList[index][0],
            ),
            icon: Icon(
              HomeConstant.destinationsList[index][1],
            ),
            label: HomeConstant.destinationsList[index][2],
          ),
        ),
      ),
      body: <Widget>[
        const HomeView(),
      ][currentPageIndexForNavigtorBar],
    );
  }
}
