import 'package:flutter/material.dart';
import 'package:mini_proj/src/constants/image_strings.dart';
import 'package:mini_proj/src/features/authentication/screens/add_nutrients_screen/add_nutrients.dart';
import 'package:mini_proj/src/features/authentication/screens/main_tab/select_view.dart';
import 'package:mini_proj/src/features/authentication/screens/profile_screen/profile_view.dart';
import '../../../../common_widgets/tab_button.dart';
import '../../../../constants/colors.dart';
import '../home_screen/home_view.dart';
import '../scan_food_screen/scan_food.dart';

class MainTabView extends StatefulWidget {
  const MainTabView({super.key});

  @override
  State<MainTabView> createState() => _MainTabViewState();
}

class _MainTabViewState extends State<MainTabView> {
  int selectTab = 0;
  final PageStorageBucket pageBucket = PageStorageBucket(); 
  Widget currentTab = const HomeView();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: TColor.white,
      body: PageStorage(bucket: pageBucket, child: currentTab),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: SizedBox(
        width: 70,
        height: 70,
        child: InkWell(
          onTap: () {
            selectTab = 4;
            currentTab = const AddNutrients();
            if (mounted) {
              setState(() {});
            }
          },
          child: Container(
            width: 65,
            height: 65,
            decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: TColor.primaryG,
                ),
                borderRadius: BorderRadius.circular(35),
                boxShadow: const [
                  BoxShadow(
                      color: Colors.black12,
                      blurRadius: 2,)
                ]),
            child: Icon(Icons.add,color: TColor.white, size: 35, ),
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
          child: Container(
        decoration: BoxDecoration(color: TColor.white, boxShadow: const [
          BoxShadow(color: Colors.black12, blurRadius: 2, offset: Offset(0, -2))
        ]),
        height: kToolbarHeight,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            TabButton(
                icon: homeTab,
                selectIcon: homeTabSelect,
                isActive: selectTab == 0,
                onTap: () {
                  selectTab = 0;
                  currentTab = const HomeView();
                  if (mounted) {
                    setState(() {});
                  }
                }),
            TabButton(
                icon: activityTab,
                selectIcon: activitySelect,
                isActive: selectTab == 1,
                onTap: () {
                  selectTab = 1;
                  currentTab = const SelectView();
                  if (mounted) {
                    setState(() {});
                  }
                }),

              const  SizedBox(width: 40,),
            TabButton(
                icon: cameraTab,
                selectIcon: cameraSelect,
                isActive: selectTab == 2,
                onTap: () {
                  selectTab = 2;
                   currentTab = const ScanFood();
                  if (mounted) {
                    setState(() {});
                  }
                }),
            TabButton(
                icon: profileTab,
                selectIcon: profileSelect,
                isActive: selectTab == 3,
                onTap: () {
                  selectTab = 3;
                   currentTab = const ProfileView();
                  if (mounted) {
                    setState(() {});
                  }
                })
          ],
        ),
      )),
    );
  }
}
