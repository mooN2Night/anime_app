import 'package:anime_app/core/constants/color_constant.dart';
import 'package:anime_app/core/constants/string_constant.dart';
import 'package:anime_app/core/providers/size_provider.dart';
import 'package:anime_app/core/providers/theme_provider.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_floating_bottom_bar/flutter_floating_bottom_bar.dart';
import 'package:iconly/iconly.dart';

import 'core/constants/size_constant.dart';
import 'feature/favorite_screen/presentation/pages/favorite_screen.dart';
import 'feature/main_screen/presentation/pages/main_screen.dart';
import 'feature/profile_screen/presentation/pages/profile_screen.dart';
import 'feature/schedule_screen/presentation/pages/schedule_screen.dart';

class CustomBottomBar extends StatefulWidget {
  const CustomBottomBar({super.key});

  @override
  State<CustomBottomBar> createState() => _CustomBottomBarState();
}

class _CustomBottomBarState extends State<CustomBottomBar>
    with SingleTickerProviderStateMixin {
  int _currentIndex = 0;
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
    _tabController.animation!.addListener(
      () {
        final value = _tabController.animation!.value.round();
        if (value != _currentIndex && mounted) {
          _changePage(value);
        }
      },
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isLightTheme = ThemeProvider.of(context).isLightTheme;
    final size = SizeProvider.of(context);

    if (size == null) {
      return const SizedBox.shrink();
    }
    return BottomBar(
      fit: StackFit.expand,
      body: (context, controller) => TabBarView(
        controller: _tabController,
        dragStartBehavior: DragStartBehavior.down,
        physics: const BouncingScrollPhysics(),
        children: _addScreens(controller),
      ),
      icon: (width, height) => Center(
        child: IconButton(
          padding: EdgeInsets.zero,
          onPressed: null,
          icon: Icon(
            IconlyLight.arrow_up,
            size: width,
            color: isLightTheme
                ? ColorConstant.whiteColor
                : ColorConstant.blackColor,
          ),
        ),
      ),
      reverse: false,
      showIcon: true,
      hideOnScroll: true,
      borderRadius: BorderRadius.circular(SizeConstant.standardSize),
      duration: const Duration(seconds: 1),
      curve: Curves.decelerate,
      width: size.blockSizeHorizontal * 90,
      start: 2,
      end: 0,
      offset: 20,
      barAlignment: Alignment.bottomCenter,
      barColor:
          isLightTheme ? ColorConstant.blackColor : ColorConstant.whiteColor,
      child: TabBar(
        controller: _tabController,
        indicatorColor: ColorConstant.greyColor,
        indicatorSize: TabBarIndicatorSize.label,
        dividerColor: Colors.transparent,
        labelColor:
            isLightTheme ? ColorConstant.whiteColor : ColorConstant.blackColor,
        unselectedLabelColor: ColorConstant.greyColor,
        tabs: _addIconTabs(),
      ),
    );
  }

  void _changePage(int newPage) {
    setState(() {
      _currentIndex = newPage;
    });
  }

  List<Widget> _addScreens(ScrollController scrollController) {
    return [
      MainScreen(),
      FavoriteScreen(),
      const ScheduleScreen(),
      const ProfileScreen(),
    ];
  }

  List<Widget> _addIconTabs() {
    return [
      _IconlyTabs(
        icon: IconlyLight.home,
        selectedIcon: IconlyLight.home,
        title: StringConstants.mainScreen,
        currentIndex: _currentIndex,
        selectedIndex: 0,
      ),
      _IconlyTabs(
        icon: IconlyLight.heart,
        selectedIcon: IconlyLight.heart,
        title: StringConstants.favoriteScreen,
        currentIndex: _currentIndex,
        selectedIndex: 1,
      ),
      _IconlyTabs(
        icon: IconlyLight.calendar,
        selectedIcon: IconlyLight.calendar,
        title: StringConstants.scheduleScreen,
        currentIndex: _currentIndex,
        selectedIndex: 2,
      ),
      _IconlyTabs(
        icon: IconlyLight.profile,
        selectedIcon: IconlyLight.profile,
        title: StringConstants.profileScreen,
        currentIndex: _currentIndex,
        selectedIndex: 3,
      ),
    ];
  }
}

class _IconlyTabs extends StatelessWidget {
  const _IconlyTabs({
    required this.icon,
    required this.title,
    required this.currentIndex,
    required this.selectedIndex,
    required this.selectedIcon,
  });

  final IconData icon;
  final IconData selectedIcon;
  final String title;
  final int currentIndex;
  final int selectedIndex;

  @override
  Widget build(BuildContext context) {
    final isSelected = currentIndex == selectedIndex;
    return SizedBox(
      height: 60,
      width: 85,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AnimatedAlign(
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
            alignment: isSelected ? Alignment.topCenter : Alignment.center,
            child: Icon(
              isSelected ? selectedIcon : icon,
              size: 30,
            ),
          ),
          AnimatedSize(
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
            child: isSelected
                ? Text(
                    title,
                    style: Theme.of(context).textTheme.labelMedium,
                  )
                : const SizedBox.shrink(),
          ),
        ],
      ),
    );
  }
}
