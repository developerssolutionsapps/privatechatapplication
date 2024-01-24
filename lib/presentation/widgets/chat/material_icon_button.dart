import 'package:flutter/material.dart';
import 'package:private_chat/core/app_export.dart';

Widget buildMaterialIconButton({
  required IconData icon,
  required VoidCallback onTap,
}) {
  return Material(
    clipBehavior: Clip.antiAlias,
    color: Colors.transparent,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(100.0),
    ),
    child: IconButton(
      onPressed: onTap,
      splashColor: appTheme.gray600,
      icon: Icon(
        icon,
        color: theme.colorScheme.primary,
      ),
    ),
  );
}
