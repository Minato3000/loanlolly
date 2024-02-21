// custom_drawer_item.dart
import 'package:flutter/material.dart';
import 'package:loanlolly/widgets/custom_icon_button.dart';

enum CustomDrawerIcons { home, messenger, history, profile, logout }

class CustomDrawerItem extends StatelessWidget {
  final CustomDrawerIcons iconData;
  final String title;
  final VoidCallback onTap;

  const CustomDrawerItem({
    Key? key,
    required this.iconData,
    required this.title,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    IconData icon;
    switch (iconData) {
      case CustomDrawerIcons.home:
        icon = Icons.home_outlined;
        break;
      case CustomDrawerIcons.messenger:
        icon = Icons.messenger_outline;
        break;
      case CustomDrawerIcons.history:
        icon = Icons.history_rounded;
        break;
      case CustomDrawerIcons.profile:
        icon = Icons.person_outline_outlined;
        break;
      case CustomDrawerIcons.logout:
        icon = Icons.exit_to_app;
        break;
    }

    return CustomIconButton(
      iconData: icon,
      title: title,
      onTap: onTap,
    );
  }
}
