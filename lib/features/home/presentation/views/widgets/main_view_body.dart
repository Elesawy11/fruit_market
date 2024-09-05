import 'dart:io';
import 'package:flutter/material.dart';
import 'package:fruit_market/core/utils/colors.dart';
import 'package:fruit_market/features/home/presentation/views/constant.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';

// class MainViewBody extends StatefulWidget {
//   const MainViewBody({super.key, required this.navigationShell});
//   final StatefulNavigationShell navigationShell;

//   @override
//   State<MainViewBody> createState() => _MainViewBodyState();
// }

class MainViewBody extends StatelessWidget {
  const MainViewBody({super.key, required this.navigationShell});
  final StatefulNavigationShell navigationShell;
  // final ImagePicker imagePicker = ImagePicker();
  // File? pickedImage;

  // Future<void> pickImageFromGallery() async {
  //   final image = await imagePicker.pickImage(source: ImageSource.gallery);
  //   setState(() {
  //     pickedImage = image != null ? File(image.path) : null;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: navigationShell,
      bottomNavigationBar: BottomNavigationBar(
        fixedColor: ColorManager.green69,
        unselectedItemColor: Colors.grey,
        currentIndex: navigationShell.currentIndex,
        onTap: (index) {
          print('first index of page is : $index');

          navigationShell.goBranch(index);
          print('index of page is : $index');
        },
        items: List.generate(
          HomeConstant.destinationsList.length,
          (index) => customBootmNavigationBarItem(
            icon: Icon(
              HomeConstant.destinationsList[index][1],
            ),
            avctiveIcon: Icon(HomeConstant.destinationsList[index][0]),
            label: HomeConstant.destinationsList[index][2],
            index: index,
          ),
        ),
      ),
      // body: widget.navigationShell,
    );
  }

  BottomNavigationBarItem customBootmNavigationBarItem({
    required Widget icon,
    required Widget avctiveIcon,
    required String label,
    required int index,
  }) {
    return BottomNavigationBarItem(
      backgroundColor: Colors.white,
      icon: icon,
      label: label,
      activeIcon: avctiveIcon,
    );
  }
}
