import 'package:flutter/material.dart';

class SupportFeatureWidget extends StatelessWidget {
  final bool isSupport;
  final String reason_no_support;
  const SupportFeatureWidget(
      {super.key, required this.isSupport, required this.reason_no_support});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Support: ${(isSupport) ? "YES" : "NO"}"),
            Visibility(
              visible: isSupport == false,
              child: Text("Reason: ${reason_no_support}"),
            ),
          ],
        ),
      ),
    );
  }
}
