// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

class SectionTitle extends StatelessWidget {
  final String title;

  const SectionTitle({
    required this.title,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Align(
        alignment: Alignment.topLeft,
        child: Text(title,
        style: Theme.of(context).textTheme.headline5,)),
    );
  }
}

