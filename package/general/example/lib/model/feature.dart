import 'dart:async';

import 'package:flutter/material.dart';

class GeneralFeatureData {
  final IconData iconData;
  final String title;
  final FutureOr<void> Function(BuildContext context) onTap;
  const GeneralFeatureData({
    required this.iconData,
    required this.title,
    required this.onTap,
  });
}
