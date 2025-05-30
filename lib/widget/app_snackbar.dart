import 'package:flutter/material.dart';

extension BuildContextHelper on BuildContext {
  appSnackBar({
    required Widget child,
    required IconData icon,
    Duration? duration,
    bool? isError,
  }) {
    return ScaffoldMessenger.of(this)
      ..removeCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          width: 450.0,
          duration: duration ?? const Duration(seconds: 2),
          behavior: SnackBarBehavior.floating,
          backgroundColor:
              isError == null ? Colors.green.shade700 : Colors.red.shade700,
          content: Row(
            spacing: 10.0,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              // Icon
              Icon(icon, color: Colors.white),
              // Content
              Flexible(child: child),
            ],
          ),
        ),
      );
  }
}
