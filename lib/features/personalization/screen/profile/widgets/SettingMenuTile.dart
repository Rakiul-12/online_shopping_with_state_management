import 'package:flutter/material.dart';

class SettingMenuTile extends StatelessWidget {
  const SettingMenuTile({
    super.key, required this.title,
    required this.subtitle,
    required this.icon,
    required this.onPressed,
  });

  final String title,subtitle;
  final IconData icon;
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: ListTile(
        leading: Icon(icon),
        title: Text(title,style: Theme.of(context).textTheme.titleMedium,),
        subtitle: Text(subtitle,style: Theme.of(context).textTheme.labelMedium,),
      ),
    );
  }
}