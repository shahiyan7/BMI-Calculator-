import 'package:flutter/material.dart';

import '../constant.dart';

class IconContent extends StatelessWidget {
  IconContent({@required this.label, this.icon});
  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          size: 80.0,
        ),
        SizedBox(
          height: 15.0,
        ),
        Text(label, style: klabelTextStyle),
      ],
    );
  }
}
