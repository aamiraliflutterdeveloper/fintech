import 'package:fintech_app/constants/app_colors.dart';
import 'package:fintech_app/constants/assets_path.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomBottomNavBar extends StatefulWidget {
  const CustomBottomNavBar({
    required this.onTap,
    Key? key,
  }) : super(key: key);
  final Function(int index) onTap;

  @override
  State<CustomBottomNavBar> createState() => _CustomBottomNavBarState();
}

class _CustomBottomNavBarState extends State<CustomBottomNavBar> {
  int _selectedIndex = 0;
  int selected = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(),
      child: ClipRRect(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20), topRight: Radius.circular(20)),
        child: BottomAppBar(
          color: AppColors.blueDark,
          child: Row(
            children: [
              BottomNavBarItem(
                title: 'Home',
                iconPath: AssetsPath.IC_HOME,
                selectedIndex: _selectedIndex,
                onTap: () {
                  setState(() {
                    _selectedIndex = 0;
                    selected = 0;
                    widget.onTap(0);
                  });
                },
                index: 0,
              ),
              BottomNavBarItem(
                title: 'Mart',
                iconPath: AssetsPath.IC_MART,
                selectedIndex: _selectedIndex,
                onTap: () {
                  setState(() {
                    _selectedIndex = 1;
                    selected = 1;
                    widget.onTap(1);
                  });
                },
                index: 1,
              ),
              BottomNavBarItem(
                title: 'HOME_TITLE',
                selectedIndex: _selectedIndex,
                iconPath: AssetsPath.IC_MART,
                onTap: () {
                  setState(() {
                    _selectedIndex = 2;
                    selected = 2;
                    widget.onTap(2);
                  });
                },
                index: 2,
              ),
              BottomNavBarItem(
                title: 'Invite',
                iconPath: AssetsPath.IC_INVITE,
                selectedIndex: _selectedIndex,
                onTap: () {
                  setState(() {
                    _selectedIndex = 3;
                    selected = 3;
                    widget.onTap(3);
                  });
                },
                index: 3,
              ),
              BottomNavBarItem(
                title: 'Chat',
                iconPath: AssetsPath.IC_CHAT,
                selectedIndex: _selectedIndex,
                onTap: () {
                  setState(() {
                    _selectedIndex = selected;
                    widget.onTap(4);
                  });
                },
                index: 4,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class BottomNavBarItem extends StatelessWidget {
  const BottomNavBarItem({
    required this.iconPath,
    required this.title,
    required this.index,
    required this.selectedIndex,
    required this.onTap,
    Key? key,
  }) : super(key: key);
  final String iconPath;
  final String title;
  final VoidCallback onTap;
  final int selectedIndex;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(top: 10),
        child: index == 2
            ? Text('')
            : IconButton(
                icon: Column(
                  children: [
                    SvgPicture.asset(iconPath , color: index == selectedIndex ? Colors.white : null,),
                    Text(title,
                        style: TextStyle(
                            fontSize: 10,
                            color: index == selectedIndex
                                ? Colors.white
                                : AppColors.blueVariant))
                  ],
                ),
                onPressed: onTap),
      ),
    );
  }
}
