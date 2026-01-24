import 'package:e_commerce/utils/constants/my_colors.dart';
import 'package:flutter/material.dart';

class SettingsMenuTile extends StatelessWidget {
  const SettingsMenuTile({
    super.key,
    required this.icon,
    required this.title,
    required this.subTitle,
    this.onTap,
    this.trailingWidget,
  });

  final IconData icon;
  final String title, subTitle;
  final VoidCallback? onTap;
  final Widget? trailingWidget;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon, size: 28, color: MyColors.primary),
      title: Text(title, style: Theme.of(context).textTheme.titleMedium),
      subtitle: Text(subTitle, style: Theme.of(context).textTheme.bodySmall),
      trailing: trailingWidget,
      onTap: onTap,
    );
  }
}
