import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import '../config/palette.dart';
import '../models/models.dart';
import 'widgets.dart';

class CustomAppBar extends StatelessWidget {
  final List<IconData> icons;
  final User user;
  final int selectedIndex;
  final void Function(int) onTap;

  const CustomAppBar({
    Key? key,
    required this.icons,
    required this.user,
    required this.selectedIndex,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      height: 65,
      decoration: const BoxDecoration(
        color: Palette.whiteColor,
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            offset: Offset(0, 2),
            blurRadius: 4,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Expanded(
            child: Text(
              'facebook',
              style: TextStyle(
                fontSize: 32.0,
                color: Palette.facebookBlue,
                fontWeight: FontWeight.bold,
                letterSpacing: -1.2,
              ),
            ),
          ),
          SizedBox(
            height: double.infinity,
            width: 600,
            child: CustomTabBar(
              icons: icons,
              selectedIndex: selectedIndex,
              onTap: onTap,
              isBottomIndicator: true,
            ),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                UserCard(user: user),
                const SizedBox(width: 12),
                RoundedIconButton(
                  icon: Icons.search,
                  onPressed: () {},
                ),
                RoundedIconButton(
                  icon: MdiIcons.facebookMessenger,
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
