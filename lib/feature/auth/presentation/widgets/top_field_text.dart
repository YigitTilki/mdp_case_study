import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class TopFieldText extends StatelessWidget {
  const TopFieldText({required this.title, super.key});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title.tr(),
      style: const TextStyle(
        color: Colors.grey,
        fontSize: 12,
        fontWeight: FontWeight.w500,
      ),
    );
  }
}
